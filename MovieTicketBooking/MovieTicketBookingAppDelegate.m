//
//  MovieTicketBookingAppDelegate.m
//  MovieTicketBooking
//
//  Created by Vikas CG on 12/21/13.
//  Copyright (c) 2013 EST. All rights reserved.
//

#import "MovieTicketBookingAppDelegate.h"

#import "MovieTicketBookingFirstViewController.h"

#import "MovieTicketBookingSecondViewController.h"

#import "MovieTicketBookingThridViewController.h"

#import "MovieTicketBookingFourthViewController.h"

@implementation MovieTicketBookingAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    UIViewController *viewController1, *viewController2, *viewController3, *viewController4;
    UINavigationController *navigationcontroller;
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
        viewController1 = [[MovieTicketBookingFirstViewController alloc] initWithNibName:@"MovieTicketBookingFirstViewController_iPhone" bundle:nil];
        navigationcontroller = [[UINavigationController alloc] initWithRootViewController:viewController1];
        
        viewController2 = [[MovieTicketBookingSecondViewController alloc] initWithNibName:@"MovieTicketBookingSecondViewController_iPhone" bundle:nil];
        viewController3 = [[MovieTicketBookingThridViewController alloc] initWithNibName:@"MovieTicketBookingThridViewController" bundle:nil];
        viewController4 = [[MovieTicketBookingFourthViewController alloc] initWithNibName:@"MovieTicketBookingFourthViewController" bundle:nil];
    } else {
        viewController1 = [[MovieTicketBookingFirstViewController alloc] initWithNibName:@"MovieTicketBookingFirstViewController_iPad" bundle:nil];
        viewController2 = [[MovieTicketBookingSecondViewController alloc] initWithNibName:@"MovieTicketBookingSecondViewController_iPad" bundle:nil];
        viewController2 = [[MovieTicketBookingThridViewController alloc] initWithNibName:@"MovieTicketBookingThridViewController" bundle:nil];
        viewController2 = [[MovieTicketBookingFourthViewController alloc] initWithNibName:@"MovieTicketBookingFourthViewController" bundle:nil];
    }
    self.tabBarController = [[UITabBarController alloc] init];
    self.tabBarController.viewControllers = @[navigationcontroller, viewController2, viewController3, viewController4];
    self.window.rootViewController = self.tabBarController;
    [self.window makeKeyAndVisible];
    return YES;
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

/*
// Optional UITabBarControllerDelegate method.
- (void)tabBarController:(UITabBarController *)tabBarController didSelectViewController:(UIViewController *)viewController
{
}
*/

/*
// Optional UITabBarControllerDelegate method.
- (void)tabBarController:(UITabBarController *)tabBarController didEndCustomizingViewControllers:(NSArray *)viewControllers changed:(BOOL)changed
{
}
*/

@end
