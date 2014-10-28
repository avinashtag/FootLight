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
#import "FLByLocationViewController.h"
#import "ATWebService.h"
#import "FLProductDetailViewController.h"
#import "FLProductListViewController.h"

@interface FLTheaterViewController (){
    FLNavigationBar *navBar;
    BOOL islocation;
    UIView *footer;
    FLProductListViewController *product;
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


-(void)setServiceType{
    
    NSArray *viewControllers = [[ViewController sharedViewController].navigationController viewControllers];
    id controller = [viewControllers objectAtIndex:viewControllers.count-2];
    islocation = [controller isKindOfClass:[FLByLocationViewController class]];
}

- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField{

    //******* Open Picker ******//
    UITableViewCell *flPicker = [self.tablePicker cellForRowAtIndexPath:[NSIndexPath indexPathForRow:1 inSection:0]];
    flPicker.hidden = NO;
    [self.tablePicker reloadData];
//    self.tablePicker
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
    [self setServiceType];
    [self callWebservice];
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

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    if (!footer) {
        footer = [[[NSBundle mainBundle] loadNibNamed:@"FLPicker" owner:nil options:nil] objectAtIndex:2];
    }
    UIButton *button = (UIButton*)[footer viewWithTag:100];
    [button addTarget:self action:@selector(submit:) forControlEvents:UIControlEventTouchUpInside];
    return footer;
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 44;
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

-(void)callWebservice{

    if (islocation) {
        NSString *url = [NSString stringWithFormat:@"zipdis.php?q=%@&distance=%@",@"91502",@"25"];
        [[[ATWebService alloc] init] callOnUrlZip:url withSuccessHandler:^(NSArray* response, NSString *message) {
            dispatch_async(dispatch_get_main_queue(), ^{
                product = [[FLProductListViewController alloc]initWithNibName:@"FLProductListViewController" bundle:nil];
                product.products = [response mutableCopy];
                [self.navigationController pushViewController:product animated:YES];
            });
        } withFailHandler:^(id response, NSString *message, NSError *error) {
            
        }];

    }
}
@end
