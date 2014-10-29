//
//  FLZipResponseModel.m
//
//  Created by Avinash Tag on 28/10/14
//  Copyright (c) 2014 __MyCompanyName__. All rights reserved.
//

#import "FLZipResponseModel.h"


NSString *const kFLZipResponseModelVenueTheatreState = @"VenueTheatreState";
NSString *const kFLZipResponseModelCompanyName = @"CompanyName";
NSString *const kFLZipResponseModelClosingDate = @"ClosingDate";
NSString *const kFLZipResponseModelTitle = @"Title";
NSString *const kFLZipResponseModelWednesdayMatinee = @"WednesdayMatinee";
NSString *const kFLZipResponseModelVenueTheatreStreetAddress = @"VenueTheatreStreetAddress";
NSString *const kFLZipResponseModelRecordID = @"RecordID";
NSString *const kFLZipResponseModelTuesday = @"Tuesday";
NSString *const kFLZipResponseModelVenueTheatreName = @"VenueTheatreName";
NSString *const kFLZipResponseModelSunday = @"Sunday";
NSString *const kFLZipResponseModelContentDue = @"ContentDue";
NSString *const kFLZipResponseModelProductionWebsite = @"ProductionWebsite";
NSString *const kFLZipResponseModelVenueLongitude = @"VenueLongitude";
NSString *const kFLZipResponseModelSaturday = @"Saturday";
NSString *const kFLZipResponseModelThursday = @"Thursday";
NSString *const kFLZipResponseModelPlayDescription = @"PlayDescription";
NSString *const kFLZipResponseModelOpeningDate = @"OpeningDate";
NSString *const kFLZipResponseModelAvg = @"avg";
NSString *const kFLZipResponseModelSpecificRegion = @"SpecificRegion";
NSString *const kFLZipResponseModelSaturdayMatinee = @"SaturdayMatinee";
NSString *const kFLZipResponseModelVenueLatitude = @"VenueLatitude";
NSString *const kFLZipResponseModelSundayMatinee = @"SundayMatinee";
NSString *const kFLZipResponseModelMonday = @"Monday";
NSString *const kFLZipResponseModelImagename = @"imagename";
NSString *const kFLZipResponseModelWednesday = @"Wednesday";
NSString *const kFLZipResponseModelDistance = @"distance";
NSString *const kFLZipResponseModelRelatedVenue = @"RelatedVenue";
NSString *const kFLZipResponseModelFriday = @"Friday";
NSString *const kFLZipResponseModelGenre = @"Genre";
NSString *const kFLZipResponseModelVenueTheatreCity = @"VenueTheatreCity";
NSString *const kFLZipResponseModelBoxOfficePhone = @"boxOfficePhone";
NSString *const kFLZipResponseModelWeeklyPassportEblast = @"WeeklyPassportEblast";
NSString *const kFLZipResponseModelCellCreated = @"CellCreated";
NSString *const kFLZipResponseModelCellTimings = @"CellTimings";
NSString *const kFLZipResponseModelFavourite = @"Favourite";


@interface FLZipResponseModel ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation FLZipResponseModel

@synthesize venueTheatreState = _venueTheatreState;
@synthesize companyName = _companyName;
@synthesize closingDate = _closingDate;
@synthesize title = _title;
@synthesize wednesdayMatinee = _wednesdayMatinee;
@synthesize venueTheatreStreetAddress = _venueTheatreStreetAddress;
@synthesize recordID = _recordID;
@synthesize tuesday = _tuesday;
@synthesize venueTheatreName = _venueTheatreName;
@synthesize sunday = _sunday;
@synthesize contentDue = _contentDue;
@synthesize productionWebsite = _productionWebsite;
@synthesize venueLongitude = _venueLongitude;
@synthesize saturday = _saturday;
@synthesize thursday = _thursday;
@synthesize playDescription = _playDescription;
@synthesize openingDate = _openingDate;
@synthesize avg = _avg;
@synthesize specificRegion = _specificRegion;
@synthesize saturdayMatinee = _saturdayMatinee;
@synthesize venueLatitude = _venueLatitude;
@synthesize sundayMatinee = _sundayMatinee;
@synthesize monday = _monday;
@synthesize imagename = _imagename;
@synthesize wednesday = _wednesday;
@synthesize distance = _distance;
@synthesize relatedVenue = _relatedVenue;
@synthesize friday = _friday;
@synthesize genre = _genre;
@synthesize venueTheatreCity = _venueTheatreCity;
@synthesize boxOfficePhone = _boxOfficePhone;
@synthesize weeklyPassportEblast = _weeklyPassportEblast;
@synthesize cellCreated = _cellCreated;;
@synthesize cellTimings = _cellTimings;
@synthesize favourite = _favourite;


+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict
{
    return [[self alloc] initWithDictionary:dict];
}

- (instancetype)initWithDictionary:(NSDictionary *)dict
{
    self = [super init];
    
    // This check serves to make sure that a non-NSDictionary object
    // passed into the model class doesn't break the parsing.
    if(self && [dict isKindOfClass:[NSDictionary class]]) {
            self.venueTheatreState = [self objectOrNilForKey:kFLZipResponseModelVenueTheatreState fromDictionary:dict];
            self.companyName = [self objectOrNilForKey:kFLZipResponseModelCompanyName fromDictionary:dict];
            self.closingDate = [self objectOrNilForKey:kFLZipResponseModelClosingDate fromDictionary:dict];
            self.title = [self objectOrNilForKey:kFLZipResponseModelTitle fromDictionary:dict];
            self.wednesdayMatinee = [self objectOrNilForKey:kFLZipResponseModelWednesdayMatinee fromDictionary:dict];
            self.venueTheatreStreetAddress = [self objectOrNilForKey:kFLZipResponseModelVenueTheatreStreetAddress fromDictionary:dict];
            self.recordID = [self objectOrNilForKey:kFLZipResponseModelRecordID fromDictionary:dict];
            self.tuesday = [self objectOrNilForKey:kFLZipResponseModelTuesday fromDictionary:dict];
            self.venueTheatreName = [self objectOrNilForKey:kFLZipResponseModelVenueTheatreName fromDictionary:dict];
            self.sunday = [self objectOrNilForKey:kFLZipResponseModelSunday fromDictionary:dict];
            self.contentDue = [self objectOrNilForKey:kFLZipResponseModelContentDue fromDictionary:dict];
            self.productionWebsite = [self objectOrNilForKey:kFLZipResponseModelProductionWebsite fromDictionary:dict];
            self.venueLongitude = [self objectOrNilForKey:kFLZipResponseModelVenueLongitude fromDictionary:dict];
            self.saturday = [self objectOrNilForKey:kFLZipResponseModelSaturday fromDictionary:dict];
            self.thursday = [self objectOrNilForKey:kFLZipResponseModelThursday fromDictionary:dict];
            self.playDescription = [self objectOrNilForKey:kFLZipResponseModelPlayDescription fromDictionary:dict];
            self.openingDate = [self objectOrNilForKey:kFLZipResponseModelOpeningDate fromDictionary:dict];
            self.avg = [self objectOrNilForKey:kFLZipResponseModelAvg fromDictionary:dict];
            self.specificRegion = [self objectOrNilForKey:kFLZipResponseModelSpecificRegion fromDictionary:dict];
            self.saturdayMatinee = [self objectOrNilForKey:kFLZipResponseModelSaturdayMatinee fromDictionary:dict];
            self.venueLatitude = [self objectOrNilForKey:kFLZipResponseModelVenueLatitude fromDictionary:dict];
            self.sundayMatinee = [self objectOrNilForKey:kFLZipResponseModelSundayMatinee fromDictionary:dict];
            self.monday = [self objectOrNilForKey:kFLZipResponseModelMonday fromDictionary:dict];
            self.imagename = [self objectOrNilForKey:kFLZipResponseModelImagename fromDictionary:dict];
            self.wednesday = [self objectOrNilForKey:kFLZipResponseModelWednesday fromDictionary:dict];
            self.distance = [self objectOrNilForKey:kFLZipResponseModelDistance fromDictionary:dict];
            self.relatedVenue = [self objectOrNilForKey:kFLZipResponseModelRelatedVenue fromDictionary:dict];
            self.friday = [self objectOrNilForKey:kFLZipResponseModelFriday fromDictionary:dict];
            self.genre = [self objectOrNilForKey:kFLZipResponseModelGenre fromDictionary:dict];
            self.venueTheatreCity = [self objectOrNilForKey:kFLZipResponseModelVenueTheatreCity fromDictionary:dict];
            self.boxOfficePhone = [self objectOrNilForKey:kFLZipResponseModelBoxOfficePhone fromDictionary:dict];
            self.weeklyPassportEblast = [self objectOrNilForKey:kFLZipResponseModelWeeklyPassportEblast fromDictionary:dict];

        self.cellTimings = [self showTimings:self];
        self.cellCreated = [NSNumber numberWithDouble:ceil([self.cellTimings sizeWithAttributes:@{NSFontAttributeName: [UIFont systemFontOfSize:15.0]}].height)];
        self.favourite = [NSNumber numberWithBool:NO];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.venueTheatreState forKey:kFLZipResponseModelVenueTheatreState];
    [mutableDict setValue:self.companyName forKey:kFLZipResponseModelCompanyName];
    [mutableDict setValue:self.closingDate forKey:kFLZipResponseModelClosingDate];
    [mutableDict setValue:self.title forKey:kFLZipResponseModelTitle];
    [mutableDict setValue:self.wednesdayMatinee forKey:kFLZipResponseModelWednesdayMatinee];
    [mutableDict setValue:self.venueTheatreStreetAddress forKey:kFLZipResponseModelVenueTheatreStreetAddress];
    [mutableDict setValue:self.recordID forKey:kFLZipResponseModelRecordID];
    [mutableDict setValue:self.tuesday forKey:kFLZipResponseModelTuesday];
    [mutableDict setValue:self.venueTheatreName forKey:kFLZipResponseModelVenueTheatreName];
    [mutableDict setValue:self.sunday forKey:kFLZipResponseModelSunday];
    [mutableDict setValue:self.contentDue forKey:kFLZipResponseModelContentDue];
    [mutableDict setValue:self.productionWebsite forKey:kFLZipResponseModelProductionWebsite];
    [mutableDict setValue:self.venueLongitude forKey:kFLZipResponseModelVenueLongitude];
    [mutableDict setValue:self.saturday forKey:kFLZipResponseModelSaturday];
    [mutableDict setValue:self.thursday forKey:kFLZipResponseModelThursday];
    [mutableDict setValue:self.playDescription forKey:kFLZipResponseModelPlayDescription];
    [mutableDict setValue:self.openingDate forKey:kFLZipResponseModelOpeningDate];
    [mutableDict setValue:self.avg forKey:kFLZipResponseModelAvg];
    [mutableDict setValue:self.specificRegion forKey:kFLZipResponseModelSpecificRegion];
    [mutableDict setValue:self.saturdayMatinee forKey:kFLZipResponseModelSaturdayMatinee];
    [mutableDict setValue:self.venueLatitude forKey:kFLZipResponseModelVenueLatitude];
    [mutableDict setValue:self.sundayMatinee forKey:kFLZipResponseModelSundayMatinee];
    [mutableDict setValue:self.monday forKey:kFLZipResponseModelMonday];
    [mutableDict setValue:self.imagename forKey:kFLZipResponseModelImagename];
    [mutableDict setValue:self.wednesday forKey:kFLZipResponseModelWednesday];
    [mutableDict setValue:self.distance forKey:kFLZipResponseModelDistance];
    [mutableDict setValue:self.relatedVenue forKey:kFLZipResponseModelRelatedVenue];
    [mutableDict setValue:self.friday forKey:kFLZipResponseModelFriday];
    [mutableDict setValue:self.genre forKey:kFLZipResponseModelGenre];
    [mutableDict setValue:self.venueTheatreCity forKey:kFLZipResponseModelVenueTheatreCity];
    [mutableDict setValue:self.boxOfficePhone forKey:kFLZipResponseModelBoxOfficePhone];
    [mutableDict setValue:self.weeklyPassportEblast forKey:kFLZipResponseModelWeeklyPassportEblast];
    [mutableDict setValue:self.cellCreated forKey:kFLZipResponseModelCellCreated];
    [mutableDict setValue:self.cellTimings forKey:kFLZipResponseModelCellTimings];
    [mutableDict setValue:self.favourite forKey:kFLZipResponseModelFavourite];

    return [NSDictionary dictionaryWithDictionary:mutableDict];
}

- (NSString *)description 
{
    return [NSString stringWithFormat:@"%@", [self dictionaryRepresentation]];
}

#pragma mark - Helper Method
- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict
{
    id object = [dict objectForKey:aKey];
    return [object isEqual:[NSNull null]] ? nil : object;
}


#pragma mark - NSCoding Methods

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super init];

    self.venueTheatreState = [aDecoder decodeObjectForKey:kFLZipResponseModelVenueTheatreState];
    self.companyName = [aDecoder decodeObjectForKey:kFLZipResponseModelCompanyName];
    self.closingDate = [aDecoder decodeObjectForKey:kFLZipResponseModelClosingDate];
    self.title = [aDecoder decodeObjectForKey:kFLZipResponseModelTitle];
    self.wednesdayMatinee = [aDecoder decodeObjectForKey:kFLZipResponseModelWednesdayMatinee];
    self.venueTheatreStreetAddress = [aDecoder decodeObjectForKey:kFLZipResponseModelVenueTheatreStreetAddress];
    self.recordID = [aDecoder decodeObjectForKey:kFLZipResponseModelRecordID];
    self.tuesday = [aDecoder decodeObjectForKey:kFLZipResponseModelTuesday];
    self.venueTheatreName = [aDecoder decodeObjectForKey:kFLZipResponseModelVenueTheatreName];
    self.sunday = [aDecoder decodeObjectForKey:kFLZipResponseModelSunday];
    self.contentDue = [aDecoder decodeObjectForKey:kFLZipResponseModelContentDue];
    self.productionWebsite = [aDecoder decodeObjectForKey:kFLZipResponseModelProductionWebsite];
    self.venueLongitude = [aDecoder decodeObjectForKey:kFLZipResponseModelVenueLongitude];
    self.saturday = [aDecoder decodeObjectForKey:kFLZipResponseModelSaturday];
    self.thursday = [aDecoder decodeObjectForKey:kFLZipResponseModelThursday];
    self.playDescription = [aDecoder decodeObjectForKey:kFLZipResponseModelPlayDescription];
    self.openingDate = [aDecoder decodeObjectForKey:kFLZipResponseModelOpeningDate];
    self.avg = [aDecoder decodeObjectForKey:kFLZipResponseModelAvg];
    self.specificRegion = [aDecoder decodeObjectForKey:kFLZipResponseModelSpecificRegion];
    self.saturdayMatinee = [aDecoder decodeObjectForKey:kFLZipResponseModelSaturdayMatinee];
    self.venueLatitude = [aDecoder decodeObjectForKey:kFLZipResponseModelVenueLatitude];
    self.sundayMatinee = [aDecoder decodeObjectForKey:kFLZipResponseModelSundayMatinee];
    self.monday = [aDecoder decodeObjectForKey:kFLZipResponseModelMonday];
    self.imagename = [aDecoder decodeObjectForKey:kFLZipResponseModelImagename];
    self.wednesday = [aDecoder decodeObjectForKey:kFLZipResponseModelWednesday];
    self.distance = [aDecoder decodeObjectForKey:kFLZipResponseModelDistance];
    self.relatedVenue = [aDecoder decodeObjectForKey:kFLZipResponseModelRelatedVenue];
    self.friday = [aDecoder decodeObjectForKey:kFLZipResponseModelFriday];
    self.genre = [aDecoder decodeObjectForKey:kFLZipResponseModelGenre];
    self.venueTheatreCity = [aDecoder decodeObjectForKey:kFLZipResponseModelVenueTheatreCity];
    self.boxOfficePhone = [aDecoder decodeObjectForKey:kFLZipResponseModelBoxOfficePhone];
    self.weeklyPassportEblast = [aDecoder decodeObjectForKey:kFLZipResponseModelWeeklyPassportEblast];
    self.cellCreated = [aDecoder decodeObjectForKey:kFLZipResponseModelCellCreated];
    self.cellTimings = [aDecoder decodeObjectForKey:kFLZipResponseModelCellTimings];
    self.favourite = [aDecoder decodeObjectForKey:kFLZipResponseModelFavourite];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_venueTheatreState forKey:kFLZipResponseModelVenueTheatreState];
    [aCoder encodeObject:_companyName forKey:kFLZipResponseModelCompanyName];
    [aCoder encodeObject:_closingDate forKey:kFLZipResponseModelClosingDate];
    [aCoder encodeObject:_title forKey:kFLZipResponseModelTitle];
    [aCoder encodeObject:_wednesdayMatinee forKey:kFLZipResponseModelWednesdayMatinee];
    [aCoder encodeObject:_venueTheatreStreetAddress forKey:kFLZipResponseModelVenueTheatreStreetAddress];
    [aCoder encodeObject:_recordID forKey:kFLZipResponseModelRecordID];
    [aCoder encodeObject:_tuesday forKey:kFLZipResponseModelTuesday];
    [aCoder encodeObject:_venueTheatreName forKey:kFLZipResponseModelVenueTheatreName];
    [aCoder encodeObject:_sunday forKey:kFLZipResponseModelSunday];
    [aCoder encodeObject:_contentDue forKey:kFLZipResponseModelContentDue];
    [aCoder encodeObject:_productionWebsite forKey:kFLZipResponseModelProductionWebsite];
    [aCoder encodeObject:_venueLongitude forKey:kFLZipResponseModelVenueLongitude];
    [aCoder encodeObject:_saturday forKey:kFLZipResponseModelSaturday];
    [aCoder encodeObject:_thursday forKey:kFLZipResponseModelThursday];
    [aCoder encodeObject:_playDescription forKey:kFLZipResponseModelPlayDescription];
    [aCoder encodeObject:_openingDate forKey:kFLZipResponseModelOpeningDate];
    [aCoder encodeObject:_avg forKey:kFLZipResponseModelAvg];
    [aCoder encodeObject:_specificRegion forKey:kFLZipResponseModelSpecificRegion];
    [aCoder encodeObject:_saturdayMatinee forKey:kFLZipResponseModelSaturdayMatinee];
    [aCoder encodeObject:_venueLatitude forKey:kFLZipResponseModelVenueLatitude];
    [aCoder encodeObject:_sundayMatinee forKey:kFLZipResponseModelSundayMatinee];
    [aCoder encodeObject:_monday forKey:kFLZipResponseModelMonday];
    [aCoder encodeObject:_imagename forKey:kFLZipResponseModelImagename];
    [aCoder encodeObject:_wednesday forKey:kFLZipResponseModelWednesday];
    [aCoder encodeObject:_distance forKey:kFLZipResponseModelDistance];
    [aCoder encodeObject:_relatedVenue forKey:kFLZipResponseModelRelatedVenue];
    [aCoder encodeObject:_friday forKey:kFLZipResponseModelFriday];
    [aCoder encodeObject:_genre forKey:kFLZipResponseModelGenre];
    [aCoder encodeObject:_venueTheatreCity forKey:kFLZipResponseModelVenueTheatreCity];
    [aCoder encodeObject:_boxOfficePhone forKey:kFLZipResponseModelBoxOfficePhone];
    [aCoder encodeObject:_weeklyPassportEblast forKey:kFLZipResponseModelWeeklyPassportEblast];
    [aCoder encodeObject:_cellCreated forKey:kFLZipResponseModelCellCreated];
    [aCoder encodeObject:_cellTimings forKey:kFLZipResponseModelCellTimings];
    [aCoder encodeObject:_favourite forKey:kFLZipResponseModelFavourite];
    
}

- (id)copyWithZone:(NSZone *)zone
{
    FLZipResponseModel *copy = [[FLZipResponseModel alloc] init];
    
    if (copy) {

        copy.venueTheatreState = [self.venueTheatreState copyWithZone:zone];
        copy.companyName = [self.companyName copyWithZone:zone];
        copy.closingDate = [self.closingDate copyWithZone:zone];
        copy.title = [self.title copyWithZone:zone];
        copy.wednesdayMatinee = [self.wednesdayMatinee copyWithZone:zone];
        copy.venueTheatreStreetAddress = [self.venueTheatreStreetAddress copyWithZone:zone];
        copy.recordID = [self.recordID copyWithZone:zone];
        copy.tuesday = [self.tuesday copyWithZone:zone];
        copy.venueTheatreName = [self.venueTheatreName copyWithZone:zone];
        copy.sunday = [self.sunday copyWithZone:zone];
        copy.contentDue = [self.contentDue copyWithZone:zone];
        copy.productionWebsite = [self.productionWebsite copyWithZone:zone];
        copy.venueLongitude = [self.venueLongitude copyWithZone:zone];
        copy.saturday = [self.saturday copyWithZone:zone];
        copy.thursday = [self.thursday copyWithZone:zone];
        copy.playDescription = [self.playDescription copyWithZone:zone];
        copy.openingDate = [self.openingDate copyWithZone:zone];
        copy.avg = [self.avg copyWithZone:zone];
        copy.specificRegion = [self.specificRegion copyWithZone:zone];
        copy.saturdayMatinee = [self.saturdayMatinee copyWithZone:zone];
        copy.venueLatitude = [self.venueLatitude copyWithZone:zone];
        copy.sundayMatinee = [self.sundayMatinee copyWithZone:zone];
        copy.monday = [self.monday copyWithZone:zone];
        copy.imagename = [self.imagename copyWithZone:zone];
        copy.wednesday = [self.wednesday copyWithZone:zone];
        copy.distance = [self.distance copyWithZone:zone];
        copy.relatedVenue = [self.relatedVenue copyWithZone:zone];
        copy.friday = [self.friday copyWithZone:zone];
        copy.genre = [self.genre copyWithZone:zone];
        copy.venueTheatreCity = [self.venueTheatreCity copyWithZone:zone];
        copy.boxOfficePhone = [self.boxOfficePhone copyWithZone:zone];
        copy.weeklyPassportEblast = [self.weeklyPassportEblast copyWithZone:zone];
        copy.cellTimings = [self.cellTimings copyWithZone:zone];
        copy.cellCreated = [self.cellCreated copyWithZone:zone];
        copy.favourite = [self.favourite copyWithZone:zone];
    }
    
    return copy;
}

-(NSString*)showTimings:(FLZipResponseModel*)model{
    
    NSString *noShow = @"No Show";
    NSMutableArray *timings = [[NSMutableArray alloc]init];
    [model.friday isEqualToString:noShow] == NO ? [timings addObject:[NSString stringWithFormat:@"Friday: %@",model.friday]] : NSLog(@"");
    [model.saturday isEqualToString:noShow] == NO ? [timings addObject:[NSString stringWithFormat:@"Saturday: %@",model.saturday]] : NSLog(@"");
    [model.sunday isEqualToString:noShow] == NO ? [timings addObject:[NSString stringWithFormat:@"Sunday: %@",model.sunday]] : NSLog(@"");
    [model.monday isEqualToString:noShow] == NO ? [timings addObject:[NSString stringWithFormat:@"Monday: %@",model.monday]] : NSLog(@"");
    [model.tuesday isEqualToString:noShow] == NO ? [timings addObject:[NSString stringWithFormat:@"Tuesday: %@",model.tuesday]] : NSLog(@"");
    [model.wednesday isEqualToString:noShow] == NO ? [timings addObject:[NSString stringWithFormat:@"Wednesday: %@",model.wednesday]] : NSLog(@"");
    [model.thursday isEqualToString:noShow] == NO ? [timings addObject:[NSString stringWithFormat:@"Thursday: %@",model.thursday]] : NSLog(@"");
    return [timings componentsJoinedByString:@"\n"];
    
}

@end
