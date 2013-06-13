//
//  MUS147ViewControllerSub.h
//  ucimusic147-2
//
//  Created by Yurika Mulase on 6/2/13.
//  Copyright (c) 2013 UCI Music 147. All rights reserved.
//

#import "MUS147ViewController.h"

@interface MUS147ViewControllerSub : UIViewController<UIPickerViewDelegate, UIPickerViewDataSource>
{
    IBOutlet UIButton* doneButton;

    IBOutlet UIPickerView* scalePicker;
    IBOutlet UIPickerView* keyPicker;
    
}

@property (nonatomic, strong) NSArray *ScalepickerContent;
@property (nonatomic, strong) NSArray *KeypickerContent;
/*
-(IBAction)setDelay:(id)sender;
-(IBAction)setLimiter:(id)sender;

-(IBAction)setScale0:(id)sender;
-(IBAction)setScale1:(id)sender;
*/

//done button
-(IBAction)goBack;



@end
