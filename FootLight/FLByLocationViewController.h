//
//  FLByLocationViewController.h
//  FootLight
//
//  Created by Avinash Tag on 25/10/2014.
//  Copyright (c) 2014 Avinash Tag. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FLByLocationViewController : UIViewController<UITextFieldDelegate>

@property (strong, nonatomic) IBOutlet UITextField *zipCode;
@property (strong, nonatomic) IBOutlet UITextField *cityState;
@property (strong, nonatomic) IBOutlet UITableView *locationTable;
//@property (strong, nonatomic) IBOutlet UITextField *radius;
@property (strong, nonatomic) __block NSString *radius;
@property (strong, nonatomic)  UIView *footer;
@end
