//
//  MUS147Voice_BLITSaw.m
//  ucimusic147-2
//
//  Created by Yurika Mulase on 6/4/13.
//  Copyright (c) 2013 UCI Music 147. All rights reserved.
//

#import "MUS147Voice_BLITSaw.h"

#import "MUS147AQPlayer.h"

@implementation MUS147Voice_BLITSaw

-(id)init
{
    self = [super init];
    
    [self setFreq:220.];
    state_ = -0.5 * a_;
    
    return self;
}

-(void)setFreq:(Float64)_freq
{
    [super setFreq:_freq];
    
    a_ = m_ / p_;
    C2_ = 1. / p_;
}

-(void)addToAudioBuffer:(Float64*)buffer :(UInt32)num_samples
{
      for (UInt32 i = 0; i < num_samples; i++)
    {
        Float64 s = 0.;
        
        Float64 denominator = sin( phase_ );
        if ( fabs(denominator) <= 1e-12 ) {
            s = a_;
        } else {
            s =  sin( m_ * phase_ );
            s /= p_ * denominator;
        }
        s += state_ - C2_;
        state_ = s * 0.995;
        
        // update the envelope by one sample
        [env update:1];
        
        buffer[i] += amp * env.output * s;
        
        phase_ += rate_;
        if ( phase_ >= M_PI ) phase_ -= M_PI;
    }
}


@end
