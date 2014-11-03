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
#import "AppDelegate.h"
#import "ATPicker.h"
#import "FLPickerModel.h"
#import "FLAlert.h"
#import "UIView+FLView.h"

@interface FLTheaterViewController (){
    FLNavigationBar *navBar;
    BOOL islocation;
    UIView *footer;
    ATPicker *pick;
    NSArray* rowsCount;
}

@end

@implementation FLTheaterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    rowsCount = @[@(0),@(0)];
   /* NSArray *viewControllers = [[AppDelegate sharedNavigationController] viewControllers];
    if ([[viewControllers objectAtIndex:viewControllers.count-2] isKindOfClass:[FLByLocationViewController class]]) {
        
        [self.titlenavigation setText:FLByLocation];
    }
    else{
        [self.titlenavigation setText:FlListing];
    }
    [AppDelegate sharedNavigationController].title = self.titlenavigation.text;
    [self.view setNavigationTitle:[AppDelegate sharedNavigationController].title];
    */
    self.theaterTypeHeader = [[[NSBundle mainBundle]loadNibNamed:NSStringFromClass([FLPicker class]) owner:nil options:nil] objectAtIndex:1];
    [self.theaterTypeHeader addGestureRecognizer:[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(openPicker:)]];

    self.showStatusHeader = [[[NSBundle mainBundle]loadNibNamed:NSStringFromClass([FLPicker class]) owner:nil options:nil] objectAtIndex:2];
    [self.showStatusHeader addGestureRecognizer:[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(openPicker:)]];
    self.footer = [[[NSBundle mainBundle]loadNibNamed:@"FLPicker" owner:nil options:nil] objectAtIndex:3];
    [(UIButton*)[self.footer viewWithTag:100] addTarget:self action:@selector(submit:) forControlEvents:UIControlEventTouchUpInside];

 
}

-(void)viewWillAppear:(BOOL)animated{
    
    [super viewWillAppear:animated];
    [(UITextField*)[self.showStatusHeader viewWithTag:100] setText:@"Now Playing"];
    [(UITextField*)[self.theaterTypeHeader viewWithTag:100] setText:@"All"];
    [self.view setNavigationTitle:self.title];
    [self.titlenavigation setText:self.title];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(void)setServiceType{
    
    NSArray *viewControllers = [[AppDelegate sharedNavigationController] viewControllers];
    id controller = [viewControllers objectAtIndex:viewControllers.count-2];
    islocation = [controller isKindOfClass:[FLByLocationViewController class]];
}


- (IBAction)submit:(UIButton *)sender {
    
    [[AppDelegate SharedApplication].locationManager startUpdatingLocation] ;
    [self setServiceType];
    [self callWebservice];
    
}


-(NSString*)locationServices{
    
    
    CLLocation *location = (self.placemark == nil ) ? [AppDelegate SharedApplication].locationManager.location : self.placemark.location;
    if ([[(UITextField*)[self.showStatusHeader viewWithTag:100] text ] isEqualToString:@"Now Playing"]) {
        
        return [NSString stringWithFormat:@"newplay.php?loc_lat=%f&loc_lng=%f&distance=%@",location.coordinate.latitude,location.coordinate.longitude,self.radius];
   }
    else  if ([[(UITextField*)[self.showStatusHeader viewWithTag:100] text ] isEqualToString:@"Opening Soon"]) {
        
        return [NSString stringWithFormat:@"openingsoon.php?loc_lat=%f&loc_lng=%f&distance=%@",location.coordinate.latitude,location.coordinate.longitude,self.radius];
    }
    else  if ([[(UITextField*)[self.showStatusHeader viewWithTag:100] text ] isEqualToString:@"Closing Soon"]) {
        
        return [NSString stringWithFormat:@"closingsoon.php?loc_lat=%f&loc_lng=%f&distance=%@",location.coordinate.latitude,location.coordinate.longitude,self.radius];
    }
    return [NSString stringWithFormat:@"newplay.php?loc_lat=%f&loc_lng=%f&distance=%@",location.coordinate.latitude,location.coordinate.longitude,@"25"];
}


-(NSString*)zipcallservice{
//    return [NSString stringWithFormat:@"zipdis.php?q=%@&distance=%@",@"91502",@"25"];

    if ([[(UITextField*)[self.showStatusHeader viewWithTag:100] text ] isEqualToString:@"Now Playing"]) {
        
        return [NSString stringWithFormat:@"zipdis.php?q=%@&distance=%@",self.zip,self.radius];
    }
    else  if ([[(UITextField*)[self.showStatusHeader viewWithTag:100] text ] isEqualToString:@"Opening Soon"]) {
        
        return [NSString stringWithFormat:@"openzip.php?q=%@&distance=%@",self.zip,self.radius];
    }
    else  if ([[(UITextField*)[self.showStatusHeader viewWithTag:100] text ] isEqualToString:@"Closing Soon"]) {
        
        return [NSString stringWithFormat:@"closezip.php?q=%@&distance=%@",self.zip,self.radius];
    }
    return [NSString stringWithFormat:@"zipdis.php?q=%@&distance=%@",@"91502",@"25"];

}



-(void)callWebservice{

    FLProductListViewController *product = [self.storyboard instantiateViewControllerWithIdentifier:@"FLProductListViewController"];
    product.title = self.title;
    [self.navigationController pushViewController:product animated:YES];
    
    switch (self.serviceType) {
        case FLLocation:
            [product statusFilter:[self locationServices] filterGenere:[(UITextField*)[self.theaterTypeHeader viewWithTag:100] text ]];
            break;
        case FLZipService:
            [product zipCallNormal:[self zipcallservice] filterGenere:[(UITextField*)[self.theaterTypeHeader viewWithTag:100] text ]];
            break;

        default:
            break;
    }
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [[rowsCount objectAtIndex:section] integerValue];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return rowsCount.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString *identifier = @"pickerId";
    FLPicker *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (!cell) {
        cell = [[[NSBundle mainBundle]loadNibNamed:@"FLPicker" owner:nil options:nil] objectAtIndex:0];
    }
    cell.pickerDatasource = indexPath.section == 0 ? [cell statusDatasource] : [cell theaterTypeDatasource];
    [cell.picker reloadAllComponents];
    NSString *selectedValue =  indexPath.section == 0 ? [(UITextField*)[self.showStatusHeader viewWithTag:100] text] : [(UITextField*)[self.theaterTypeHeader viewWithTag:100] text];
    [cell.picker selectRow:[cell.pickerDatasource indexOfObject:selectedValue] inComponent:0 animated:YES];
    [cell callBackPickerSelected:^(NSString* value) {
       (indexPath.section == 0) ? [(UITextField*)[self.showStatusHeader viewWithTag:100] setText:value ] : [(UITextField*)[self.theaterTypeHeader viewWithTag:100] setText:value ];
        rowsCount =  @[@(0),@(0)];
        [tableView reloadData];
    } cancelPicker:^(NSString* value) {
        rowsCount =  @[@(0),@(0)];
        [tableView reloadData];
    }];
    return cell;
}



-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return  192 ;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return  50 ;
}

-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 50;
}

-(UIView*)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    return self.footer;
}
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    
    return (section == 0) ? self.showStatusHeader : self.theaterTypeHeader;
}

- (void)openPicker:(UITapGestureRecognizer *)recognizer{
    
    if (recognizer.view == self.showStatusHeader) {
        rowsCount = @[@(1),@(0)];
        [self.theaterTable reloadData];
    }
    else if (recognizer.view == self.theaterTypeHeader) {
        rowsCount = @[@(0),@(1)];
        [self.theaterTable reloadData];
    }
}




@end
