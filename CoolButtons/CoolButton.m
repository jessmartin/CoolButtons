//
//  CoolButton.m
//  CoolButtons
//
//  Created by Jess Martin on 4/14/11.
//  Copyright 2011 Relevance, Inc. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>
#import "CoolButton.h"


@implementation CoolButton

@synthesize buttonColor=_buttonColor;

-(void)drawRect:(CGRect)rect
{
    // create a view to store all the content
    UIView *innerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.bounds.size.width, self.bounds.size.height)];
    [innerView setBackgroundColor:[self buttonColor]];

    // create gradient layer
    CAGradientLayer *gradientLayer = [CAGradientLayer layer];
    [gradientLayer setAnchorPoint:CGPointMake(0, 0)];
    [gradientLayer setBounds:CGRectMake(0, 0, self.bounds.size.width, self.bounds.size.height/2)];
    [gradientLayer setColors:[NSArray arrayWithObjects:
                              (id)[[UIColor colorWithWhite:1.0 alpha:0.25] CGColor], 
                              (id)[[UIColor colorWithWhite:1.0 alpha:0.10] CGColor], nil]];
    [[innerView layer] insertSublayer:gradientLayer atIndex:1];
    
    // create inner glow layer
    CAGradientLayer *innerGlow = [CAGradientLayer layer];
    [innerGlow setAnchorPoint:CGPointMake(0, 0)];
    [innerGlow setBounds:[self bounds]];
    [innerGlow setColors:[NSArray arrayWithObjects:
                              (id)[[UIColor colorWithWhite:0.0 alpha:0.70] CGColor], 
                              (id)[[UIColor clearColor] CGColor], nil]];
    [innerGlow setStartPoint:CGPointMake(0.5, 0.0)];
    [innerGlow setEndPoint:CGPointMake(0.5, 0.06)];
    [[innerView layer] insertSublayer:innerGlow atIndex:2];
    
    // create inner shadow layer - using a border for now as a hack
    // TODO: Figure out how to use an axial gradient to accomplish this effect
    [[innerView layer] setBorderWidth:1.0];
    [[innerView layer] setBorderColor:[[UIColor colorWithWhite:0.0 alpha:0.3] CGColor]];
    
    [[innerView layer] setCornerRadius:4.0];
    [[innerView layer] setMasksToBounds:YES];

    if ([[self subviews] count] > 0)
        [self insertSubview:innerView belowSubview:[[self subviews] objectAtIndex:0]];
    else
        [self addSubview:innerView];
    
    // add a drop shadow to the layer
    [[self layer] setShadowOffset:CGSizeMake(0, 1.0)];
    [[self layer] setShadowColor:[[UIColor whiteColor] CGColor]];
    [[self layer] setShadowOpacity:0.5];
    [[self layer] setShadowRadius:1.0];
        
    [[self layer] setCornerRadius:4.0];
}

@end
