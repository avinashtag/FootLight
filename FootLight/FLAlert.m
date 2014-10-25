//
//  FLAlert.m
//  FootLight
//
//  Created by Avinash Tag on 25/10/2014.
//  Copyright (c) 2014 Avinash Tag. All rights reserved.
//

#import "FLAlert.h"

@implementation FLAlert

//-(id)init{
//    if (!self) {
//        self = [super init];
//        [self initWithTitle:<#(NSString *)#> message:<#(NSString *)#> cancelButtonTitle:<#(NSString *)#> cancelHandler:<#^(NSUInteger cancel)cancelHandler#> otherHandler:<#^(NSUInteger other)otherHandler#> otherButtonTitles:<#(NSString *), ...#>]
//    }
//}

-(id)initWithTitle:(NSString *)title message:(NSString *)message cancelButtonTitle:(NSString *)cancelButtonTitle cancelHandler:(FLAlertCancel)cancelHandler otherHandler:(FLAlertOtherPressed)otherHandler otherButtonTitles:(NSString *)otherButtonTitles, ...{
    
    if (!self) {
        self = [super init];
        self.cancel = cancelHandler;
        self.OtherPressed = otherHandler;
        UIAlertView *alert= [[UIAlertView alloc]initWithTitle:title message:message delegate:self cancelButtonTitle:cancelButtonTitle otherButtonTitles:otherButtonTitles, nil];
        [alert show];
    }
    return self;
    
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    [alertView dismissWithClickedButtonIndex:0 animated:YES];
    switch (buttonIndex) {
        case 0:{
            if (self.cancel!=nil) {
                self.cancel(buttonIndex);
            }
        }
            break;
            
        default:{
            if (self.OtherPressed!=nil) {
                self.OtherPressed(buttonIndex);
            }
        }
            break;
    }
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
