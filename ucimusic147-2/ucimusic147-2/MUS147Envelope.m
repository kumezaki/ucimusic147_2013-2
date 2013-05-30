//
//  MUS147Envelope.m
//  ucimusic147-2
//
//  Created by Yurika Mulase on 5/29/13.
//  Copyright (c) 2013 UCI Music 147. All rights reserved.
//

#import "MUS147Envelope.h"

#define kSR			22050.

@implementation MUS147Envelope

@synthesize attack;
@synthesize release;

@synthesize output;

-(void)setAttack:(Float64)seconds
{
	attack = seconds;
	delta_attack = 1. / (seconds * kSR);
}

-(void)setRelease:(Float64)seconds
{
	release = seconds;
	delta_release = -1. / (seconds * kSR);
}

-(void)update:(UInt32)num_samples
{
	output += (delta * num_samples);
    
	if (output >= 1.0) { output = 1.0; delta = 0.0; }
	else if (output <= 0.0) { output = 0.0; delta = 0.0; }
}

-(void)on
{
	delta = delta_attack;
}

-(void)off
{
	delta = delta_release;
}


@end
