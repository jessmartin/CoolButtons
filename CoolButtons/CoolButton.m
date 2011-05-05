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
@synthesize innerView=_innerView;
@synthesize highlightLayer=_highlightLayer;

- (id)initWithFrame:(CGRect)frame
{
    if ((self=[super initWithFrame:frame]))
    {
        self.innerView = [[[UIView alloc] initWithFrame:CGRectMake(0, 0, self.bounds.size.width, self.bounds.size.height)] autorelease];
        [self.innerView setUserInteractionEnabled:false];
        
        [self addTarget:self action:@selector(addHighlight) forControlEvents:UIControlEventTouchDown];
        [self addTarget:self action:@selector(removeHighlight) forControlEvents:UIControlEventTouchCancel|UIControlEventTouchUpInside|UIControlEventTouchUpOutside];
        
        if ([[self subviews] count] > 0)
            [self insertSubview:self.innerView belowSubview:[[self subviews] objectAtIndex:0]];
        else
            [self addSubview:self.innerView];

        self.highlightLayer = [CALayer layer];
        [self.highlightLayer setAnchorPoint:CGPointMake(0, 0)];
        [self.highlightLayer setBounds:[self bounds]];
        [self.highlightLayer setBackgroundColor:[[UIColor colorWithWhite:0.0 alpha:0.3] CGColor]];
    }
    return self;
}

-(void)addHighlight
{
    [[self.innerView layer] insertSublayer:self.highlightLayer atIndex:3];
}

-(void)removeHighlight
{
    [self.highlightLayer removeFromSuperlayer];
}

-(void)drawRect:(CGRect)rect
{
    // create a view to store all the content
    [self.innerView setBackgroundColor:[self buttonColor]];

    // create gradient layer
    CAGradientLayer *gradientLayer = [CAGradientLayer layer];
    [gradientLayer setAnchorPoint:CGPointMake(0, 0)];
    [gradientLayer setBounds:CGRectMake(0, 0, self.bounds.size.width, self.bounds.size.height/2)];
    [gradientLayer setColors:[NSArray arrayWithObjects:
                              (id)[[UIColor colorWithWhite:1.0 alpha:0.3] CGColor], 
                              (id)[[UIColor colorWithWhite:1.0 alpha:0.10] CGColor], nil]];
    [[self.innerView layer] insertSublayer:gradientLayer atIndex:1];
    
    // create inner glow layer
    CAGradientLayer *innerGlow = [CAGradientLayer layer];
    [innerGlow setAnchorPoint:CGPointMake(0, 0)];
    [innerGlow setBounds:[self bounds]];
    [innerGlow setColors:[NSArray arrayWithObjects:
                              (id)[[UIColor colorWithWhite:0.0 alpha:0.60] CGColor], 
                              (id)[[UIColor clearColor] CGColor], nil]];
    [innerGlow setStartPoint:CGPointMake(0.5, 0.0)];
    CGFloat innerGlowHeight = 1 - ((self.bounds.size.height-2) / self.bounds.size.height);
    [innerGlow setEndPoint:CGPointMake(0.5, innerGlowHeight)];
    [[self.innerView layer] insertSublayer:innerGlow atIndex:2];
    
    // create inner shadow layer - using a border for now as a hack
    // TODO: Figure out how to use an axial gradient to accomplish this effect
    [[self.innerView layer] setBorderWidth:0.7];
    [[self.innerView layer] setBorderColor:[[UIColor colorWithWhite:0.0 alpha:0.3] CGColor]];
    
    [[self.innerView layer] setCornerRadius:5.0];
    [[self.innerView layer] setMasksToBounds:YES];

    // add a drop shadow to the layer
    [[self layer] setShadowOffset:CGSizeMake(0, 0.7)];
    [[self layer] setShadowColor:[[UIColor whiteColor] CGColor]];
    [[self layer] setShadowOpacity:0.5];
    [[self layer] setShadowRadius:0.5];
        
    [[self layer] setCornerRadius:5.0];
}

-(void)dealloc
{
    self.innerView = nil;
    self.highlightLayer = nil;
    self.buttonColor = nil;
    [super dealloc];
}

@end
