//
//  AppDelegate.h
//  FootLight
//
//  Created by Avinash Tag on 24/10/2014.
//  Copyright (c) 2014 Avinash Tag. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>
#import <CoreLocation/CLGeocoder.h>

//***** Main List *****//
#define FlListing  @"Listing"
#define FlHome   @"Home"
#define FlCriticsPick   @"Critics Picks"
#define FLByLocation   @"By Location"
#define FLMyFavorites   @"My Favorites"

#define FlTheater   @"Theatre"
#define FlMuseums   @"Museums"
#define FlCabaret   @"Cabaret"
#define FLDanceVeneues   @"Dance Veneues"
#define FLComedyClub   @"Comedy Club" 


@interface AppDelegate : UIResponder <UIApplicationDelegate,CLLocationManagerDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (strong, nonatomic) CLLocationManager *locationManager;
+(AppDelegate*)SharedApplication;
+(UINavigationController *)sharedNavigationController;
@end

