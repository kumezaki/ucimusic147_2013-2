//
//  MyScale.h
//  ucimusic147-2
//
//  Created by Eddie Huang on 5/20/13.
//  Copyright (c) 2013 UCI Music 147. All rights reserved.
//

#ifndef ucimusic147_2_MyScale_h
#define ucimusic147_2_MyScale_h

typedef enum { penta = 1, Maj = 2, harmin = 3, natmin = 4, blue = 5} ScaleType;
typedef enum { C = 1, Cs = 2, D = 3, Ds = 4, E = 5, F = 6, Fs = 7, G = 8, Gs = 9, A = 10, As = 11, B = 12} NoteType;
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
extern int noteNumberOf(NoteType noteName, int octave);

#endif
