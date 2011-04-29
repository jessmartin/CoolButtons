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
    [self.view release];
    [super dealloc];
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

- (IBAction)buttonTouched
{
    NSLog(@"button touched");
}

#pragma mark - View lifecycle

// Implement loadView to create a view hierarchy programmatically, without using a nib.
- (void)loadView
{
    self.view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 480, 960)];
    
    UIImageView *background = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 320, 480)];
    [background setBackgroundColor:[UIColor colorWithWhite:0.3 alpha:1.0]];
    [self.view addSubview:background];
    [background release];

    
    // Add blue title bar and blue button
    UIImageView *greyBlueTitleBar = [[UIImageView alloc] initWithFrame:CGRectMake(-1, 20, 320, 44)];
    [greyBlueTitleBar setImage:[UIImage imageNamed:@"blue_bar.png"]];
    [self.view addSubview:greyBlueTitleBar];
    [greyBlueTitleBar release];

    CoolButton *blueButton = [[CoolButton alloc] initWithFrame:CGRectMake(10, 27, 56, 30)];
    [blueButton setButtonColor:[UIColor colorWithRed:73/255.0 green:107/255.0 blue:155/255.0 alpha:1.0]];
    [blueButton setTitle:@"Label" forState:UIControlStateNormal];
    [[blueButton titleLabel] setShadowColor:[UIColor colorWithWhite:0 alpha:0.5]];
    [[blueButton titleLabel] setShadowOffset:CGSizeMake(0, -1)];
    [[blueButton titleLabel] setTextColor:[UIColor whiteColor]];
    [[blueButton titleLabel] setFont:[UIFont boldSystemFontOfSize:12]];
    [self.view addSubview:blueButton];
    [blueButton release];
    
    CoolButton *redButton = [[CoolButton alloc] initWithFrame:CGRectMake(80, 27, 56, 30)];
    [redButton setButtonColor:[UIColor colorWithRed:237/255.0 green:28/255.0 blue:33/255.0 alpha:1.0]];
    [redButton setTitle:@"Label" forState:UIControlStateNormal];
    [[redButton titleLabel] setShadowColor:[UIColor colorWithWhite:0 alpha:0.5]];
    [[redButton titleLabel] setShadowOffset:CGSizeMake(0, -1)];
    [[redButton titleLabel] setTextColor:[UIColor whiteColor]];
    [[redButton titleLabel] setFont:[UIFont boldSystemFontOfSize:12]];
    [self.view addSubview:redButton];
    [redButton release];

    // Add black title bar and black button
    UIImageView *blackTitleBar = [[UIImageView alloc] initWithFrame:CGRectMake(0, 148, 320, 44)];
    [blackTitleBar setImage:[UIImage imageNamed:@"black_bar.png"]];
    [self.view addSubview:blackTitleBar];
    [blackTitleBar release];

    CoolButton *blackButton = [[CoolButton alloc] initWithFrame:CGRectMake(10, 155, 56, 30)];
    [blackButton setButtonColor:[UIColor colorWithWhite:0.0 alpha:1.0]];
    [blackButton setTitle:@"Label" forState:UIControlStateNormal];
    [[blackButton titleLabel] setShadowColor:[UIColor colorWithWhite:0 alpha:0.5]];
    [[blackButton titleLabel] setShadowOffset:CGSizeMake(0, -1)];
    [[blackButton titleLabel] setTextColor:[UIColor whiteColor]];
    [[blackButton titleLabel] setFont:[UIFont boldSystemFontOfSize:12]];
    [self.view addSubview:blackButton];
    [blackButton release];
    
    // Add brown title bar and brown button
    UIImageView *brownTitleBar = [[UIImageView alloc] initWithFrame:CGRectMake(0, 84, 320, 44)];
    [brownTitleBar setImage:[UIImage imageNamed:@"brown_bar.png"]];
    [self.view addSubview:brownTitleBar];
    [brownTitleBar release];
    
    CoolButton *brownButton = [[CoolButton alloc] initWithFrame:CGRectMake(10, 91, 56, 30)];
    [brownButton setButtonColor:[UIColor colorWithRed:111/255.0 green:81/255.0 blue:52/255.0 alpha:1.0]];
    [brownButton setTitle:@"Label" forState:UIControlStateNormal];
    [[brownButton titleLabel] setShadowColor:[UIColor colorWithWhite:0 alpha:0.5]];
    [[brownButton titleLabel] setShadowOffset:CGSizeMake(0, -1)];
    [[brownButton titleLabel] setTextColor:[UIColor whiteColor]];
    [[brownButton titleLabel] setFont:[UIFont boldSystemFontOfSize:12]];
    [self.view addSubview:brownButton];
    [brownButton release];

    
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
