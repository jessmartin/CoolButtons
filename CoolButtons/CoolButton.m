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
    _innerView = [[UIView alloc] initWithFrame:self.bounds];
    [_innerView setUserInteractionEnabled:false];
    
    [self addTarget:self action:@selector(addHighlight) forControlEvents:UIControlEventTouchDown];
    [self addTarget:self action:@selector(removeHighlight) forControlEvents:UIControlEventTouchCancel|UIControlEventTouchUpInside|UIControlEventTouchUpOutside];
    
    if ([[self subviews] count] > 0)
        [self insertSubview:_innerView belowSubview:[[self subviews] objectAtIndex:0]];
    else
        [self addSubview:_innerView];
    
    // remember these layers so we don't have to call the views to get them repeatedly
    CALayer* self_layer = [self layer];
    CALayer* inner_layer = [_innerView layer];
    
    // create gradient layer
    _gradientLayer = [CAGradientLayer layer];
    [_gradientLayer setAnchorPoint:CGPointMake(0, 0)];
    // Add one to account for oddities when using CoolButtons in UIToolbar
    [_gradientLayer setBounds:CGRectMake(0, 0, self.bounds.size.width, (self.bounds.size.height/2.0) + 1)]; 
    [_gradientLayer setColors:[NSArray arrayWithObjects:
                               (id)[[UIColor colorWithWhite:1.0 alpha:0.3] CGColor], 
                               (id)[[UIColor colorWithWhite:1.0 alpha:0.10] CGColor], nil]];
    [inner_layer insertSublayer:_gradientLayer atIndex:1];

    // create inner glow layer
    _innerGlowLayer = [CAGradientLayer layer];
    [_innerGlowLayer setAnchorPoint:CGPointMake(0, 0)];
    [_innerGlowLayer setBounds:[self bounds]];
    [_innerGlowLayer setColors:[NSArray arrayWithObjects:
                                (id)[[UIColor colorWithWhite:0.0 alpha:0.60] CGColor], 
                                (id)[[UIColor clearColor] CGColor], nil]];
    [inner_layer insertSublayer:_innerGlowLayer atIndex:2];


    // create highlight layer
    _highlightLayer = [CALayer layer];
    [_highlightLayer setAnchorPoint:CGPointMake(0, 0)];
    [_highlightLayer setBounds:[self bounds]];
    [_highlightLayer setBackgroundColor:[[UIColor colorWithWhite:0.0 alpha:0.3] CGColor]];
    [_highlightLayer setHidden:YES];
    [[_innerView layer] insertSublayer:_highlightLayer atIndex:3];
    
    
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

-(void)addHighlight
{
    //NSLog(@"adding highlight layer");
    [_highlightLayer setHidden:NO];
}

-(void)removeHighlight
{
    //NSLog(@"removing highlight layer");
    [_highlightLayer setHidden:YES];
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
    
    CGRect bounds = self.bounds;
    
    // set size of inner view
    _innerView.frame = bounds;
    
    // create a view to store all the content
    [_innerView setBackgroundColor:[self buttonColor]];
    
    // adjust layer sizes.
    [_innerGlowLayer setBounds:bounds];
    [_gradientLayer setBounds:CGRectMake(0, 0, bounds.size.width, (bounds.size.height/2.0) + 1)]; 
    [_highlightLayer setBounds:bounds];
    
    [_innerGlowLayer setStartPoint:CGPointMake(0.5, 0.0)];
    CGFloat innerGlowHeight = 1 - ((bounds.size.height-2) / bounds.size.height);
    [_innerGlowLayer setEndPoint:CGPointMake(0.5, innerGlowHeight)];
}


-(void)dealloc
{
    [_innerView release];
    [_buttonColor release];
    [super dealloc];
}

@end
