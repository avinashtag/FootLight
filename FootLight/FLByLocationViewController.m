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
    [(UIButton*)[self.footer viewWithTag:100] addTarget:self action:@selector(search:) forControlEvents:UIControlEventTouchUpInside];

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

- (IBAction)search:(UIButton *)sender {
    if ([self validation]) {
        FLTheaterViewController *selectionVC = [self.storyboard instantiateViewControllerWithIdentifier:@"FLTheaterViewController"];
        selectionVC.serviceType = serviceType;
        selectionVC.zip = self.zipCode.text;
        selectionVC.placemark = thePlacemark;
        selectionVC.radius = [(UITextField*)[self.header viewWithTag:100] text ];
        [self.navigationController pushViewController:selectionVC animated:YES];
        [selectionVC.titlenavigation setText:FLByLocation];
    }
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField{
    [textField resignFirstResponder];
    return YES;
}

- (BOOL)addressSearch:(UITextField *)sender {
    
   __block BOOL check = NO;
    CLGeocoder *geocoder = [[CLGeocoder alloc] init];
    [geocoder geocodeAddressString:sender.text completionHandler:^(NSArray *placemarks, NSError *error) {
        if (error) {
            thePlacemark = nil;
            check = NO;
            FLAlert *alert = [[FLAlert alloc]initWithTitle:@"Foot Light" message:@"No location found ." cancelButtonTitle:@"Cancel" cancelHandler:^(NSUInteger cancel) {
                
            } otherHandler:^(NSUInteger other) {
                
            } otherButtonTitles:nil];
        } else {
            thePlacemark = [placemarks lastObject];
            check = YES;
            serviceType = FLLocation;
//            float spanX = 1.00725;
//            float spanY = 1.00725;
//            MKCoordinateRegion region;
//            region.center.latitude = thePlacemark.location.coordinate.latitude;
//            region.center.longitude = thePlacemark.location.coordinate.longitude;
//            region.span = MKCoordinateSpanMake(spanX, spanY);
//            [self.mapView setRegion:region animated:YES];
//            [self addAnnotation:thePlacemark];
        }
    }];
    return check;
}


-(BOOL)validation{
    if ([self.zipCode.text isBlankString] && ![self.cityState.text isBlankString]) {
        return [self addressSearch:self.cityState];
    }
    else if ([self.zipCode.text isBlankString]) {
        FLAlert *alert = [[FLAlert alloc]initWithTitle:@"Foot Light" message:@"Please select a zipcode/city." cancelButtonTitle:@"Ok" cancelHandler:^(NSUInteger cancel) {
            
        } otherHandler:^(NSUInteger other) {
            
        } otherButtonTitles:nil];
        return NO;
    }
    serviceType = FLZipService;
    return YES;
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
