//
//  FLTheaterViewController.m
//  FootLight
//
//  Created by Avinash Tag on 25/10/2014.
//  Copyright (c) 2014 Avinash Tag. All rights reserved.
//

#import "FLTheaterViewController.h"
#import "UIViewController+ShowModalFromView.h"
#import "FLPicker.h"
#import "FLNavigationBar.h"

@interface FLTheaterViewController (){
    FLNavigationBar *navBar;
}

@end

@implementation FLTheaterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    navBar = [[FLNavigationBar alloc] initWithNibName:@"FLNavigationBar" bundle:nil];
    [self.view addSubview:navBar.view];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField{

    //******* Open Picker ******//
    FLPicker *flPicker = [[FLPicker alloc]initWithNibName:@"FLPicker" bundle:nil];
    CGSize viewSize = flPicker.view.frame.size; //Get View Size from view
    CGSize mainScreenSize = [[UIScreen mainScreen] bounds].size;
    
    CGRect targetFrame = CGRectMake(((mainScreenSize.width/2)-(viewSize.width/2)), ((mainScreenSize.height/2)-(viewSize.height/2)), viewSize.width, viewSize.height);
    CGRect startFrame = CGRectMake(mainScreenSize.width/2, mainScreenSize.height/2, 0, 0);
    
    [flPicker setModalPresentationStyle:UIModalPresentationFormSheet];
    [self presentModalViewController:flPicker startFrame:startFrame withTargetFrame:targetFrame];
    

    return NO;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)submit:(UIButton *)sender {
}
@end
