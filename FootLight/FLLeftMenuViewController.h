//
//  FLLeftMenuViewController.h
//  FootLight
//
//  Created by Avinash Tag on 27/10/2014.
//  Copyright (c) 2014 Avinash Tag. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface FLLeftMenuCellModel : NSObject

@property(nonatomic, strong)UIImage *image;
@property(nonatomic, strong)NSString *menuTitleText;

-(instancetype)initWithTitle:(NSString*)title image:(UIImage*)imageLocal;
@end
@interface FLLeftMenuViewController : UIViewController
@property (strong, nonatomic) UINavigationController *navigation;

@property (nonatomic, strong)NSMutableArray *products;
@property (nonatomic, strong) IBOutlet UITableView *leftMenu;


-(void)animateViewIn:(NSString*)navigationTitleText;
-(void)animateViewOut:(NSString*)navigationTitleText;
@end
