//
//  FlurryAnalytics.h
//  Flurry iOS Analytics Agent 3.0.1 ver 51
//
//  Copyright 2009-2011 Flurry, Inc. All rights reserved.
//	
//	Methods in this header file are for use with Flurry Analytics

#import <UIKit/UIKit.h>

/*!
 * \brief Provides all available methods for defining and reporting Analytics from use
 * of your app.
 *
 * Set of methods that allow developers to capture detailed, aggregate information
 * regarding the use of their app by end users.
 * \author 2009 - 2011 Flurry, Inc. All Rights Reserved.
 */

/*!
 * @class FlurryAPI
 * @abstract Provides all available methods for defining and reporting Analytics from use
 * of your app.
 * @discussion Set of methods that allow developers to capture detailed, aggregate information
 * regarding the use of their app by end users.
 * @helps This class provides methods necessary for correct function of FlurryAPI+AppCircle.h.
 * For information on how to use Flurry's AppCircle SDK to
 * attract high-quality users and monetize your user base see http://wiki.flurry.com/index.php?title=AppCircle.
 * @security 
 * @updated 2011-05-03
 * @version 3.0.1
 * 
 */

@interface FlurryAnalytics : NSObject {
}

/*
 optional sdk settings that should be called before start session
 */

/*!
 * @method
 * @abstract This is an optional method allows you to set the version of your app. If not set,
 * Flurry will automatically pull your version from the Info.plist file (recommended).
 * @discussion This method is not recommended in general circumstances as Flurry will automatically
 * pull the version from the Info.plist file, which will correspond to your version on the App Store.
 * This method must be called before @link startSession startSession: @/link
 * @param version The version to associate with this app build.
 * @availability 1.0.0 and later
 */
+ (void)setAppVersion:(NSString *)version;		// override the app version

+ (NSString *)getFlurryAgentVersion;			// get the Flurry Agent version number
+ (void)setShowErrorInLogEnabled:(BOOL)value;	// default is NO
+ (void)setDebugLogEnabled:(BOOL)value;			// generate debug logs for Flurry support, default is NO
+ (void)setSessionContinueSeconds:(int)seconds; // default is 10 seconds
+ (void)setSecureTransportEnabled:(BOOL)value; // set data to be sent over SSL, default is NO

/*
 start session, attempt to send saved sessions to server 
 */
+ (void)startSession:(NSString *)apiKey;

/*
 log events or errors after session has started
 */
+ (void)logEvent:(NSString *)eventName;
+ (void)logEvent:(NSString *)eventName withParameters:(NSDictionary *)parameters;
+ (void)logError:(NSString *)errorID message:(NSString *)message exception:(NSException *)exception;
+ (void)logError:(NSString *)errorID message:(NSString *)message error:(NSError *)error;

/* 
 start or end timed events
 */
+ (void)logEvent:(NSString *)eventName timed:(BOOL)timed;
+ (void)logEvent:(NSString *)eventName withParameters:(NSDictionary *)parameters timed:(BOOL)timed;
+ (void)endTimedEvent:(NSString *)eventName withParameters:(NSDictionary *)parameters;	// non-nil parameters will update the parameters

/*
 count page views
 */
+ (void)logAllPageViews:(id)target;		// automatically track page view on UINavigationController or UITabBarController
+ (void)logPageView;					// manually increment page view by 1

/*
 set user info
 */
+ (void)setUserID:(NSString *)userID;	// user's id in your system
+ (void)setAge:(int)age;				// user's age in years
+ (void)setGender:(NSString *)gender;	// user's gender m or f

/*
 set location information
 */
+ (void)setLatitude:(double)latitude longitude:(double)longitude horizontalAccuracy:(float)horizontalAccuracy verticalAccuracy:(float)verticalAccuracy;

/*
 optional session settings that can be changed after start session
 */
+ (void)setSessionReportsOnCloseEnabled:(BOOL)sendSessionReportsOnClose;	// default is YES
+ (void)setSessionReportsOnPauseEnabled:(BOOL)setSessionReportsOnPauseEnabled;	// default is YES
+ (void)setEventLoggingEnabled:(BOOL)value;		// default is YES

@end
