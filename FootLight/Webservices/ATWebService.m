//
//  ATWebService.m
//  FootLight
//
//  Created by Avinash Tag on 28/10/14.
//  Copyright (c) 2014 Avinash Tag. All rights reserved.
//

#import "ATWebService.h"
#import "FLZipResponseModel.h"

@implementation ATWebService

NSString *baseUrl = @"http://footlightstheatre.com/newqb/";


/******
 
 newplay.php?loc_lat=%@&loc_lng=%@&distance=%@
 
 openingsoon.php?loc_lat=%@&loc_lng=%@&distance=%@
 
 closingsoon.php?loc_lat=%@&loc_lng=%@&distance=%@
 
 zipdis.php?q=%@&distance=%@
 
 openzip.php?q=%@&distance=%@
 
 closezip.php?q=%@&distance=%@
 
 rating.php?rid=%@&rating=%i
 
 
 ******/
-(void)callOnUrlZip:(NSString*)srl withSuccessHandler:(ATResponseSuccess)success withFailHandler:(ATResponseFail)fail{
    self.atResponseFail = fail;
    self.atResponseSuccess = success;
    self.queue = [[NSOperationQueue alloc]init];
    NSString *url = [NSString stringWithFormat:@"%@%@",baseUrl,srl];
    [NSURLConnection sendAsynchronousRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:url]] queue:self.queue completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
        if (connectionError) {
            self.atResponseFail!= nil ? self.atResponseFail(@"", @"", connectionError) : NSLog(@"");
        }
        else{
            NSError *readingError = nil;
            NSArray* result = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:&readingError];
            NSMutableArray *zipResult = [[NSMutableArray alloc]init];
            [result enumerateObjectsUsingBlock:^(NSDictionary* dictionary, NSUInteger idx, BOOL *stop) {
                [zipResult addObject:[[FLZipResponseModel alloc]initWithDictionary:dictionary]];
            }];
            
            self.atResponseSuccess!= nil ? self.atResponseSuccess(zipResult, @"") : NSLog(@"");
        }
    }];
}

-(void)callOnUrlrating:(NSString*)srl withSuccessHandler:(ATResponseSuccess)success withFailHandler:(ATResponseFail)fail{
    self.atResponseFail = fail;
    self.atResponseSuccess = success;
    
    NSString *url = [NSString stringWithFormat:@"%@%@",baseUrl,srl];
    [NSURLConnection sendAsynchronousRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:url]] queue:self.queue completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
        if (connectionError) {
            self.atResponseFail!= nil ? self.atResponseFail(@"", @"", connectionError) : NSLog(@"");
        }
        else{
            NSError *readingError = nil;
            NSArray* result = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:&readingError];
            NSMutableArray *zipResult = [[NSMutableArray alloc]init];
            [result enumerateObjectsUsingBlock:^(NSDictionary* dictionary, NSUInteger idx, BOOL *stop) {
                [zipResult addObject:[[FLZipResponseModel alloc]initWithDictionary:dictionary]];
            }];
            
            self.atResponseSuccess!= nil ? self.atResponseSuccess(zipResult, @"") : NSLog(@"");
        }
    }];
}

-(void)callOnUrlPlay:(NSString*)srl withSuccessHandler:(ATResponseSuccess)success withFailHandler:(ATResponseFail)fail{
    self.atResponseFail = fail;
    self.atResponseSuccess = success;
    
    NSString *url = [NSString stringWithFormat:@"%@%@",baseUrl,srl];
    [NSURLConnection sendAsynchronousRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:url]] queue:self.queue completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
        if (connectionError) {
            self.atResponseFail!= nil ? self.atResponseFail(@"", @"", connectionError) : NSLog(@"");
        }
        else{
            NSError *readingError = nil;
            NSArray* result = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:&readingError];
            NSMutableArray *zipResult = [[NSMutableArray alloc]init];
            [result enumerateObjectsUsingBlock:^(NSDictionary* dictionary, NSUInteger idx, BOOL *stop) {
                [zipResult addObject:[[FLZipResponseModel alloc]initWithDictionary:dictionary]];
            }];
            
            self.atResponseSuccess!= nil ? self.atResponseSuccess(zipResult, @"") : NSLog(@"");
        }
    }];
}

@end
