//
//  ATAlert.m
//  FootLight
//
//  Created by Avinash Tag on 4/11/2014.
//  Copyright (c) 2014 Avinash Tag. All rights reserved.
//

#import "ATAlert.h"

@interface ATAlert ()

@end

@implementation ATAlert

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)alertTitle:(NSString*)ttl message:(NSString*)msg cancelBlock:(ATCancelBlock)cnclblck CancelTitle:(NSString*)cancelTitlle OtherTitle:(NSString*)otherttl otherBlock:(ATOtherBlock)otherblck{
    
    UIAlertView *alertView = [[UIAlertView alloc]initWithTitle:ttl message:msg delegate:self cancelButtonTitle:cancelTitlle otherButtonTitles:otherttl, nil];
    [alertView show];

}
- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    
    NSLog(@"Called");
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
