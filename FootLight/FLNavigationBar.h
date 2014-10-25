//
//  FLNavigationBar.h
//  FootLight
//
//  Created by Avinash Tag on 25/10/2014.
//  Copyright (c) 2014 Avinash Tag. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FLNavigationBar : UIViewController

@property (strong, nonatomic) IBOutlet UILabel *navigationTitle;
- (IBAction)homeButtonPressed:(UIButton *)sender;

-(UIView*)NavigationBarWithTitle:(NSString*)title;
@end
