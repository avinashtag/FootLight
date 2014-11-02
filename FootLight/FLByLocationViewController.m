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
#import "NSString+FLString.h"
#import "MBProgressHUD.h"

@interface FLByLocationViewController ()
{
    ATPicker *pick;
    NSInteger rowsCount;
}
@end

@implementation FLByLocationViewController
CLPlacemark *thePlacemark;
FLServiceType serviceType;

- (void)viewDidLoad {
    [super viewDidLoad];
    self.header = [[[NSBundle mainBundle]loadNibNamed:NSStringFromClass([FLPicker class]) owner:nil options:nil] objectAtIndex:1];
    [self.header addGestureRecognizer:[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(openPicker:)]];

    self.footer = [[[NSBundle mainBundle]loadNibNamed:@"FLPicker" owner:nil options:nil] objectAtIndex:3];
    [(UIButton*)[self.footer viewWithTag:100] addTarget:self action:@selector(validation) forControlEvents:UIControlEventTouchUpInside];

}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
    [(UITextField*)[self.header viewWithTag:100] setText:@"5" ] ;
    rowsCount = 0;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(void)callWithService:(FLServiceType)srt placemark:(CLPlacemark*)park zipcode:(NSString*)zip{
    FLTheaterViewController *selectionVC = [self.storyboard instantiateViewControllerWithIdentifier:@"FLTheaterViewController"];
    selectionVC.serviceType = srt;
    selectionVC.zip = zip;
    selectionVC.placemark = park;
    selectionVC.radius = [(UITextField*)[self.header viewWithTag:100] text ];
    [self.navigationController pushViewController:selectionVC animated:YES];
    [selectionVC.titlenavigation setText:FLByLocation];

}
-(BOOL)textFieldShouldReturn:(UITextField *)textField{
    [textField resignFirstResponder];
    return YES;
}




-(void)validation{
    __block NSString *alertMessage = nil;
    
    if (![self.zipCode.text isBlankString]) {
        [self callWithService:FLZipService placemark:nil zipcode:self.zipCode.text];
    }
    else if (![self.cityState.text isBlankString]) {
        [MBProgressHUD showHUDAddedTo:self.view animated:YES];
        CLGeocoder *geocoder = [[CLGeocoder alloc] init];
        [geocoder geocodeAddressString:self.cityState.text completionHandler:^(NSArray *placemarks, NSError *error) {
            [MBProgressHUD hideAllHUDsForView:self.view animated:YES];
            if (error) {
                alertMessage = @"No location found.";
            } else {
                [self callWithService:FLLocation placemark:[placemarks lastObject] zipcode:nil];
            }
        }];
    }
    else if ([self.zipCode.text isBlankString] && [self.cityState.text isBlankString]) {
        alertMessage = @"Please select a zipcode/city.";
    }
    else if ([self.zipCode.text isBlankString]) {
        alertMessage = @"Please select a zipcode.";
    }
    else if ([self.cityState.text isBlankString]) {
        alertMessage = @"Please select a city.";
    }
    if (alertMessage != nil) {
        FLAlert *alert = [[FLAlert alloc]initWithTitle:@"Foot Light" message:alertMessage cancelButtonTitle:@"Cancel" cancelHandler:^(NSUInteger cancel) {
            
        } otherHandler:^(NSUInteger other) {
            
        } otherButtonTitles:nil];
    }
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return rowsCount;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
   
    static NSString *identifier = @"pickerId";
    FLPicker *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (!cell) {
        cell = [[[NSBundle mainBundle]loadNibNamed:@"FLPicker" owner:nil options:nil] objectAtIndex:0];
    }
    cell.pickerDatasource = [cell radiusFill];
    [cell.picker reloadAllComponents];
    [cell.picker selectRow:[cell.pickerDatasource indexOfObject:[(UITextField*)[self.header viewWithTag:100] text ]] inComponent:0 animated:YES];
    [cell callBackPickerSelected:^(NSString* value) {
        rowsCount = 0;
        [(UITextField*)[self.header viewWithTag:100] setText:value ];
        [tableView reloadData];
    } cancelPicker:^(NSString* value) {
        rowsCount =  0;
        [tableView reloadData];
    }];

    return cell;
}



-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return  192 ;
}

-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 50.0f;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 50.0f;
}

-(UIView*)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    return self.footer;
}

-(UIView*)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    return self.header;
}

- (void)openPicker:(UITapGestureRecognizer *)recognizer{
    
        rowsCount = 1;
        [self.locationTable reloadData];
}


@end
