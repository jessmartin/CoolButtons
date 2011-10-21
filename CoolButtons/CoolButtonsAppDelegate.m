//
//  CoolButtonsAppDelegate.m
//  CoolButtons
//
//  Created by Jess Martin on 4/14/11.
//  Copyright 2011 Relevance, Inc. All rights reserved.
//

#import "CoolButtonsAppDelegate.h"
#import "FlurryAnalytics.h"
#import "FlurryConfig.h"

@implementation CoolButtonsAppDelegate

@synthesize window=_window;
@synthesize viewController=_viewController;

void uncaughtExceptionHandler(NSException *exception) {
    [FlurryAnalytics logError:@"Uncaught" message:@"Crash!" exception:exception];
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    [FlurryAnalytics startSession:FLURRY_API_STRING];
    [FlurryAnalytics logEvent:@"APPLICATION_LAUNCHED"];
    
    self.viewController = [[CoolButtonsViewController alloc] initWithNibName:@"CoolButtons" bundle:nil];
    [self.window addSubview:self.viewController.view];
    
    // Override point for customization after application launch.
    [self.window makeKeyAndVisible];
    
    NSSetUncaughtExceptionHandler(&uncaughtExceptionHandler);
    
    application.statusBarHidden = YES;
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    [FlurryAnalytics logEvent:@"APPLICATION_BACKGROUNDED"];
    /*
     Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
     Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
     */
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    [FlurryAnalytics logEvent:@"APPLICATION_BACKGROUNDED"];
    /*
     Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
     If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
     */
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    /*
     Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
     */
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    [FlurryAnalytics logEvent:@"APPLICATION_REACTIVATED"];
    /*
     Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
     */
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    [FlurryAnalytics logEvent:@"APPLICATION_TERMINATED"];
    /*
     Called when the application is about to terminate.
     Save data if appropriate.
     See also applicationDidEnterBackground:.
     */
}


@end
