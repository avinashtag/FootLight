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
    
    navBar = [[FLNavigationBar alloc] initWithNibName:@"FLNavigationBar" bundle:nil];
    [self.view addSubview:navBar.view];
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
    CGPoint center = textField.center;
    pick = [[ATPicker alloc]initWithNibName:@"ATPicker" bundle:nil];
    pick.pickerDatasource =  (textField == self.showStatus) ? [pick statusDatasource] : [pick theaterTypeDatasource];
    pick.view.center = center;
    [self.view addSubview:pick.view];
    [pick showPickerWithPopIn];
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
    [self setServiceType];
    [self callWebservice];
}






-(void)callWebservice{

    CLLocation *location = [AppDelegate SharedApplication].locationManager.location;
    product = [self.storyboard instantiateViewControllerWithIdentifier:@"FLProductListViewController"];
    [self.navigationController pushViewController:product animated:YES];
//    if (islocation) {
        NSString *url = [NSString stringWithFormat:@"zipdis.php?q=%@&distance=%@",@"91502",@"25"];
        [product zipCallNormal:url];
//        NSString *url = [NSString stringWithFormat:@"openzip.php?q=%@&distance=%@",@"91502",@"25"];
//        NSString *url = [NSString stringWithFormat:@"closezip.php?q=%@&distance=%@",@"91502",@"25"];

//    }
//    else{
    
//        NSString *url = [NSString stringWithFormat:@"newplay.php?loc_lat=%f&loc_lng=%f&distance=%@",location.coordinate.latitude,location.coordinate.longitude,@"25"];
//        NSString *url = [NSString stringWithFormat:@"openingsoon.php?loc_lat=%f&loc_lng=%f&distance=%@",location.coordinate.latitude,location.coordinate.longitude,@"25"];
//        NSString *url = [NSString stringWithFormat:@"closingsoon.php?loc_lat=%f&loc_lng=%f&distance=%@",location.coordinate.latitude,location.coordinate.longitude,@"25"];
//        NSString *url = [NSString stringWithFormat:@"newplay.php?loc_lat=%f&loc_lng=%f&distance=%@",location.coordinate.latitude,location.coordinate.longitude,@"25"];
//        NSString *url = [NSString stringWithFormat:@"newplay.php?loc_lat=%f&loc_lng=%f&distance=%@",location.coordinate.latitude,location.coordinate.longitude,@"25"];
//        NSString *url = [NSString stringWithFormat:@"newplay.php?loc_lat=%f&loc_lng=%f&distance=%@",location.coordinate.latitude,location.coordinate.longitude,@"25"];
//        NSString *url = [NSString stringWithFormat:@"newplay.php?loc_lat=%f&loc_lng=%f&distance=%@",location.coordinate.latitude,location.coordinate.longitude,@"25"];
//    }
}
@end
