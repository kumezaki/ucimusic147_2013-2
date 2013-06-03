//
//  MUS147ViewControllerSub.h
//  ucimusic147-2
//
//  Created by Yurika Mulase on 6/2/13.
//  Copyright (c) 2013 UCI Music 147. All rights reserved.
//

#import "MUS147ViewController.h"

@interface MUS147ViewControllerSub : MUS147ViewController
{
    IBOutlet UIButton* doneButton;
    IBOutlet UISlider* reverbSlider;
    IBOutlet UISlider* delaySlider;
    IBOutlet UIPickerView* scale0Picker;
    IBOutlet UIPickerView* scale1Picker;
    
}

-(IBAction)setReverb:(id)sender;
-(IBAction)setDelay:(id)sender;

-(IBAction)setScale0:(id)sender;
-(IBAction)setScale1:(id)sender;


//done button
-(IBAction)goBack;



@end
