//
//  CoolButton.h
//  CoolButtons
//
//  Created by Jess Martin on 4/14/11.
//  Copyright 2011 Relevance, Inc. All rights reserved.
//

#import <Foundation/Foundation.h>

@class CALayer;
@class CAGradientLayer;

@interface CoolButton : UIButton {
    UIColor *_buttonColor;
    UIView *_innerView;
    // weak references:
    CALayer *_highlightLayer;
    CAGradientLayer *_gradientLayer;
    CAGradientLayer *_innerGlowLayer;
}

@property (nonatomic, retain)UIColor *buttonColor;

@end
