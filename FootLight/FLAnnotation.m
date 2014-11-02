//
//  FLAnnotation.m
//  FootLight
//
//  Created by Avinash Tag on 2/11/2014.
//  Copyright (c) 2014 Avinash Tag. All rights reserved.
//

#import "FLAnnotation.h"

@implementation FLAnnotation

@synthesize title = _title;
@synthesize coordinate = _coordinate;
@synthesize subtitle = _subtitle;

-(instancetype)initWithCordinate:(CLLocationCoordinate2D)cordinate title:(NSString*)tl subtitle:(NSString*)sub{
    
    self = [super init];
    _title = tl;
    _subtitle = sub;
    _coordinate = cordinate;
    return self;
}


@end
