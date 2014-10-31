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
#import "FLPickerModel.h"
#import "FLPicker.h"

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

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
    self.radius = @"5";
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)search:(UIButton *)sender {
    if ([self validation]) {
        FLTheaterViewController *selectionVC = [self.storyboard instantiateViewControllerWithIdentifier:@"FLTheaterViewController"];
        selectionVC.zip = self.zipCode.text;
        selectionVC.radius = self.radius;
        [self.navigationController pushViewController:selectionVC animated:YES];
        [selectionVC.titlenavigation setText:FLByLocation];
    }
}

/*- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField{
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
}*/

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
    return YES;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 2;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (indexPath.row == 0) {
        static NSString *identifier = @"pickerView";
        FLPicker *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
        if (!cell) {
            cell = [[[NSBundle mainBundle]loadNibNamed:@"FLPicker" owner:nil options:nil] objectAtIndex:1];
        }
        cell.textField.text = self.radius;
        return cell;
    }
    static NSString *identifier = @"pickerId";
    FLPicker *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (!cell) {
        cell = [[[NSBundle mainBundle]loadNibNamed:@"FLPicker" owner:nil options:nil] objectAtIndex:0];
    }
    cell.pickerDatasource = [cell radiusFill];
    [cell.picker reloadAllComponents];
//    __block FLPicker *previousCell = (FLPicker*)[tableView cellForRowAtIndexPath:[NSIndexPath indexPathForItem:0 inSection:0]];
//    NSPredicate *fetch = [NSPredicate predicateWithFormat:[NSString stringWithFormat:@"SELf.pickerTitle CONTAINS[cd] %@",previousCell.textField.text]];
//    FLPickerModel *model = [[cell.pickerDatasource filteredArrayUsingPredicate:fetch] lastObject];
//    [cell.picker selectRow:[cell.pickerDatasource indexOfObject:model] inComponent:0 animated:YES];
    [cell callBackPickerSelected:^(NSString* value) {
        _radius = value;
//        previousCell.selected = NO;
    } cancelPicker:^(NSString* value) {
        
    }];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{

    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    cell.selected = !cell.selected;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row == 0) {
        return 44;
    }
    return 205;
}


@end
