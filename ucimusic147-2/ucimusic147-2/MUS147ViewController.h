//
//  MUS147ViewController.h
//  Music147_2013
//
//  Created by Kojiro Umezaki on 4/5/13.
//  Copyright (c) 2013 Kojiro Umezaki. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MUS147ViewController : UIViewController {
    
    IBOutlet UIButton* settingButton;
    IBOutlet UIButton* setWaveButton;

    /* abandoned sliders
    IBOutlet UISlider* freq0Slider;
    IBOutlet UISlider* amp0Slider;
    IBOutlet UISlider* freq1Slider;
    IBOutlet UISlider* amp1Slider;
     */
}

-(IBAction)changeView:(id)sender;
-(IBAction)changeView2:(id)sender;

/* abandoned methods
-(IBAction)setFreq0:(id)sender;
-(IBAction)setAmp0:(id)sender;
-(IBAction)setFreq1:(id)sender;
-(IBAction)setAmp1:(id)sender;
 */


    

@end
