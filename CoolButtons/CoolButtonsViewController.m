//
//  CoolButtonsViewController.m
//  CoolButtons
//
//  Created by Jess Martin on 4/14/11.
//  Copyright 2011 Relevance, Inc. All rights reserved.
//

#import "CoolButtonsViewController.h"
#import "CoolButton.h"

@implementation CoolButtonsViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)dealloc
{
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
    self.view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 480, 960)];
    
    UIImageView *background = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 480, 960)];
    [background setBackgroundColor:[UIColor colorWithWhite:0.3 alpha:1.0]];
    [self.view addSubview:background];
    [background release];
    
    CoolButton *coolButton = [[CoolButton alloc] initWithFrame:CGRectMake(100, 100, 73, 30)];
    [coolButton setButtonColor:[UIColor colorWithRed:36/255.0 green:99/255.0 blue:222/255.0 alpha:1.0]];
    [coolButton setTitle:@"Sync" forState:UIControlStateNormal];
    [[coolButton titleLabel] setShadowColor:[UIColor colorWithWhite:0 alpha:0.6]];
    [[coolButton titleLabel] setShadowOffset:CGSizeMake(0, -1)];
    [[coolButton titleLabel] setTextColor:[UIColor whiteColor]];
    [[coolButton titleLabel] setFont:[UIFont boldSystemFontOfSize:12]];
    
    [coolButton setImage:[UIImage imageNamed:@"sync_button"] forState:UIControlStateNormal];
    [self.view addSubview:coolButton];
    [coolButton release];
}

/*
// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad
{
    [super viewDidLoad];
}
*/

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
