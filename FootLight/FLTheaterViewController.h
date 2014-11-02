//
//  FLTheaterViewController.h
//  FootLight
//
//  Created by Avinash Tag on 25/10/2014.
//  Copyright (c) 2014 Avinash Tag. All rights reserved.
//

#import "ViewController.h"

typedef enum{
    
    FLZipService = 0,
    FLLocation,
    
}FLServiceType;

@interface FLTheaterViewController : ViewController<UITableViewDataSource,UITableViewDelegate,UITextFieldDelegate>

@property (strong, nonatomic) IBOutlet UILabel *titlenavigation;
@property (strong, nonatomic) IBOutlet UITableView *theaterTable;
@property (assign, nonatomic) FLServiceType serviceType;

@property (strong, nonatomic)  NSString *zip;
@property (strong, nonatomic)  CLPlacemark *placemark;
@property (strong, nonatomic)  NSString *radius;
@property (strong, nonatomic)  NSString *city;
@property (strong, nonatomic)  UIView *footer;
@property (strong, nonatomic)  __block UIView *theaterTypeHeader;
@property (strong, nonatomic)  __block UIView *showStatusHeader;

@end
