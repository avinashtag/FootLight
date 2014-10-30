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
    FLProductListViewController *product;
    ATPicker *pick;
}

@end

@implementation FLTheaterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSArray *viewControllers = [[AppDelegate sharedNavigationController] viewControllers];
    if ([[viewControllers objectAtIndex:viewControllers.count-2] isKindOfClass:[FLByLocationViewController class]]) {
        
        [self.titlenavigation setText:FLByLocation];
    }
    else{
        [self.titlenavigation setText:FlListing];
    }
    [AppDelegate sharedNavigationController].title = self.titlenavigation.text;
    [self.view setNavigationTitle:[AppDelegate sharedNavigationController].title];
//    [self fillDatasource];
    // Do any additional setup after loading the view.
    

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

- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField{

    //******* Open Picker ******//
    CGPoint center = textField.center;
    pick = [[ATPicker alloc]initWithNibName:@"ATPicker" bundle:nil];
    pick.pickerDatasource =  (textField == self.showStatus) ? [pick statusDatasource] : [pick theaterTypeDatasource];
//    pick.view.center = center;
//    [self.view addSubview:pick.view];
    [pick showPickerWithPopInWithCenter:center];
    [pick callBackPickerSelected:^(FLPickerModel* value) {
        
        textField.text = value.pickerTitle;
    } cancelPicker:^(id value) {
        
    }];
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
    
    if ([self validation]) {
        [self setServiceType];
        [self callWebservice];

    }
}

-(BOOL)validation{
    if ([self.theaterType.text isEqualToString:@""]) {
        FLAlert *alert = [[FLAlert alloc]initWithTitle:@"Foot Light" message:@"Please select a genere." cancelButtonTitle:@"Ok" cancelHandler:^(NSUInteger cancel) {
            
        } otherHandler:^(NSUInteger other) {
            
        } otherButtonTitles:nil];
        return NO;
    }
    else if ([self.showStatus.text isEqualToString:@""]) {
        FLAlert *alert = [[FLAlert alloc]initWithTitle:@"Foot Light" message:@"Please select a play status." cancelButtonTitle:@"Ok" cancelHandler:^(NSUInteger cancel) {
            
        } otherHandler:^(NSUInteger other) {
            
        } otherButtonTitles:nil];
        return NO;
    }
    return YES;
}

-(NSString*)locationServices{
    
    CLLocation *location = [AppDelegate SharedApplication].locationManager.location;
    if ([self.showStatus.text isEqualToString:@"Now Playing"]) {
        
        return [NSString stringWithFormat:@"newplay.php?loc_lat=%f&loc_lng=%f&distance=%@",location.coordinate.latitude,location.coordinate.longitude,self.radius];
   }
    else  if ([self.showStatus.text isEqualToString:@"Opening Soon"]) {
        
        return [NSString stringWithFormat:@"openingsoon.php?loc_lat=%f&loc_lng=%f&distance=%@",location.coordinate.latitude,location.coordinate.longitude,self.radius];
    }
    else  if ([self.showStatus.text isEqualToString:@"Closing Soon"]) {
        
        return [NSString stringWithFormat:@"closingsoon.php?loc_lat=%f&loc_lng=%f&distance=%@",location.coordinate.latitude,location.coordinate.longitude,self.radius];
    }
    return [NSString stringWithFormat:@"newplay.php?loc_lat=%f&loc_lng=%f&distance=%@",location.coordinate.latitude,location.coordinate.longitude,@"25"];
}


-(NSString*)zipcallservice{
//    return [NSString stringWithFormat:@"zipdis.php?q=%@&distance=%@",@"91502",@"25"];

    if ([self.showStatus.text isEqualToString:@"Now Playing"]) {
        
        return [NSString stringWithFormat:@"zipdis.php?q=%@&distance=%@",self.zip,self.radius];
    }
    else  if ([self.showStatus.text isEqualToString:@"Opening Soon"]) {
        
        return [NSString stringWithFormat:@"openzip.php?q=%@&distance=%@",self.zip,self.radius];
    }
    else  if ([self.showStatus.text isEqualToString:@"Closing Soon"]) {
        
        return [NSString stringWithFormat:@"closezip.php?q=%@&distance=%@",self.zip,self.radius];
    }
    return [NSString stringWithFormat:@"zipdis.php?q=%@&distance=%@",@"91502",@"25"];

}



-(void)callWebservice{

    product = [self.storyboard instantiateViewControllerWithIdentifier:@"FLProductListViewController"];
    [self.navigationController pushViewController:product animated:YES];
    if (islocation) {
        [product zipCallNormal:[self zipcallservice] filterGenere:self.theaterType.text];
    }
    else{
        [product statusFilter:[self locationServices] filterGenere:self.theaterType.text];
    }
}


@end
