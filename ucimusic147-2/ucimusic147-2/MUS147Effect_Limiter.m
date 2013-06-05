//
//  MUS147Effect_Limiter.m
//  ucimusic147-2
//
//  Created by Yurika Mulase on 6/5/13.
//  Copyright (c) 2013 UCI Music 147. All rights reserved.
//

#import "MUS147Effect_Limiter.h"

@implementation MUS147Effect_Limiter


-(id)init
{
    self = [super init];
    
    maxAmp = 0.999;
    
    return self;
}

-(void)processAudioBuffer:(Float64*)buffer :(UInt32)num_samples
{
    for (UInt32 i = 0; i < num_samples; i++)
    {
        if (buffer[i] > maxAmp)
            buffer[i] = maxAmp;
        if (buffer[i] < -maxAmp)
            buffer[i] = -maxAmp;
    }
}

@end
