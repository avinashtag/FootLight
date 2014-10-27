//
//  UIViewController+ShowModalFromView.h


#import <UIKit/UIKit.h>

@interface UIViewController (ShowModalFromView)

- (void)presentModalViewController:(UIViewController *)modalViewController startFrame:(CGRect)startFrame withTargetFrame:(CGRect)targetFrame;
- (void)dismissModalViewController:(UIViewController *)modalViewController startFrame:(CGRect)startFrame withTargetFrame:(CGRect)targetFrame;

- (void)presentModalViewController:(UIViewController *)modalViewController ModelViewFrame:(CGRect)target ;
- (void)dismissModalViewController:(UIViewController *)modalViewController modalViewControllerFrame:(CGRect)target;

/*
 CGSize viewSize = powerRates.view.frame.size; //Get View Size from view
 CGSize mainScreenSize = [[UIScreen mainScreen] bounds].size;
 
 CGRect targetFrame = CGRectMake(((mainScreenSize.width/2)-(viewSize.width/2)), ((mainScreenSize.height/2)-(viewSize.height/2)), viewSize.width, viewSize.height);
 CGRect startFrame = CGRectMake(mainScreenSize.width/2, mainScreenSize.height/2, 0, 0);
 
 [powerRates setModalPresentationStyle:UIModalPresentationFormSheet];
 [self presentModalViewController:powerRates startFrame:startFrame withTargetFrame:targetFrame];

 */
@end
