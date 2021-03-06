//
//  MUS147Voice_Synth.m
//  Music147_2013
//
//  Created by Kojiro Umezaki on 4/26/13.
//  Copyright (c) 2013 Kojiro Umezaki. All rights reserved.
//

#import "MUS147Voice_Synth.h"

#import "MUS147AQPlayer.h"

@implementation MUS147Voice_Synth

-(void)addToAudioBuffer:(Float64*)buffer :(UInt32)num_samples
{
    // compute normalized angular frequency
    Float64 deltaNormPhase = freq / kSR;
    
    // iterate through each element in the buffer
    for (UInt32 i = 0; i < num_samples; i++)
    {
         [env update:1];
        
        // assign value of sinusoid at phase position to buffer element
        buffer[i] += amp * env.output * sin(normPhase * 2 * M_PI);
        
        // lazy sawtooth
//        for (UInt16 j = 1; j < 3; j++)
//            buffer[i] += amp/(j+1) * env.output * sin(normPhase * 2 * j * M_PI);
        
//        buffer[i] *= env.output;
        // NSLog(@"env %f", env.output);
        
        // advance the phase position
		normPhase += deltaNormPhase;
    }
}

@end
