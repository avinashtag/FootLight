//
//  FLAnnotation.h
//  FootLight
//
//  Created by Avinash Tag on 2/11/2014.
//  Copyright (c) 2014 Avinash Tag. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>
#import <CoreLocation/CoreLocation.h>

@interface FLAnnotation : NSObject<MKAnnotation>{

CLLocationCoordinate2D coordinate;
NSString *title;
NSString *subtitle;
}

//@property  (nonatomic, assign)CLLocationCoordinate2D cordinate;
//@property  (nonatomic, strong)NSString *title;
//@property  (nonatomic, strong)NSString *subtitle;

-(instancetype)initWithCordinate:(CLLocationCoordinate2D)cordinate title:(NSString*)tl subtitle:(NSString*)sub;
@end
