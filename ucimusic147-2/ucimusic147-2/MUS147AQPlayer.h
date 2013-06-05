//
//  MUS147AQPlayer.h
//  Music147_2013
//
//  Created by Kojiro Umezaki on 4/4/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <AudioToolbox/AudioToolbox.h>
#import <Foundation/Foundation.h>

@class MUS147Voice;
@class MUS147Effect_Delay;
@class MUS147Effect_Limiter;

// number of buffers used by system
#define kNumBuffers     3

// number of possible voices
#define kNumVoices      2

//number of possible synth voices
#define kNumVoices_Synth 2

#define kNumEffects     3

// sample rate
#define kSR			22050.

@interface MUS147AQPlayer : NSObject {

	AudioQueueRef				queue;
	AudioQueueBufferRef			buffers[kNumBuffers];
	AudioStreamBasicDescription	dataFormat;
    
    UInt8 synthVoiceType;
    
    MUS147Voice* voice[kNumVoices];

    MUS147Voice* voice_synth[kNumVoices_Synth];
    MUS147Voice* voice_synth_blitsaw[kNumVoices_Synth];
    
    MUS147Effect_Delay* effectDelay;
    MUS147Effect_Limiter* effectLimiter;
}

@property (nonatomic,readwrite) UInt8 synthVoiceType;


-(void)setup;

-(OSStatus)start;
-(OSStatus)stop;

-(MUS147Voice*)getVoice:(UInt8)pos;
-(MUS147Voice*)getSynthVoice;

-(void)fillAudioBuffer:(Float64*)buffer :(UInt32)num_samples;

@end
