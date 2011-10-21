//
//  CoolButtonsAppDelegate.h
//  CoolButtons
//
//  Created by Jess Martin on 4/14/11.
//  Copyright 2011 Relevance, Inc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CoolButtonsViewController.h"

@interface CoolButtonsAppDelegate : NSObject <UIApplicationDelegate> {
    CoolButtonsViewController *viewController;
}

@property (nonatomic, strong) IBOutlet UIWindow *window;
@property (nonatomic, strong) CoolButtonsViewController *viewController;

@end
