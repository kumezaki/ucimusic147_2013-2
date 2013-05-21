//
//  MyScale.c
//  ucimusic147-2
//
//  Created by Eddie Huang on 5/20/13.
//  Copyright (c) 2013 UCI Music 147. All rights reserved.
//

#include <stdio.h>
#include <math.h>

#include "MyScale.h"

int pentaScale[6] = {0, 2, 4, 7, 9, 12};
int majScale[8] = {0, 2, 4, 5, 7, 9, 11, 12};
int harminScale[8] = {0, 2, 3, 5, 7, 8, 11, 12};
int natminScale[8] = {0, 2, 3, 5, 7, 8, 10, 12};
int blueScale[7] = {0, 3, 5, 6, 7, 10, 12};



float freqOf(int noteNumber)
{
    return 440. * pow(2, ((float)noteNumber-69)/12);
}

/* helper function to calculate note number from note notation
 * A0 = lowest key on piano, C4 = middle C, A4 = 440 Hz
 */
int noteNumberOf(noteType noteName, int octave)
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