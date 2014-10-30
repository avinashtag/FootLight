//
//  FLMapViewController.h
//  FootLight
//
//  Created by Avinash Tag on 29/10/2014.
//  Copyright (c) 2014 Avinash Tag. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import "FLZipResponseModel.h"

@interface FLMapViewController : UIViewController<MKMapViewDelegate>

@property (strong, nonatomic) IBOutlet MKMapView *mapView;
@property (nonatomic, strong) NSMutableArray *mapAnnotations;
@property (nonatomic, strong) FLZipResponseModel *model;

@end
