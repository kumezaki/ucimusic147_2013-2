//
//  MUS147Effect_Delay.m
//  ucimusic147-2
//
//  Created by Eddie Huang on 5/8/13.
//  Copyright (c) 2013 UCI Music 147. All rights reserved.
//

#import "MUS147Effect_Delay.h"

@implementation MUS147Effect_Delay

-(id) init
{
    self = [super init];
    
    delayTime = 0.7;
    delaySamples = delayTime * kSR;
    
    delayAmp = 0.2;
    
    writePos = 0;
    readPos = kMaxDelaySamples - delaySamples;
    
    return self;
}

-(void)processAudioBuffer:(Float64*)buffer :(UInt32)num_samples
{
    // read block first for feedback delay
    for (UInt32 i = 0; i < num_samples; i++)
    buffer[i] += delayAmp * delayAudioBuffer[(readPos+i)%kMaxDelaySamples];

    readPos += num_samples;
    readPos %= kMaxDelaySamples;
    //------------

    // write block
    for (UInt32 i = 0; i < num_samples; i++)
    delayAudioBuffer[(writePos+i)%kMaxDelaySamples] = buffer[i];

    writePos += num_samples;
    writePos %= kMaxDelaySamples;
    //--------
}
@end
