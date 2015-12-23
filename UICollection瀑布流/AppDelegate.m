//
//  AppDelegate.m
//  UICollection瀑布流
//
//  Created by wxiao on 15/12/20.
//  Copyright © 2015年 wxiao. All rights reserved.
//

#import "AppDelegate.h"
#import "ViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
	self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
	ViewController *view = [[ViewController alloc] init];
	UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:view];
	self.window.rootViewController = nav;
	[self.window makeKeyAndVisible];
	return YES;
}


@end
