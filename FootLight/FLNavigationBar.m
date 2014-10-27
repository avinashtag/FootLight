//
//  FLNavigationBar.m
//  FootLight
//
//  Created by Avinash Tag on 25/10/2014.
//  Copyright (c) 2014 Avinash Tag. All rights reserved.
//

#import "FLNavigationBar.h"
#import "FLLeftMenuViewController.h"
#import "AppDelegate.h"

@interface FLNavigationBar (){
    FLLeftMenuViewController *leftmenuController ;
}

@end

@implementation FLNavigationBar

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
}

-(UIView*)NavigationBarWithTitle:(NSString*)title{
    
    [_navigationTitle setText:title];
    [self.view setFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
    return self.view;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)homeButtonPressed:(UIButton *)sender {
    sender.selected = !sender.selected;
    
    id tt = [AppDelegate SharedApplication];
    tt = [AppDelegate SharedApplication].window;
    if (sender.selected) {
        leftmenuController = [[FLLeftMenuViewController alloc]initWithNibName:@"FLLeftMenuViewController" bundle:nil];
        CGRect frameMenu = leftmenuController.view.frame;
        [leftmenuController.view setFrame:CGRectMake(-frameMenu.size.width, self.view.frame.size.height, frameMenu.size.width, self.view.superview.frame.size.height)];
        [self.view.superview addSubview:leftmenuController.view];
        [UIView animateWithDuration:0.30 animations:^{
            [leftmenuController.view setFrame:CGRectMake(0, self.view.frame.size.height, frameMenu.size.width, self.view.superview.frame.size.height)];
  
            
        } completion:^(BOOL finished) {
            
        }];
    }
    else{
        CGRect frameMenu = leftmenuController.view.frame;
        [UIView animateWithDuration:0.30 animations:^{
            [leftmenuController.view setFrame:CGRectMake(-frameMenu.size.width, self.view.frame.size.height, frameMenu.size.width, self.view.superview.frame.size.height)];
            
            
        } completion:^(BOOL finished) {
            [leftmenuController.view removeFromSuperview];
        }];

    }

}
@end
