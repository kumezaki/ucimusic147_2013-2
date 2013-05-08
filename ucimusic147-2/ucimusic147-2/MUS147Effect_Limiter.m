//
//  MUS147Effect_Limiter.m
//  ucimusic147-2
//
//  Created by Eddie Huang on 5/8/13.
//  Copyright (c) 2013 UCI Music 147. All rights reserved.
//

#import "MUS147Effect_Limiter.h"

@implementation MUS147Effect_Limiter

-(id) init
{
    self = [super init];
    
    max_amp = 0.6;
    
    return self;
}

-(void)processAudioBuffer:(Float64*)buffer:(UInt32)num_samples
{
    for(UInt32 i = 0; i < num_samples; i++)
    {
        if (buffer[i] > max_amp)
            buffer[i] = max_amp;
        if (buffer[i] < -max_amp)
            buffer[i] = -max_amp;
        
    }
}

@end
