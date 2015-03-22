//
//  ATWebService.h
//  FootLight
//
//  Created by Avinash Tag on 28/10/14.
//  Copyright (c) 2014 Avinash Tag. All rights reserved.
//

#import <Foundation/Foundation.h>
#define pageLimit @"20"

typedef void(^ATResponseSuccess)(id response, NSString* message);
typedef void(^ATResponseFail)(id response, NSString* message , NSError *error);
@interface ATWebService : NSObject


@property (nonatomic, strong)NSOperationQueue *queue;
@property (nonatomic, strong)ATResponseSuccess atResponseSuccess;
@property (nonatomic, strong)ATResponseFail atResponseFail;

-(void)callOnUrlZip:(NSString*)srl withSuccessHandler:(ATResponseSuccess)success withFailHandler:(ATResponseFail)fail;
-(void)callOnUrlrating:(NSString*)srl withSuccessHandler:(ATResponseSuccess)success withFailHandler:(ATResponseFail)fail;
@end
