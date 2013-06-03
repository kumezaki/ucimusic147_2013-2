//
//  MUS147ViewControllerSub2.m
//  ucimusic147-2
//
//  Created by Yurika Mulase on 6/2/13.
//  Copyright (c) 2013 UCI Music 147. All rights reserved.
//

#import "MUS147ViewControllerSub2.h"
#import "MUS147AQPlayer.h"
extern MUS147AQPlayer* aqp;

@interface MUS147ViewControllerSub2 ()

@end

@implementation MUS147ViewControllerSub2

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

-(IBAction)seqWave:(id)sender
{
    aqp.synthVoiceType = waveSegmentedControl.selectedSegmentIndex;
}

//button action to go back
- (IBAction)goBack2
{
    [self dismissModalViewControllerAnimated:YES];
}


@end
