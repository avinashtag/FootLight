//
//  UIView+FLView.m
//  FootLight
//
//  Created by Avinash Tag on 25/10/2014.
//  Copyright (c) 2014 Avinash Tag. All rights reserved.
//

#import "UIView+FLView.h"
#import "FLNavigationBar.h"

@implementation UIView (FLView)
FLNavigationBar* navBar = nil;

-(void)addNavigationBarWithTitle:(NSString*)title navigation:(UINavigationController*)navController{
    
    if (navBar==nil) {
        navBar = [[FLNavigationBar alloc] initWithNibName:@"FLNavigationBar" bundle:nil];
    }
    navBar.navigation = navController;
    [navController.view addSubview:navBar.view];
    title!=nil ? [navBar.navigationTitle setText:title]: NSLog(@"");
    [self bringSubviewToFront:navBar.view];
    
}

-(void)addNavigationBarWithTitle:(NSString*)title{
    if (navBar==nil) {
        navBar = [[FLNavigationBar alloc] initWithNibName:@"FLNavigationBar" bundle:nil];
    }
    [self addSubview:navBar.view];
    title!=nil ? [navBar.navigationTitle setText:title]: NSLog(@"");
    [self bringSubviewToFront:navBar.view];

 }

-(void)setNavigationTitle:(NSString*)title{
    [navBar.navigationTitle setText:title];
}
@end
