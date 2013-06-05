//
//  MUS147Voice_BLITSaw.h
//  ucimusic147-2
//
//  Created by Yurika Mulase on 6/4/13.
//  Copyright (c) 2013 UCI Music 147. All rights reserved.
//

#import "MUS147Voice.h"

@interface MUS147Voice_BLITSaw : MUS147Voice{
    Float64 p_;
    Float64 rate_;
    Float64 m_;
    Float64 a_;
    Float64 phase_;

    Float64 C2_;
    Float64 state_;
}

@end
