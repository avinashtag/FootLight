//
//  FlLoadPdf.m
//  FootLight
//
//  Created by Avinash Tag on 29/10/14.
//  Copyright (c) 2014 Avinash Tag. All rights reserved.
//

#import "FlLoadPdf.h"
#import "ATWebService.h"
#import "MBProgressHUD.h"

@interface FlLoadPdf ()

@end

@implementation FlLoadPdf

- (void)viewDidLoad {
    [super viewDidLoad];
    [self loadPdf];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(void)loadPdf{
    [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    NSString *url = [NSString stringWithFormat:@"http://gofootlights.com/pdfs/%@",_model.recordID];
    [self.webview loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:url]]];
}
- (void)webViewDidFinishLoad:(UIWebView *)webView{
    [MBProgressHUD hideHUDForView:self.view animated:YES];
}
- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error{
    [MBProgressHUD hideHUDForView:self.view animated:YES];
    NSLog(@"fail to load %@",error.description);
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
