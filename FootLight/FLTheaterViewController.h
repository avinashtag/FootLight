//
//  FLTheaterViewController.h
//  FootLight
//
//  Created by Avinash Tag on 25/10/2014.
//  Copyright (c) 2014 Avinash Tag. All rights reserved.
//

#import "ViewController.h"

@interface FLTheaterViewController : ViewController<UITableViewDataSource,UITableViewDelegate,UITextFieldDelegate>

@property (strong, nonatomic) IBOutlet UILabel *titlenavigation;

@property (strong, nonatomic) IBOutlet UITextField *theaterType;
@property (strong, nonatomic) IBOutlet UITextField *showStatus;
@end
