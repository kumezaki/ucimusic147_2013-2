//
//  MyScale.h
//  ucimusic147-2
//
//  Created by Eddie Huang on 5/20/13.
//  Copyright (c) 2013 UCI Music 147. All rights reserved.
//

#ifndef ucimusic147_2_MyScale_h
#define ucimusic147_2_MyScale_h

typedef enum { penta, blue, Maj, harmin, natmin } ScaleType;
typedef enum { A, As, Ab, B, Bs, Bb, C, Cs, Cb,
    D, Ds, Db, E, Es, Eb, F, Fs, Fb, G, Gs, Gb} noteType;
extern int pentaScale[6];
extern int majScale[8];
extern int harminScale[8];
extern int natminScale[8];
extern int blueScale[8];

typedef enum { Major, Maj2, sus4, min, Maj7, min7, dom7, firstInv } ChordType;

/* 
 Major
    0, 7, 16, 19
 Major2
    0, 7, 14, 16
 sus4
    0, 7, 12, 17
 min
    0, 7, 15, 19
 Maj7
    0, 7, 11, 16
 min7
    0, 7, 10, 15
 dom7
    0, 7, 10, 16
 firstInv
    4, 12, 19, 24
 
 */


extern float freqOf(int noteNumber);
extern int noteNumberOf(noteType noteName, int octave);

#endif
