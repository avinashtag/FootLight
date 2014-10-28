//
//  UIView+FLView.h
//  FootLight
//
//  Created by Avinash Tag on 25/10/2014.
//  Copyright (c) 2014 Avinash Tag. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (FLView)
-(void)addNavigationBarWithTitle:(NSString*)title;
-(void)addNavigationBarWithTitle:(NSString*)title navigation:(UINavigationController*)navController;
-(void)setNavigationTitle:(NSString*)title;
@end
