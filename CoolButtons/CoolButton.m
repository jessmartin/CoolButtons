/*
 * Author: Jess Martin
 *
 * Copyright (c) 2011 Jess Martin.
 * All rights reserved.
 *
 * Permission is hereby granted, free of charge, to any person
 * obtaining a copy of this software and associated documentation
 * files (the "Software"), to deal in the Software without
 * restriction, including without limitation the rights to use,
 * copy, modify, merge, publish, distribute, sublicense, and/or sell
 * copies of the Software, and to permit persons to whom the
 * Software is furnished to do so, subject to the following
 * conditions:
 *
 * The above copyright notice and this permission notice shall be
 * included in all copies or substantial portions of the Software.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
 * EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES
 * OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
 * NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT
 * HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,
 * WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
 * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
 * OTHER DEALINGS IN THE SOFTWARE.
 */

#import <QuartzCore/QuartzCore.h>
#import "CoolButton.h"


@interface CoolButton (PrivateMethods)
- (void)_buildView;
@end


@implementation CoolButton


@synthesize buttonColor = _buttonColor;
@synthesize innerView = _innerView;
@synthesize highlightLayer = _highlightLayer;


- (UIColor *)buttonColor
{
    return _buttonColor;
}


- (void)setButtonColor:(UIColor *)buttonColor
{
    _buttonColor = buttonColor;
    [self.innerView setBackgroundColor:[self buttonColor]];
}


- (void)awakeFromNib
{
    [self setButtonColor:[self backgroundColor]];
    [self setBackgroundColor:[UIColor clearColor]];
    [self _buildView];
}


- (id)initWithFrame:(CGRect)frame
{
    if ((self = [super initWithFrame:frame]))
    {
        [self setButtonColor:[UIColor colorWithRed:73/255.0 green:107/255.0 blue:155/255.0 alpha:1.0]];
        [self _buildView];
    }
    return self;
}


- (void)_buildView
{
    self.innerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.bounds.size.width, self.bounds.size.height)];
    self.innerView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    [self.innerView setUserInteractionEnabled:false];
    
    [self addTarget:self action:@selector(addHighlight) forControlEvents:UIControlEventTouchDown];
    [self addTarget:self action:@selector(removeHighlight) forControlEvents:UIControlEventTouchCancel|UIControlEventTouchUpInside|UIControlEventTouchUpOutside];
    
    if ([[self subviews] count] > 0) {
        [self insertSubview:self.innerView belowSubview:[[self subviews] objectAtIndex:0]];
    } else {
        [self addSubview:self.innerView];
    }
    
    self.highlightLayer = [CALayer layer];
    [self.highlightLayer setAnchorPoint:CGPointMake(0, 0)];
    [self.highlightLayer setBackgroundColor:[[UIColor colorWithWhite:0.0 alpha:0.3] CGColor]];
}


- (void)addHighlight
{
    [self.highlightLayer setBounds:[self bounds]];
    [[self.innerView layer] insertSublayer:self.highlightLayer atIndex:3];
}


- (void)removeHighlight
{
    [self.highlightLayer removeFromSuperlayer];
}


- (void)drawRect:(CGRect)rect
{
    for (int i = 0; i < [[[self.innerView layer] sublayers] count]; i++) {
        [[[[self.innerView layer] sublayers] objectAtIndex:0] removeFromSuperlayer];
    }
    // create a view to store all the content
    [self.innerView setBackgroundColor:[self buttonColor]];

    // create gradient layer
    CAGradientLayer *gradientLayer = [CAGradientLayer layer];
    [gradientLayer setAnchorPoint:CGPointMake(0, 0)];
    // Add one to account for oddities when using CoolButtons in UIToolbar
    [gradientLayer setBounds:CGRectMake(0, 0, self.bounds.size.width, (self.bounds.size.height/2.0) + 1)]; 
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


@end
