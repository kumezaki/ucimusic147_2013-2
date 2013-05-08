//
//  MUS147Effect.h
//  ucimusic147-2
//
//  Created by Eddie Huang on 5/8/13.
//  Copyright (c) 2013 UCI Music 147. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "MUS147AQPlayer.h"

// delay audio buffer
#define kMaxDelayTime 5.0
#define kMaxDelaySamples (UInt32)(kSR * kMaxDelayTime)

@interface MUS147Effect : NSObject {
    Float64 delayAudioBuffer[kMaxDelaySamples];
    
    Float64 delayTime;
    UInt32 delaySamples;
    
    Float64 delayAmp;
    
    UInt32 writePos;
    UInt32 readPos;
}

-(void)processAudioBuffer:(Float64*)buffer:(UInt32)num_samples;

@end
