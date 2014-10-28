//
//  FLZipResponseModel.h
//
//  Created by Avinash Tag on 28/10/14
//  Copyright (c) 2014 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface FLZipResponseModel : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) NSString *venueTheatreState;
@property (nonatomic, strong) NSString *companyName;
@property (nonatomic, strong) NSString *closingDate;
@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSString *wednesdayMatinee;
@property (nonatomic, strong) NSString *venueTheatreStreetAddress;
@property (nonatomic, strong) NSString *recordID;
@property (nonatomic, strong) NSString *tuesday;
@property (nonatomic, strong) NSString *venueTheatreName;
@property (nonatomic, strong) NSString *sunday;
@property (nonatomic, strong) NSString *contentDue;
@property (nonatomic, strong) NSString *productionWebsite;
@property (nonatomic, strong) NSString *venueLongitude;
@property (nonatomic, strong) NSString *saturday;
@property (nonatomic, strong) NSString *thursday;
@property (nonatomic, strong) NSString *playDescription;
@property (nonatomic, strong) NSString *openingDate;
@property (nonatomic, strong) NSString *avg;
@property (nonatomic, strong) NSString *specificRegion;
@property (nonatomic, strong) NSString *saturdayMatinee;
@property (nonatomic, strong) NSString *venueLatitude;
@property (nonatomic, strong) NSString *sundayMatinee;
@property (nonatomic, strong) NSString *monday;
@property (nonatomic, strong) NSString *imagename;
@property (nonatomic, strong) NSString *wednesday;
@property (nonatomic, strong) NSString *distance;
@property (nonatomic, strong) NSString *relatedVenue;
@property (nonatomic, strong) NSString *friday;
@property (nonatomic, strong) NSString *genre;
@property (nonatomic, strong) NSString *venueTheatreCity;
@property (nonatomic, strong) NSString *boxOfficePhone;
@property (nonatomic, strong) NSString *weeklyPassportEblast;
@property (nonatomic, strong) NSString *cellTimings;
@property (nonatomic, strong) NSNumber *cellCreated;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
