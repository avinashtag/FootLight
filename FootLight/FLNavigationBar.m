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
    NSString* previousTitle;
}

@end

@implementation FLNavigationBar

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    previousTitle = @"Home";
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
        leftmenuController.navigation = self.navigationController;
        [self.navigation.topViewController.view addSubview:leftmenuController.view];
        previousTitle = self.navigationTitle.text;
        [leftmenuController animateViewIn:@"Foot Light"];
    }
    else{
        [leftmenuController animateViewOut:previousTitle];
    }

}




@end
