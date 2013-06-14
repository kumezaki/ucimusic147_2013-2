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

@synthesize ScalepickerContent;
@synthesize KeypickerContent;

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
/*
-(IBAction)setDelay:(id)sender
{
    [aqp setDelayTime:delaySlider.value];
}

-(IBAction)setLimiter:(id)sender
{
    
}

-(IBAction)setScale0:(id)sender
{
    
}

-(IBAction)setScale1:(id)sender
{
    
}*/

//picker content here
- (NSArray *)ScalepickerContent
{
    
    if(!ScalepickerContent) {
        ScalepickerContent = [[NSArray alloc] initWithObjects:
                         @"Pentatonic", @"Major",
                         @"Harmonic", @"Natural",
                         @"Blues", nil];
    }
    return ScalepickerContent;
}

- (NSArray *)KeypickerContent
{
    if(!KeypickerContent) {
        KeypickerContent = [[NSArray alloc] initWithObjects:
                              @"C", @"C#/Db", @"D", @"D#/Eb",
                              @"E", @"F", @"F#/Gb", @"G",
                              @"G#/Ab", @"A", @"A#/Bb", @"B", nil];
    }
    return KeypickerContent;
}
#pragma mark – Picker Datasource:
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
   if([pickerView isEqual: scalePicker])
    {
        return 1;
    }
    if([pickerView isEqual: keyPicker])
    {
        return 1;
    }
}
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    if([pickerView isEqual: scalePicker])
    {
        return self.ScalepickerContent.count;
    }
    if([pickerView isEqual: keyPicker])
    {
        return self.KeypickerContent.count;
    }
}
#pragma mark – Picker Delegate:
- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    if([pickerView isEqual: scalePicker])
    {
        return [self.ScalepickerContent objectAtIndex:row];
    }
    if([pickerView isEqual: keyPicker])
    {
       return [self.KeypickerContent objectAtIndex:row];
    }
}
- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    if([pickerView isEqual: scalePicker])
        aqp.currentScaleType = row + 1;
    if([pickerView isEqual: keyPicker])
        aqp.currentKey = row + 1;
    // NSLog(@"scale is %i", row + 1);
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
