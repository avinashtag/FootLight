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
#import "UIView+FLView.h"
#import "ViewController.h"

@interface FLNavigationBar (){
    FLLeftMenuViewController *leftmenuController ;
    NSString* previousTitle;
}

@end

@implementation FLNavigationBar

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    previousTitle = FlHome;
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self.navigationTitle setText:[AppDelegate sharedNavigationController].title];
    
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
- (IBAction)sidePanel:(UITapGestureRecognizer *)sender {
    if (![self.navigationTitle.text isEqual:@"Foot Light"]) {
        leftmenuController = [[FLLeftMenuViewController alloc]initWithNibName:@"FLLeftMenuViewController" bundle:nil];
        UIViewController *VC = [[AppDelegate sharedNavigationController].viewControllers lastObject];
        
        CGRect frame = VC.view.frame;
        [leftmenuController.view setFrame:frame];
        [VC.view addSubview:leftmenuController.view];
        previousTitle = self.navigationTitle.text;
        [leftmenuController animateViewIn:@"Foot Light"];
    }
    else{
        [leftmenuController animateViewOut:FlHome];
    }
    
}





@end
