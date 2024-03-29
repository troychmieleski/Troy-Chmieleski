//
//  AppDelegate.m
//  Troy Chmieleski
//
//  Created by Troy Chmieleski on 4/6/14.
//  Copyright (c) 2014 Troy Chmieleski. All rights reserved.
//

#import "AppDelegate.h"

// Google Analytics
#import "GAI.h"

// Reflection
#import "ReflectionViewController.h"

#define GOOGLE_ANALYTICS_DISPATCH_INTERVAL 20
#define GOOGLE_ANALYTICS_TRACKING_ID @"UA-49708481-1"

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    self.window.backgroundColor = [UIColor whiteColor];
	
	// Google Analytics Setup
	[self setUpGoogleAnalytics];
	
	ReflectionViewController *reflectionViewController = [ReflectionViewController new];
	[self.window setRootViewController:reflectionViewController];
	
    [self.window makeKeyAndVisible];
    return YES;
}

#pragma mark - Setup Google Analytics

- (void)setUpGoogleAnalytics {
	// Optional: automatically send uncaught exceptions to Google Analytics
	[[GAI sharedInstance] setTrackUncaughtExceptions:YES];
	
	// Optional: set Google Analytics dispatch interval to e.g. 20 seconds
	[[GAI sharedInstance] setDispatchInterval:GOOGLE_ANALYTICS_DISPATCH_INTERVAL];
	
	// Optional: set Logger to VERBOSE for debug information
	[[[GAI sharedInstance] logger] setLogLevel:kGAILogLevelVerbose];
	
	// Initialize tracker. Replace with your tracking ID.
	[[GAI sharedInstance] trackerWithTrackingId:GOOGLE_ANALYTICS_TRACKING_ID];
	
}

- (void)applicationWillResignActive:(UIApplication *)application
{
	// Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
	// Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
	// Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
	// If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
	// Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
	// Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
	// Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
