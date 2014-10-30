//
//  HomeCellModel.m
//  FootLight
//
//  Created by Avinash Tag on 25/10/2014.
//  Copyright (c) 2014 Avinash Tag. All rights reserved.
//

#import "HomeCellModel.h"

@implementation HomeCellModel

+(NSArray*)dataSourceCollection{
    HomeCellModel *listing = [[HomeCellModel alloc]init];
    listing.title = FlListing;
    listing.image = [HomeCellModel imageByName:@"Home_Listings"];
    HomeCellModel *Home_location = [[HomeCellModel alloc]init];
    Home_location.title = FLByLocation;
    Home_location.image = [HomeCellModel imageByName:@"Home_location"];
    
    HomeCellModel *Home_TopPicks = [[HomeCellModel alloc]init];
    Home_TopPicks.title = FlCriticsPick;
    Home_TopPicks.image = [HomeCellModel imageByName:@"Home_TopPicks"];
    HomeCellModel *Home_Favourites = [[HomeCellModel alloc]init];
    Home_Favourites.title = FLMyFavorites;
    Home_Favourites.image = [HomeCellModel imageByName:@"Home_Favourites"];
    
    return [NSArray arrayWithObjects:listing,Home_location,Home_TopPicks,Home_Favourites, nil];
}


+(NSArray*)dataSourceListingCollection{
    HomeCellModel *listing = [[HomeCellModel alloc]init];
    listing.title = FlTheater;
    listing.image = [HomeCellModel imageByName:@"Category_Theatre"];
    HomeCellModel *Home_location = [[HomeCellModel alloc]init];
    Home_location.title = FlMuseums;
    Home_location.image = [HomeCellModel imageByName:@"Category_Museum"];
    
    HomeCellModel *Home_TopPicks = [[HomeCellModel alloc]init];
    Home_TopPicks.title = FlCabaret;
    Home_TopPicks.image = [HomeCellModel imageByName:@"Category_Cabaret"];
    HomeCellModel *Home_Favourites = [[HomeCellModel alloc]init];
    Home_Favourites.title = FLDanceVeneues;
    Home_Favourites.image = [HomeCellModel imageByName:@"Category_Dance"];
    
    HomeCellModel *Category_Comedy = [[HomeCellModel alloc]init];
    Category_Comedy.title = FLComedyClub;
    Category_Comedy.image = [HomeCellModel imageByName:@"Category_Comedy"];

    return [NSArray arrayWithObjects:listing,Home_location,Home_TopPicks,Home_Favourites,Category_Comedy, nil];
}

+(UIImage*)imageByName:(NSString*)imageName{
    imageName = [imageName stringByReplacingOccurrencesOfString:@".png" withString:@""];
    return [UIImage imageWithContentsOfFile:[[NSBundle mainBundle]pathForResource:imageName ofType:@"png"]];
}

@end
