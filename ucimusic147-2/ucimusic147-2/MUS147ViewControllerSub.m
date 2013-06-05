//
//  MUS147ViewControllerSub.m
//  ucimusic147-2
//
//  Created by Yurika Mulase on 6/2/13.
//  Copyright (c) 2013 UCI Music 147. All rights reserved.
//

#import "MUS147ViewControllerSub.h"

#import "MUS147ViewController.h"

#import "MUS147AQPlayer.h"
extern MUS147AQPlayer* aqp;

#import "MUS147Effect_Delay.h"

#import "MUS147Voice.h"

#import "MyScale.h"

@interface MUS147ViewControllerSub ()

@end

@implementation MUS147ViewControllerSub

@synthesize pickerContent;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//picker content here
- (NSArray *)pickerContent
{
    if(!pickerContent) {
        pickerContent = [[NSArray alloc] initWithObjects:
                         @"Pentatonic", @"Major",
                         @"Harmonic minor", @"Natural minor",
                         @"Blues", nil];
    }
    return pickerContent;
}
#pragma mark – Picker Datasource:
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 1;
}
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    return self.pickerContent.count;
}
#pragma mark – Picker Delegate:
- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    return [self.pickerContent objectAtIndex:row];
}
- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    
    
    switch (row) {
        case 0:
            self = penta;
            break;
        case 1:
            self = Maj;
            break;
        case 2:
            self = harmin;
            break;
        case 3:
            self = natmin;
            break;
        case 4:
            self = blue;
            break;
        default:
            break;
    }
    
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

//button action to go back
- (IBAction)goBack
{
    [self dismissModalViewControllerAnimated:YES];
}

@end
