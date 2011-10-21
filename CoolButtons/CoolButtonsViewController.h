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
    IBOutlet UIButton *myPic;
    IBOutlet UIImageView *aintSheABeaut;
    IBOutlet UIView *colorPickerView;
    
    IBOutlet CoolButton *blueButton;
}

- (IBAction)sliderAction:(id)sender;
- (IBAction)goToGitHub:(id)sender;
- (IBAction)goToJessMartDotIn:(id)sender;
- (IBAction)didTouchJessMartDotIn:(id)sender;
- (IBAction)didTouchCancelJessMartDotIn:(id)sender;
- (IBAction)showColorPicker:(id)sender;

@property(strong, nonatomic) IBOutlet UISlider *redSlider;
@property(strong, nonatomic) IBOutlet UISlider *greenSlider;
@property(strong, nonatomic) IBOutlet UISlider *blueSlider;
@property(strong, nonatomic) IBOutlet UIButton *myPic;
@property(strong, nonatomic) IBOutlet UIImageView *aintSheABeaut;
@property(strong, nonatomic) IBOutlet UIView *colorPickerView;
@property(strong, nonatomic) CoolButton *blueButton;

@end
