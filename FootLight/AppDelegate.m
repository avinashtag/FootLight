//
//  AppDelegate.m
//  FootLight
//
//  Created by Avinash Tag on 24/10/2014.
//  Copyright (c) 2014 Avinash Tag. All rights reserved.
//

#import "AppDelegate.h"
#import "FLAlert.h"

@interface AppDelegate ()

@end

@implementation AppDelegate

+(AppDelegate*)SharedApplication{
    return (AppDelegate*)[UIApplication sharedApplication].delegate;
}

+(UINavigationController *)sharedNavigationController{
    
    return (UINavigationController *)[AppDelegate SharedApplication].window.rootViewController;
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    self.locationManager = [[CLLocationManager alloc] init];
    self.locationManager.delegate = self;
    self.locationManager.distanceFilter = kCLDistanceFilterNone;
    self.locationManager.desiredAccuracy = kCLLocationAccuracyBest;
    if ([self.locationManager respondsToSelector:@selector(requestWhenInUseAuthorization)]) {
        [self.locationManager requestWhenInUseAuthorization];
    }
    [self.locationManager startUpdatingLocation];
    return YES;
}

- (void)locationManager:(CLLocationManager *)manager didUpdateToLocation:(CLLocation *)newLocation fromLocation:(CLLocation *)oldLocation {
    
    
}
- (void)locationManager:(CLLocationManager *)manager
     didUpdateLocations:(NSArray *)locations{
    
    self.locationManager = manager;
    CLLocation* loc = [locations lastObject]; // locations is guaranteed to have at least one object
    float latitude = loc.coordinate.latitude;
    float longitude = loc.coordinate.longitude;
    NSLog(@"%.8f",latitude);
    NSLog(@"%.8f",longitude);
    
}

- (void)locationManager:(CLLocationManager *)manager
       didFailWithError:(NSError *)error{
    FLAlert *alert = [[FLAlert alloc]initWithTitle:@"Foot Light" message:error.localizedDescription cancelButtonTitle:@"Ok" cancelHandler:^(NSUInteger cancel) {
        
    } otherHandler:^(NSUInteger other) {
        
    } otherButtonTitles:nil];
    
}

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
