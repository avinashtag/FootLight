//
//  NSString+FLString.m
//  FootLight
//
//  Created by Avinash Tag on 2/11/2014.
//  Copyright (c) 2014 Avinash Tag. All rights reserved.
//

#import "NSString+FLString.h"

@implementation NSString (FLString)


-(BOOL)isBlankString{
    return [[self stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]]isEqualToString:@""];
}

@end
