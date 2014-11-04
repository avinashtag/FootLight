//
//  ATAlert.h
//  FootLight
//
//  Created by Avinash Tag on 4/11/2014.
//  Copyright (c) 2014 Avinash Tag. All rights reserved.
//

#import <UIKit/UIKit.h>


typedef void(^ATCancelBlock)(NSNumber * cancelIndex);
typedef void(^ATOtherBlock)(NSNumber * OtherIndex);

@interface ATAlert : UIViewController<UIAlertViewDelegate>


@property (nonatomic, strong)ATCancelBlock atCancelBlock;
@property (nonatomic, strong)ATOtherBlock atOtherBlock;
-(void)alertTitle:(NSString*)ttl message:(NSString*)msg cancelBlock:(ATCancelBlock)cnclblck CancelTitle:(NSString*)cancelTitlle OtherTitle:(NSString*)otherttl otherBlock:(ATOtherBlock)otherblck;
@end
