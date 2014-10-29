//
//  FLProductDetailViewController.h
//  FootLight
//
//  Created by Avinash Tag on 27/10/2014.
//  Copyright (c) 2014 Avinash Tag. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FLZipResponseModel.h"

@interface FLProductDetailViewController : UIViewController

@property (strong, nonatomic) IBOutlet UIScrollView *productScroll;
@property (strong, nonatomic) IBOutlet UILabel *ProductName;
@property (strong, nonatomic) IBOutlet UITextView *description;
@property (strong, nonatomic) IBOutlet UIImageView *productImage;
@property (strong, nonatomic) FLZipResponseModel *details;
- (IBAction)favorite:(UIButton *)sender;
- (IBAction)direction:(UIButton *)sender;
- (IBAction)voteDone:(UIButton *)sender;

@end
