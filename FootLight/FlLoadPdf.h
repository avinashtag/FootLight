//
//  FlLoadPdf.h
//  FootLight
//
//  Created by Avinash Tag on 29/10/14.
//  Copyright (c) 2014 Avinash Tag. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FLZipResponseModel.h"

@interface FlLoadPdf : UIViewController


@property(nonatomic, strong)IBOutlet UIWebView *webview;
@property(nonatomic, strong)FLZipResponseModel *model ;
@property(nonatomic, strong)NSURL *Flurl ;
-(void)loadWebsite:(NSURL*)url;
@end
