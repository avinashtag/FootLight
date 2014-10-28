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
    [self.tablePicker reloadData];
//    [self fillDatasource];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField{

    //******* Open Picker ******//
    UITableViewCell *flPicker = [self.tablePicker cellForRowAtIndexPath:[NSIndexPath indexPathForRow:1 inSection:0]];
    flPicker.hidden = NO;
    [self.tablePicker reloadData];
    self.tablePicker
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

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 4;
}

// Row display. Implementers should *always* try to reuse cells by setting each cell's reuseIdentifier and querying for available reusable cells with dequeueReusableCellWithIdentifier:
// Cell gets various attributes set automatically based on table (separators) and data source (accessory views, editing controls)

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    FLPicker *cell;
    if (indexPath.row == 0 || indexPath.row == 2) {
        static NSString *cellIdentifier =  @"PickerCell";
        cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
        cell = [[[NSBundle mainBundle] loadNibNamed:@"FLPicker" owner:self options:nil] objectAtIndex:1];
        cell.textField.delegate = self;
    }
    else{
        static NSString *cellIdentifier =  @"ConfigCell";
        cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
        cell = [[[NSBundle mainBundle] loadNibNamed:@"FLPicker" owner:self options:nil] objectAtIndex:1];
        cell.pickerDatasource =  indexPath.row == 1? [cell statusDatasource]:[cell theaterTypeDatasource];
        cell.hidden = YES;
    }
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    //    ******* navigate to detailView
    
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row == 1 || indexPath.row == 3) {
        @try {
//            UITableViewCell *model = [tableView cellForRowAtIndexPath:indexPath];
            return 0;//(model.isHidden) ? 0 : 206;
        }
        @catch (NSException *exception) {
            return 0;
        }
    }
    return 44;
}


-(void)fillDatasource{
    
    self.cellsList = [[NSMutableArray alloc]init];
    
    FLPicker *timingCell = [[[NSBundle mainBundle]loadNibNamed:@"FLPicker" owner:nil options:nil] objectAtIndex:1];
    [timingCell.textField setDelegate:self];
    [self.cellsList addObject:timingCell];
    
    FLPicker *timingCellPicker = [[[NSBundle mainBundle]loadNibNamed:@"FLPicker" owner:nil options:nil] objectAtIndex:0];
    timingCellPicker.pickerDatasource =    [timingCellPicker statusDatasource];
    [timingCellPicker callBackPickerSelected:^(id value) {
        
    } cancelPicker:^(id value) {
        
    }];
    timingCellPicker.hidden = YES;
    [self.cellsList addObject:timingCellPicker];


    FLPicker *theaterType = [[[NSBundle mainBundle]loadNibNamed:@"FLPicker" owner:nil options:nil] objectAtIndex:1];
    [theaterType.textField setDelegate:self];
    [self.cellsList addObject:theaterType];
    
    FLPicker *theaterTypePicker = [[[NSBundle mainBundle]loadNibNamed:@"FLPicker" owner:nil options:nil] objectAtIndex:0];
    theaterTypePicker.pickerDatasource =    [theaterTypePicker statusDatasource];
    [theaterTypePicker callBackPickerSelected:^(id value) {
        
    } cancelPicker:^(id value) {
        
    }];
    theaterTypePicker.hidden = YES;
    [self.cellsList addObject:theaterTypePicker];
    [self.tablePicker reloadData];
}
@end
