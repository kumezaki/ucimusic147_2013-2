//
//  MUS147Effect_Limiter.h
//  ucimusic147-2
//
//  Created by Yurika Mulase on 6/5/13.
//  Copyright (c) 2013 UCI Music 147. All rights reserved.
//

#import "MUS147Effect.h"

@interface MUS147Effect_Limiter : MUS147Effect
{
    Float32 maxAmp;
}

-(void)processAudioBuffer:(Float64*)buffer :(UInt32)num_samples;

@end
