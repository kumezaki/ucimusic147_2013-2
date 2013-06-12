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

extern float freqOf(int noteNumber);
extern int noteNumberOf(noteType noteName, int octave);

#endif
