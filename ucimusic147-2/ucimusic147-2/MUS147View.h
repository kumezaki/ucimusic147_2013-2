//
//  MUS147View.h
//  Music147_2013
//
//  Created by Lab User on 5/1/13.
//  Copyright (c) 2013 Kojiro Umezaki. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum { penta, blue, Maj, harmin, natmin } ScaleType;
typedef enum { A, As, Ab, B, Bs, Bb, C, Cs, Cb,
            D, Ds, Db, E, Es, Eb, F, Fs, Fb, G, Gs, Gb} noteType;
int pentaScale[6] = {0, 2, 4, 7, 9, 12};
int majScale[8] = {0, 2, 4, 5, 7, 9, 11, 12};
int harminScale[8] = {0, 2, 3, 5, 7, 8, 11, 12};
int natminScale[8] = {0, 2, 3, 5, 7, 8, 10, 12};
int blueScale[7] = {0, 3, 5, 6, 7, 10, 12};


@interface MUS147View : UIView

-(void)doTouches:(NSSet *)touches withEvent:(UIEvent *)event;

-(Float64)freqOf:(int)noteNumber;
-(int)noteNumberOf:(noteType)noteName octave:(int)octave;
// fail scale generator
-(int)makeScale:(char)startingNote withScale:(ScaleType)scaleType withLength:(int)scaleLength;

@end
