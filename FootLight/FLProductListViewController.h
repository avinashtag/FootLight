//
//  FLProductListViewController.h
//  FootLight
//
//  Created by Avinash Tag on 28/10/2014.
//  Copyright (c) 2014 Avinash Tag. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef void(^refreshCallCompletion)(NSNumber *pagecount);


@interface FLProductListViewController : UIViewController


@property (strong, nonatomic) IBOutlet UILabel *navTitle;
@property (strong, nonatomic) IBOutlet UITableView *productsTable;
@property (strong, nonatomic) IBOutlet UIActivityIndicatorView *activity;
@property (strong, nonatomic) __block NSMutableArray *products;
@property (strong, nonatomic) UIRefreshControl *refreshControl;
@property (strong, nonatomic) refreshCallCompletion completion;

-(void)zipCallNormal:(NSString*)url filterGenere:(NSString*)genere;
-(void)loadFavourite;
-(void)statusFilter:(NSString*)url filterGenere:(NSString*)genere;
-(void)refreshCompletion:(refreshCallCompletion)block;
@end
