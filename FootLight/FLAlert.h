//
//  FLAlert.h
//  FootLight
//
//  Created by Avinash Tag on 25/10/2014.
//  Copyright (c) 2014 Avinash Tag. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef void(^FLAlertCancel)(NSUInteger cancel);
typedef void(^FLAlertOtherPressed)(NSUInteger other);


@interface FLAlert : UIViewController<UIAlertViewDelegate>

@property(nonatomic, strong)FLAlertCancel cancel;
@property(nonatomic, strong)FLAlertOtherPressed OtherPressed;

-(void)initWithTitle:(NSString *)title message:(NSString *)message cancelButtonTitle:(NSString *)cancelButtonTitle cancelHandler:(FLAlertCancel)cancelHandler otherHandler:(FLAlertOtherPressed)otherHandler otherButtonTitles:(NSString *)otherButtonTitles;

@end
