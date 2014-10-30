//
//  FLByLocationViewController.m
//  FootLight
//
//  Created by Avinash Tag on 25/10/2014.
//  Copyright (c) 2014 Avinash Tag. All rights reserved.
//

#import "FLByLocationViewController.h"
#import "ATWebService.h"
#import "FLTheaterViewController.h"
#import "ATPicker.h"
#import "FLPickerModel.h"
#import "FLAlert.h"


@interface FLByLocationViewController ()
{
    ATPicker *pick;
}
@end

@implementation FLByLocationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)search:(UIButton *)sender {
    if ([self validation]) {
        FLTheaterViewController *selectionVC = [self.storyboard instantiateViewControllerWithIdentifier:@"FLTheaterViewController"];
        [self.navigationController pushViewController:selectionVC animated:YES];
        [selectionVC.titlenavigation setText:FLByLocation];
    }
}

- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField{
    if (textField == self.radius) {
        //Open Picker
        CGPoint center = textField.center;
        pick = [[ATPicker alloc]initWithNibName:@"ATPicker" bundle:nil];
        pick.pickerDatasource = [pick radiusFill];
//        pick.view.center = center;
        [pick showPickerWithPopInWithCenter:center];
        [pick callBackPickerSelected:^(FLPickerModel* value) {
            
            self.radius.text = value.pickerTitle;
        } cancelPicker:^(id value) {
            
        }];
        return NO;
    }
    return YES;
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField{
    [textField resignFirstResponder];
    return YES;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

-(BOOL)validation{
    if ([self.zipCode.text isEqualToString:@""]) {
        FLAlert *alert = [[FLAlert alloc]initWithTitle:@"Foot Light" message:@"Please select a zipcode/city." cancelButtonTitle:@"Ok" cancelHandler:^(NSUInteger cancel) {
            
        } otherHandler:^(NSUInteger other) {
            
        } otherButtonTitles:nil];
        return NO;
    }
    else if ([self.radius.text isEqualToString:@""]) {
        FLAlert *alert = [[FLAlert alloc]initWithTitle:@"Foot Light" message:@"Please select a radius." cancelButtonTitle:@"Ok" cancelHandler:^(NSUInteger cancel) {
            
        } otherHandler:^(NSUInteger other) {
            
        } otherButtonTitles:nil];
        return NO;
    }
    return YES;
}

@end
