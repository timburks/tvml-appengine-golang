//
//  AppDelegate.m
//  tvmldemo
//
//  Created by Tim Burks on 10/8/15.
//  Copyright © 2015 Radtastical. All rights reserved.
//
@import TVMLKit;

#import "AppDelegate.h"

#define BASE_URL @"http://localhost:8080"
//#define BASE_URL @"http://tvmldemo.appspot.com"

#define BOOT_PATH @"/js/application.js"

@interface AppDelegate ()
@property (nonatomic, strong) TVApplicationController *controller;
@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    UIWindow *window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    
    TVApplicationControllerContext *context = [[TVApplicationControllerContext alloc] init];
    context.launchOptions = @{@"BaseURL":BASE_URL};
    context.javaScriptApplicationURL = [NSURL URLWithString:
                                        [BASE_URL stringByAppendingString:BOOT_PATH]];
    _controller = [[TVApplicationController alloc]
                   initWithContext:context
                   window:window
                   delegate:nil];
    
    [window makeKeyAndVisible];
    return YES;
}

@end
