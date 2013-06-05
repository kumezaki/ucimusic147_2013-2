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
    IBOutlet UISlider* delaySlider;
    IBOutlet UISlider* limiterSlider;
    IBOutlet UIPickerView* scale0Picker;
    IBOutlet UIPickerView* scale1Picker;
    
}

-(IBAction)setDelay:(id)sender;
-(IBAction)setLimiter:(id)sender;

-(IBAction)setScale0:(id)sender;
-(IBAction)setScale1:(id)sender;


//done button
-(IBAction)goBack;



@end
