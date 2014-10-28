//
//  FLByLocationViewController.m
//  FootLight
//
//  Created by Avinash Tag on 25/10/2014.
//  Copyright (c) 2014 Avinash Tag. All rights reserved.
//

#import "FLByLocationViewController.h"
#import "ATWebService.h"
@interface FLByLocationViewController ()

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
    NSString *url = [NSString stringWithFormat:@"zipdis.php?q=%@&distance=%@",_zipCode.text];
//    [[[ATWebService alloc]init] callOnUrlZip:<#(NSString *)#> withSuccessHandler:<#^(id response, NSString *message)success#> withFailHandler:<#^(id response, NSString *message, NSError *error)fail#>]
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
