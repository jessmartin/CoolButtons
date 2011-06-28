//
//  CoolButtonsViewController.h
//  CoolButtons
//
//  Created by Jess Martin on 4/14/11.
//  Copyright 2011 Relevance, Inc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CoolButton.h"

@interface CoolButtonsViewController : UIViewController {
    IBOutlet UISlider *redSlider;
    IBOutlet UISlider *greenSlider;
    IBOutlet UISlider *blueSlider;
    IBOutlet UIImageView *myPic;
    IBOutlet UIImageView *aintSheABeaut;
    IBOutlet UIView *colorPickerView;
    
    IBOutlet CoolButton *blueButton;
}

- (IBAction)sliderAction:(id)sender;
- (IBAction)goToGitHub:(id)sender;
- (IBAction)showColorPicker:(id)sender;

@property(retain, nonatomic) IBOutlet UISlider *redSlider;
@property(retain, nonatomic) IBOutlet UISlider *greenSlider;
@property(retain, nonatomic) IBOutlet UISlider *blueSlider;
@property(retain, nonatomic) IBOutlet UIImageView *myPic;
@property(retain, nonatomic) IBOutlet UIImageView *aintSheABeaut;
@property(retain, nonatomic) IBOutlet UIView *colorPickerView;
@property(retain, nonatomic) CoolButton *blueButton;

@end
