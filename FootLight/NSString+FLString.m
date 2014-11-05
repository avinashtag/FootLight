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

-(BOOL)validateNullForShow{
    
    NSString *showTrimmed = [self stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    NSString *noShow = @"NoShow";
    if (showTrimmed!= nil) {
        
        if ([[showTrimmed uppercaseString] isEqualToString:[@"<null>" uppercaseString ]] || [[showTrimmed uppercaseString] isEqualToString:[@"null" uppercaseString ]] || [[showTrimmed uppercaseString] isEqualToString:[@"nil" uppercaseString ]] || [[showTrimmed uppercaseString] isEqualToString:[@"<nil>" uppercaseString ]] || [[showTrimmed uppercaseString] isEqualToString:[@"" uppercaseString ]] || [[showTrimmed uppercaseString] isEqualToString:[noShow uppercaseString ]] || [[showTrimmed uppercaseString] isEqualToString:[@"NO SHOW" uppercaseString ]]) {
            return NO;
        }
        else
            return YES;
    }
    return NO;
}
@end
