//
//  CoolButton.m
//  CoolButtons
//
//  Created by Jess Martin on 4/14/11.
//  Copyright 2011 Relevance, Inc. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>
#import "CoolButton.h"

@interface CoolButton (PrivateMethods)
- (void) buildView;
@end

@implementation CoolButton

@synthesize buttonColor=_buttonColor;

- (id)initWithCoder:(NSCoder *)coder {
    self = [super initWithCoder:coder];
    if (self) {
        //NSLog(@"initWithCoder");
        [self setButtonColor:[self backgroundColor]];
        [self setBackgroundColor:[UIColor clearColor]];
        [self buildView];
    }
    return self;
}

- (id)initWithFrame:(CGRect)frame
{
    //NSLog(@"Init called");
    if ((self=[super initWithFrame:frame]))
    {
        [self setButtonColor:[UIColor colorWithRed:73/255.0 green:107/255.0 blue:155/255.0 alpha:1.0]];
        [self buildView];
    }
    return self;
}

-(void) buildView
{
    _innerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.bounds.size.width, self.bounds.size.height)];
    [_innerView setUserInteractionEnabled:false];
    
    [self addTarget:self action:@selector(addHighlight) forControlEvents:UIControlEventTouchDown];
    [self addTarget:self action:@selector(removeHighlight) forControlEvents:UIControlEventTouchCancel|UIControlEventTouchUpInside|UIControlEventTouchUpOutside];
    
    if ([[self subviews] count] > 0)
        [self insertSubview:_innerView belowSubview:[[self subviews] objectAtIndex:0]];
    else
        [self addSubview:_innerView];
    
    _highlightLayer = [[CALayer layer] retain];
    [_highlightLayer setAnchorPoint:CGPointMake(0, 0)];
    [_highlightLayer setBounds:[self bounds]];
    [_highlightLayer setBackgroundColor:[[UIColor colorWithWhite:0.0 alpha:0.3] CGColor]];
}

-(void)addHighlight
{
    //NSLog(@"adding highlight layer");
    [[_innerView layer] insertSublayer:_highlightLayer atIndex:3];
}

-(void)removeHighlight
{
    //NSLog(@"removing highlight layer");
    [_highlightLayer removeFromSuperlayer];
}

- (void)setButtonColor:(UIColor *)value
{
	[_buttonColor autorelease];
    _buttonColor = [value retain];
    [_innerView setBackgroundColor:[self buttonColor]];
    [self setNeedsLayout];
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    // remember these layers so we don't have to call the views to get them repeatedly
    CALayer* self_layer = [self layer];
    CALayer* inner_layer = [_innerView layer];
    
    NSLog(@"resetting layers in layoutSubviews!");
    while ([[inner_layer sublayers] count] > 0) {
        [[[inner_layer sublayers] objectAtIndex:0] removeFromSuperlayer];
    }
    
    // create a view to store all the content
    [_innerView setBackgroundColor:[self buttonColor]];

    // create gradient layer
    CAGradientLayer *gradientLayer = [CAGradientLayer layer];
    [gradientLayer setAnchorPoint:CGPointMake(0, 0)];
    // Add one to account for oddities when using CoolButtons in UIToolbar
    [gradientLayer setBounds:CGRectMake(0, 0, self.bounds.size.width, (self.bounds.size.height/2.0) + 1)]; 
    [gradientLayer setColors:[NSArray arrayWithObjects:
                              (id)[[UIColor colorWithWhite:1.0 alpha:0.3] CGColor], 
                              (id)[[UIColor colorWithWhite:1.0 alpha:0.10] CGColor], nil]];
    [inner_layer insertSublayer:gradientLayer atIndex:1];
    
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
    [inner_layer insertSublayer:innerGlow atIndex:2];
    
    // create inner shadow layer - using a border for now as a hack
    // TODO: Figure out how to use an axial gradient to accomplish this effect
    [inner_layer setBorderWidth:0.7];
    [inner_layer setBorderColor:[[UIColor colorWithWhite:0.0 alpha:0.3] CGColor]];
    [inner_layer setCornerRadius:5.0];
    [inner_layer setMasksToBounds:YES];

    // add a drop shadow to the layer
    [self_layer setShadowOffset:CGSizeMake(0, 0.7)];
    [self_layer setShadowColor:[[UIColor whiteColor] CGColor]];
    [self_layer setShadowOpacity:0.5];
    [self_layer setShadowRadius:0.5];
    [self_layer setCornerRadius:5.0];
}


-(void)dealloc
{
    [_innerView release];
    [_highlightLayer release];
    [_buttonColor release];
    [super dealloc];
}

@end
