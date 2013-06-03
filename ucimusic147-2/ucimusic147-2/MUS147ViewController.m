//
//  MUS147ViewController.m
//  Music147_2013
//
//  Created by Kojiro Umezaki on 4/5/13.
//  Copyright (c) 2013 Kojiro Umezaki. All rights reserved.
//

#import "MUS147ViewController.h"

#import "MUS147ViewControllerSub.h"


@interface MUS147ViewController ()

@end

@implementation MUS147ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



- (IBAction)changeView:(id)sender
{
	MUS147ViewControllerSub *subview = [[[MUS147ViewControllerSub alloc] initWithNibName:nil bundle:nil] autorelease];
            // you can change flip horizontal to many different other transition styles.
                subview.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;
                [self presentModalViewController:subview animated:YES];
}




/* abandoned methods
-(IBAction)setFreq0:(id)sender
{
//    [aqp getVoice:0].freq = freq0Slider.value * 1000.;
    [aqp getVoice:0].speed = freq0Slider.value * 2.;
}

-(IBAction)setAmp0:(id)sender
{
    [aqp getVoice:0].amp = amp0Slider.value;
}

-(IBAction)setFreq1:(id)sender
{
//    [aqp getVoice:1].freq = freq1Slider.value * 1000.;
    [aqp getVoice:1].speed = freq1Slider.value * 2.;
}

-(IBAction)setAmp1:(id)sender
{
    [aqp getVoice:1].amp = amp1Slider.value;
}
*/



@end
