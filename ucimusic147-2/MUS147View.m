//
//  MUS147View.m
//  Music147_2013
//
//  Created by Kojiro Umezaki on 5/3/13.
//  Copyright (c) 2013 Kojiro Umezaki. All rights reserved.
//

#import "MUS147View.h"

#import "MUS147Event_Touch.h"

#import "MUS147AQPlayer.h"

#import "MyScale.h"

#import "MUS147Effect_BiQuad.h"

#import "MUS147Effect_Delay.h"

extern MUS147AQPlayer* aqp;

@implementation MUS147View

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

-(void)awakeFromNib
{
    [[UIAccelerometer sharedAccelerometer] setDelegate:self];
}

-(void)doTouchesOn:(NSSet *)touches withEvent:(UIEvent *)event
{
    // NSLog(@"let's go to the pub =D");
    for (UITouch* t in touches)
    {
        SInt8 t_pos = [self getTouchPos:t];
        if (t_pos < 0)
        {
            t_pos = [self addTouch:t];
            if (t_pos < 0)
            {
                NSLog(@"could not add touch");
                continue;
            }
            else
                voice[t_pos] = [aqp getSynthVoiceWithPos:t_pos];
        }

        MUS147Voice* v = voice[t_pos];

        CGPoint pt = [t locationInView:self];
        Float64 x = pt.x/self.bounds.size.width;
        Float64 y = pt.y/self.bounds.size.height;
        
        if (y < .5) { // top half
            int section = (int)(x * 26); // 26 available "keys"
            int noteNumber;
            switch((ScaleType)aqp.currentScaleType)
            {
                // noteNumber = 12 * octave# + noteCount in the "octave"
                case penta:
                    noteNumber = (int)(section/6)*12 + pentaScale[section%6];
                    break;
                case blue:
                    noteNumber = (int)(section/8)*12 + blueScale[section%8];
                    break;
                case Maj:
                    noteNumber = (int)(section/8)*12 + majScale[section%8];
                    break;
                case harmin:
                    noteNumber = (int)(section/8)*12 + harminScale[section%8];
                    break;
                case natmin:
                    noteNumber = (int)(section/8)*12 + natminScale[section%8];
                    break;
                default:
                    break;
            }
            
            // account for first note in the scale
            noteNumber += noteNumberOf(aqp.currentKey,2); 
            
            if (v != nil)
            {
                v.amp = [MUS147Event_Touch yToAmp:(y/2)];
                
                // float freq = [MUS147Event_Touch xToFreq:x];
                
                float freq = freqOf(noteNumber);
                // NSLog(@"freq is %f", freq);
                
                v.freq = freq;
                if (!v.isOn) {
                   // NSLog(@"voice on");
                    [v on];
                }
            }
            
            if (aqp.sequencer.recording)
                [aqp.sequencer addTouchEvent:x :y :YES :t_pos];
        }
        else // bottom half of the screen triggers chords of the selected key
        {
            int section = (int)(x * 7) + 1; // 7 sections, compensate for 0-index
            int scaleDegree = majScale[section - 1];
            int* thisChord;
            switch (section) 
            {
                // 1∆9 2-7 1/3 3M 4∆7 5.7 6-7 7m7b5
                case 1:
                    thisChord = chord[Maj2];
                    break;
                case 2:
                    thisChord = chord[min];
                    break;
                case 3:
                    if(y < .75)
                        thisChord = chord[dom7];
                    else
                        thisChord = chord[firstInv];
                    break;
                case 4:
                    thisChord = chord[Maj7];
                    break;
                case 5:
                    thisChord = chord[dom7];
                    break;
                case 6:
                    thisChord = chord[min7];
                    break;
                case 7:
                    thisChord = chord[m7b5];
                    break;
            }
            
            // loop to add notes in the chord
            for(UInt16 i = 0; i < 4; i++)
            {
                float amp = .1;
                MUS147Voice* v = [aqp getSynthVoiceWithPos:(i+2)];
                
                // noteNumber = key#(tonic) + scale degree + chord notes
                int noteNumber = noteNumberOf(aqp.currentKey,3) + scaleDegree + thisChord[i];
                v.freq = freqOf(noteNumber);
                v.amp = amp;
                if (!v.isOn) {
                    [v on];
                }
                amp = amp - .02;
            }
        }
    }
    [self setNeedsDisplay];
}

-(void)doTouchesOff:(NSSet *)touches withEvent:(UIEvent *)event
{
 for (UITouch* t in touches)
    {
        CGPoint pt = [t locationInView:self];
        Float64 y = pt.y/self.bounds.size.height;
        
        if (y < .5) // top half 
        { 
            SInt8 t_pos = [self removeTouch:t];
            if (t_pos < 0)
            {
                NSLog(@"could not remove touch");
                continue;
            }
            
            MUS147Voice* v = voice[t_pos];
            
            if (v != nil)
            {
                if (v.isOn) {
                    [v off];
                   // NSLog(@"voice off");
                }
            }
            
            if (aqp.sequencer.recording)
                [aqp.sequencer addTouchEvent:0. :0. :NO :t_pos];
        }
        else // bottom half 
        {
            for(UInt16 i = 0; i < 4; i++)
            {
                MUS147Voice* v = [aqp getSynthVoiceWithPos:(i+2)];
                if (v != nil)
                {
                    if (v.isOn) {
                        [v off];
                        //NSLog(@"voice off");
                    }
                }
            }
        }
    }
    
    [self setNeedsDisplay];
}

-(SInt8)getTouchPos:(UITouch*)t
{
    for (UInt8 i = 0; i < kMaxNumTouches; i++)
            if (t == touch[i]) return i;
    return -1;
}

-(SInt8)addTouch:(UITouch*)t
{
    for (UInt8 i = 0; i < kMaxNumTouches; i++)
        if (touch[i] == nil) 
        {
            touch[i] = t;
            return i;
        }
    return -1;
}

-(SInt8)removeTouch:(UITouch*)t
{
    for (UInt8 i = 0; i < kMaxNumTouches; i++)
        if (t == touch[i])
        {
            touch[i]  = nil;
            return i;
        }
    return -1;
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self doTouchesOn:touches withEvent:event];
}

-(void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self doTouchesOn:touches withEvent:event];
}

-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self doTouchesOff:touches withEvent:event];
}

-(void)touchesCancelled:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self doTouchesOff:touches withEvent:event];
}

-(void)accelerometer:(UIAccelerometer *)accelerometer didAccelerate:(UIAcceleration *)acceleration
{
    // comment the NSLog when running on iOS (for Simulator leave it uncommented)
    // NSLog(@"%f %f %f",acceleration.x,acceleration.y,acceleration.z);
    
    /* attempt to do something with all voices
    for(UInt16 i = 0; i < kNumVoices_Synth; i++)
    {
        MUS147Voice* v = [aqp getSynthVoiceWithPos:i];
        v.amp -= acceleration.x;
     
        if(acceleration.x > 0 || acceleration.z > 0)
            v.amp = v.amp + .01;
        else
            v.amp = v.amp - .01;
    }
    */
    
    // apply a magical smoothing function to acceleration.x
    //MUS147Voice* v = [aqp getSynthVoiceWithPos:0];
    //v.amp *= acceleration.x;
    [aqp setDelayAmp:acceleration.x];
    
    // attemp to trigger LPF cutoff with acccelerometer
    // phone perpendicular with horizontal = 1, flat = 0
    // MUS147Effect_BiQuad* bq = aqp.getBiQuad;
    // [bq biQuad_set:LPF:-6:acceleration.x * kSR / 2. - 1000.:kSR:0.25];
    //NSLog(@"accx %f", acceleration.x);
}

/* unused
 // Only override drawRect: if you perform custom drawing.
 // An empty implementation adversely affects performance during animation.
 - (void)drawRect:(CGRect)rect
 {
 for (UInt8 i = 0; i < kMaxNumTouches; i++)
 {
 if (touch[i] == nil) continue;
 
 // Drawing code
 UIColor *uciBlueColor = [UIColor colorWithRed:0./255. green:34./255. blue:68./255. alpha:1.];
 UIColor *uciGoldColor = [UIColor colorWithRed:255./255. green:222./255. blue:108./255. alpha:1.];
 
 CGPoint pt = [touch[i] locationInView:self];
 
 Float64 w = 30.;
 Float64 h = w;
 
 [uciGoldColor set];
 UIRectFill(CGRectMake(pt.x-w/2, pt.y-h/2, w, h));
 
 [uciBlueColor set];
 UIRectFrame(CGRectMake(pt.x-w/2, pt.y-h/2, w, h));
 }
 }
*/

@end
