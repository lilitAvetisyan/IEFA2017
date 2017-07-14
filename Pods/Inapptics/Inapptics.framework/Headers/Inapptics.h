//
//  Inapptics.h
//  Inapptics
//
//  Created by Ashot Tonoyan on 4/20/16.
//  Copyright © 2016 Inapptics Inc. All rights reserved.
//


@import UIKit;


//! Project version number for Inapptics.
FOUNDATION_EXPORT double InappticsVersionNumber;

//! Project version string for Inapptics.
FOUNDATION_EXPORT const unsigned char InappticsVersionString[];


@interface Inapptics : NSObject


/*!
 
 @brief The default method for initializing Inapptics SDK.
 
 @description Call this method as the last line in @c application:didFinishLaunchingWithOptions: method of your @b AppDelegate file to initialize and enable the Inapptics SDK with @b default settings.
 
 @param appToken Get your App Token by navigating to [App settings] at https://app.inapptics.com if you don't have it yet.
 
 @note Crash reporting is enabled by default.
 
 @b Swift Example:
 @code
func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
 
    Inapptics.letsGo(withAppToken: "YOUR_APP_TOKEN")
    
    ...
 
    return true
}
 @endcode
 
 
 @b Objective-C Example:
 @code
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    
    [Inapptics letsGoWithAppToken:@"YOUR_APP_TOKEN"];
 
    ...
 
    return YES;
}
 @endcode
 
 */
+ (void)letsGoWithAppToken:(NSString * _Nonnull)appToken;

/*!
 
 @brief The method for initializing Inapptics SDK with the option to disable crash reporting.
 
 @description Call this method as the last line in @c application:didFinishLaunchingWithOptions: method of your @b AppDelegate file to initialize and enable the Inapptics SDK with the option to disable crash reporting.
 
 @param appToken Get your App Token by navigating to [App settings] at https://app.inapptics.com if you don't have it yet.
 @param enabled Crash reporting enabled
 
 @b Swift Example:
 @code
func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
    
    Inapptics.letsGo(withAppToken: "YOUR_APP_TOKEN", crashReportingEnabled: false)
 
    ...
 
    return true
}
 @endcode
 
 @b Objective-C Example:
 @code
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    
    [Inapptics letsGoWithAppToken:@"YOUR_APP_TOKEN" crashReportingEnabled:NO];
 
    ...
 
    return YES;
}
 @endcode
 
 */
+ (void)letsGoWithAppToken:(NSString * _Nonnull)appToken crashReportingEnabled:(BOOL)crashReportingEnabled;

/*!
 
 @brief This method is optional and can be used for tagging sessions.
 
 @description Optionally call this method in @c applicationDidBecomeActive: method of your @b AppDelegate file to tag a session. Tags can be used e.g. for A/B testing purposes.
 
 @note A single string tag with a maximum length of 128 charachters can be added to a session at a time.
 
 @param tag String tag (will be capped to 128 characters)
 
 @b Swift Example:
 @code
func applicationDidBecomeActive(_ application: UIApplication) {
    
    Inapptics.tagSession("Group A")
    
    ...
}
 @endcode
 
 @b Objective-C Example:
 @code
- (void)applicationDidBecomeActive:(UIApplication *)application {
    
    [Inapptics tagSession:@"Group A"];
    
    ...
}
 @endcode
 
 */
+ (void)tagSession:(NSString * _Nonnull)tag;


@end
