//
//  AppDelegate.m
//  BubbleTabBar
//
//  Created by VicChan on 7/5/16.
//  Copyright © 2016 VicChan. All rights reserved.
//

#import "AppDelegate.h"
#import "TabBarController.h"
#import "FirstViewController.h"
#import "SecondViewController.h"
#import "ThirdViewController.h"
#import "FourthViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    _window = [[UIWindow alloc]initWithFrame:[UIScreen mainScreen].bounds];
    
    TabBarController *tabController = [[TabBarController alloc]initWithImages:@[@"account_normal",@"home_normal",@"message_normal",@"mycity_normal"]  selectedImages:@[@"account_highlight",@"home_highlight",@"message_highlight",@"mycity_highlight"] withControllerBlock:^(TabBarController *tb) {
        [tb setViewController:[[UINavigationController alloc]initWithRootViewController:[FirstViewController new]]];
        [tb setViewController:[[UINavigationController alloc]initWithRootViewController:[SecondViewController new]]];
        [tb setViewController:[[UINavigationController alloc] initWithRootViewController:[ThirdViewController new]]];
        [tb setViewController:[[UINavigationController alloc]initWithRootViewController:[FourthViewController new]]];
        
    } withTabBarCenter:CGPointMake([UIScreen mainScreen].bounds.size.width/2.0, [UIScreen mainScreen].bounds.size.height-55) size:CGSizeMake(260, 50) buttonCount:4];
    
    
    _window.rootViewController = tabController;
    
    [_window makeKeyAndVisible];
    
    // Override point for customization after application launch.
    return YES;
}

/**
 
 UINavigationController *controller1 = [[UINavigationController alloc]initWithRootViewController:[FirstViewController new]];
 UINavigationController *controller2 = [[UINavigationController alloc]initWithRootViewController:[SecondViewController new]];
 
 UINavigationController *controller3 = [[UINavigationController alloc] initWithRootViewController:[ThirdViewController new]];
 UINavigationController  *controller4 = [[UINavigationController alloc]initWithRootViewController:[FourthViewController new]];
 self.viewControllers = @[controller1,controller2,controller3,controller4];
 */

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
