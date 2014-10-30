//
//  UINavigationController+FLNavigationController.m
//  FootLight
//
//  Created by Avinash Tag on 30/10/14.
//  Copyright (c) 2014 Avinash Tag. All rights reserved.
//

#import "UINavigationController+FLNavigationController.h"

@implementation UINavigationController (FLNavigationController)

-(UIViewController *)currentStackCheckViewController:(Class)viewController{
    __block UIViewController *isPresent = nil;
    [[self viewControllers] enumerateObjectsUsingBlock:^(UIViewController* VC, NSUInteger idx, BOOL *stop) {
        if ([VC isKindOfClass:viewController]) {
            isPresent = VC;
            *stop = YES;
        }
    }];
    return isPresent;
}
@end
