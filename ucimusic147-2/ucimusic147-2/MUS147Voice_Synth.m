//
//  MUS147Voice_Synth.m
//  Music147_2013
//
//  Created by Kojiro Umezaki on 4/26/13.
//  Copyright (c) 2013 Kojiro Umezaki. All rights reserved.
//

#import "MUS147Voice_Synth.h"

@implementation MUS147Voice_Synth

-(void)fillAudioBuffer:(Float64*)buffer :(UInt32)num_samples
{
    // compute normalized angular frequency
    Float64 deltaNormPhase = freq / 22050.;
    
    // iterate through each element in the buffer
    for (UInt32 i = 0; i < num_samples; i++)
    {
        // assign value of sinusoid at phase position to buffer element
		buffer[i] += amp * sin(normPhase * 2 * M_PI);
        
        // adding harmonics for sawtooth.
        // should use low pass with -6b (1/2 amplitude) per octave
        for (UInt32 j = 2; j < 10; j++)
            buffer[i] += amp/j * sin(normPhase * 2 * M_PI * j);
        
        // advance the phase position
		normPhase += deltaNormPhase;
    }
}

@end
