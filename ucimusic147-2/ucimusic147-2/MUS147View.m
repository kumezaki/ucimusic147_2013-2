//
//  MUS147View.m
//  Music147_2013
//
//  Created by Lab User on 5/1/13.
//  Copyright (c) 2013 Kojiro Umezaki. All rights reserved.
//

#import "MUS147View.h"

#import "MUS147AQPlayer.h"
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

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

-(void)doTouches:(NSSet *)touches withEvent:(UIEvent *)event
{
    for (UITouch* t in touches)
    {
        CGPoint pt = [t locationInView:self];
        Float64 x = pt.x/self.bounds.size.width;
        Float64 y = pt.y/self.bounds.size.height;
        
        // demo
        int section = (int)(x * 26); // sectionsq
        int noteNumber;
        if (y < .5) {
            // top half is pentatonic scale
            noteNumber = (int)(section/6)*12 + pentaScale[section%6];
            // balance amplitude for top half
            y += .5;
        } else {
            // bottom half is major scale
            noteNumber = (int)(section/8)*12 + majScale[section%8];
        }
        
        [aqp getVoice:1].freq = [self freqOf:(noteNumber + [self noteNumberOf:A octave:2]) ];
        [aqp getVoice:1].amp = 1. - y;
    }
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self doTouches:touches withEvent:event];
}

-(void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self doTouches:touches withEvent:event];
}

-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self doTouches:touches withEvent:event];
    [aqp getVoice:1].amp = 0.;
}

-(void)touchesCancelled:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self doTouches:touches withEvent:event];
    [aqp getVoice:1].amp = 0.;
}



/* helper function to calculate frequency of note
 * based on equaltemperment and A=440Hz
 */
-(Float64)freqOf:(int)noteNumber
{
    return 440. * pow(2, ((float)noteNumber-69)/12);
}

/* helper function to calculate note number from note notation
 * A0 = lowest key on piano, C4 = middle C, A4 = 440 Hz
 */
-(int)noteNumberOf:(noteType)noteName octave:(int)octave
{
    int note;
    switch (noteName) {
        case (Bs): case (C): note = 24; break;
        case (Cs): case (Db): note = 25; break;
        case (D): note = 26; break;
        case (Ds): case (Eb): note = 27; break;
        case (E):  case (Fb):note = 28; break;
        case (Es): case (F): note = 29; break;
        case (Fs): case (Gb): note = 30; break;
        case (G): note = 31; break;
        case (Gs): case (Ab): note = 32; break;
        case (A): note = 33; break;
        case (As): case (Bb): note = 34; break;
        case (B):  case (Cb): note = 35; break;
    }
    return note + 12 * (octave - 1);
}
 

/* fail scale generator
 * types: penta, blue, Maj, harmin, natmin
 */
-(int)makeScale:(char)startingNote withScale:(ScaleType)scaleType withLength:(int)scaleLength
{
    int scale[scaleLength];
    int startNote = [self noteNumberOf:startingNote octave:3]; // pick octave 3 for now
    int j = 1;
    scale[0] = startNote;
    
    for(int i = 1; i < scaleLength; i++)
    {
        scale[i] = scale[i-1] + pentaScale[j];
        j++;
        
        if (j == 6) // 6, end of penta scale index
            j = 1;
    }
    return scale;
}

@end
