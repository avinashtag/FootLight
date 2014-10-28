//
//  FLProductListViewController.h
//  FootLight
//
//  Created by Avinash Tag on 28/10/2014.
//  Copyright (c) 2014 Avinash Tag. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FLProductListViewController : UIViewController


@property (strong, nonatomic) IBOutlet UILabel *navTitle;
@property (strong, nonatomic) IBOutlet UITableView *productsTable;
@property (strong, nonatomic) NSMutableArray *products;

-(void)zipCallNormal:(NSString*)url;
@end
