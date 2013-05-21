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

#import "MyScale.h"

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
        int section = (int)(x * 26); // sections
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
        
        [aqp getVoice:1].freq = freqOf(noteNumber + noteNumberOf(A,2));
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

@end
