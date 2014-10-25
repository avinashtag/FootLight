//
//  HomeCellModel.h
//  FootLight
//
//  Created by Avinash Tag on 25/10/2014.
//  Copyright (c) 2014 Avinash Tag. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface HomeCellModel : NSObject

@property (strong, nonatomic) NSString *title;
@property (strong, nonatomic) UIImage *image;
+(NSArray*)dataSourceCollection;
+(NSArray*)dataSourceListingCollection;
@end
