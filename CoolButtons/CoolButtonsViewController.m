//
//  CoolButtonsViewController.m
//  CoolButtons
//
//  Created by Jess Martin on 4/14/11.
//  Copyright 2011 Relevance, Inc. All rights reserved.
//

#import "CoolButtonsViewController.h"
#import <QuartzCore/QuartzCore.h>
#import "FlurryAnalytics.h"

@implementation CoolButtonsViewController
@synthesize redSlider;
@synthesize greenSlider;
@synthesize blueSlider;
@synthesize blueButton;
@synthesize myPic;
@synthesize aintSheABeaut;
@synthesize colorPickerView;

- (void)dealloc
{
    [self.view release];
    [super dealloc];
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

// Implement loadView to create a view hierarchy programmatically, without using a nib.
- (void)loadView
{
    [super loadView];
    
    // Background
//    UIImage *backgroundImage = [UIImage imageNamed:@"background.png"];
//    self.view.backgroundColor = [UIColor colorWithPatternImage:backgroundImage];
    
//    [self.blueButton setButtonColor:[UIColor colorWithRed:73/255.0 green:107/255.0 blue:155/255.0 alpha:1.0]];
    [self.blueButton setSelected:NO];
    [self.blueButton setTitle:@"Tap to change color" forState:UIControlStateNormal];
    [self.blueButton setTitle:@"Tap to hide color picker" forState:UIControlStateSelected];
    
    [self sliderAction:nil];
     
    UIImage *redSliderLeftTrackImage = [[UIImage imageNamed:@"red_slider_min_image"] stretchableImageWithLeftCapWidth: 9 topCapHeight: 0];
    UIImage *greenSliderLeftTrackImage = [[UIImage imageNamed:@"green_slider_min_image"] stretchableImageWithLeftCapWidth: 9 topCapHeight: 0];
    UIImage *blueSliderLeftTrackImage = [[UIImage imageNamed:@"blue_slider_min_image"] stretchableImageWithLeftCapWidth: 9 topCapHeight: 0];    
    UIImage *sliderRightTrackImage = [[UIImage imageNamed: @"grey_slider_max_image"] stretchableImageWithLeftCapWidth: 9 topCapHeight: 0];
    [redSlider setMinimumTrackImage: redSliderLeftTrackImage forState: UIControlStateNormal];
    [redSlider setMaximumTrackImage: sliderRightTrackImage forState: UIControlStateNormal];
    [greenSlider setMinimumTrackImage: greenSliderLeftTrackImage forState: UIControlStateNormal];
    [greenSlider setMaximumTrackImage: sliderRightTrackImage forState: UIControlStateNormal];
    [blueSlider setMinimumTrackImage: blueSliderLeftTrackImage forState: UIControlStateNormal];
    [blueSlider setMaximumTrackImage: sliderRightTrackImage forState: UIControlStateNormal];
    
    myPic.clipsToBounds = NO;
    myPic.transform = CGAffineTransformMakeRotation(-0.08);    
    myPic.layer.shadowColor = [UIColor blackColor].CGColor;
    myPic.layer.shadowOffset = CGSizeMake(1, 1);
    myPic.layer.shadowOpacity = 1;
    myPic.layer.shadowRadius = 2.0;
}

- (IBAction)sliderAction:(id)sender
{   
    [self.blueButton setButtonColor:[UIColor colorWithRed:redSlider.value green:greenSlider.value blue:blueSlider.value alpha:1.0]];
}

- (IBAction)showColorPicker:(id)sender
{   
    [FlurryAnalytics logEvent:@"TOGGLE_COLOR_PICKER"];
    if (colorPickerView.hidden) {
        colorPickerView.hidden = NO;
        blueButton.selected = YES;
        colorPickerView.alpha = 0.0;
        [UIView animateWithDuration:0.2 
                              delay:0 
                            options:UIViewAnimationOptionCurveEaseInOut 
                         animations:^{
                             colorPickerView.alpha = 1.0;
                             aintSheABeaut.alpha = 0.0;
                         } 
                         completion:nil];
        
    } else {
        blueButton.selected = NO;
        [UIView animateWithDuration:0.2 
                              delay:0 
                            options:UIViewAnimationOptionCurveEaseInOut 
                         animations:^{
                             colorPickerView.alpha = 0.0;
                         }
                         completion:^(BOOL finished){
                             colorPickerView.hidden = YES;
                             aintSheABeaut.alpha = 1.0;
                         }];
    }
}

- (IBAction)goToGitHub:(id)sender
{
    [FlurryAnalytics logEvent:@"GO_TO_GITHUB"];
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString: @"http://www.github.com/jessmartin/coolbuttons"]];
}

- (IBAction)didTouchJessMartDotIn:(id)sender
{
    [UIView animateWithDuration:0.2
                          delay:0
                        options:UIViewAnimationOptionCurveEaseInOut 
                     animations:^{
                         myPic.transform = CGAffineTransformMakeRotation(0);
                     }
                     completion:^(BOOL finished){
                     }];
}

- (void)unanimateJessMartDotIn
{
    [UIView animateWithDuration:0.2
                          delay:0
                        options:UIViewAnimationOptionCurveEaseInOut 
                     animations:^{
                         myPic.transform = CGAffineTransformMakeRotation(-0.08);
                     }
                     completion:^(BOOL finished){
                     }];
    
}

- (IBAction)didTouchCancelJessMartDotIn:(id)sender
{
    [self unanimateJessMartDotIn];
}

- (IBAction)goToJessMartDotIn:(id)sender
{
    [FlurryAnalytics logEvent:@"GO_TO_JESSMARTIN"];
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString: @"http://jessmart.in"]];
    [self unanimateJessMartDotIn];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
