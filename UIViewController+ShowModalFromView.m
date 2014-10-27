//
//  UIViewController+ShowModalFromView.m

#import "UIViewController+ShowModalFromView.h"
#import <QuartzCore/QuartzCore.h>
#import "AppDelegate.h"

@implementation UIViewController (ShowModalFromView)

- (void)presentModalViewController:(UIViewController *)modalViewController ModelViewFrame:(CGRect)target
{
    // Add the modal viewController but don't animate it. We will handle the animation manually
    [self presentViewController:modalViewController animated:NO completion:nil];
    
    // Remove the shadow. It causes weird artifacts while animating the view.
    CGColorRef originalShadowColor = modalViewController.view.superview.layer.shadowColor;
    modalViewController.view.superview.layer.shadowColor = [[UIColor clearColor] CGColor];
    modalViewController.view.superview.frame = target;
    modalViewController.view.superview.center = [AppDelegate SharedApplication].window.center;
    
    // Set the frame to the one of the view we want to animate from
    
    // Begin animation
    [UIView animateWithDuration:0.5f
                     animations:^{
                         // Set the original frame back

                     }
                     completion:^(BOOL finished) {
                         [UIView animateWithDuration:0.3 delay:0.0 options:UIViewAnimationOptionAllowUserInteraction
                                          animations:^{
                                              modalViewController.view.superview.transform = CGAffineTransformMakeScale(0.1, 0.1);
                                              modalViewController.view.superview.transform = CGAffineTransformMakeScale(1.5, 1.5);
                                          }
                                          completion:^(BOOL finished) {
                                              [UIView animateWithDuration:0.4 delay:0.0 options:UIViewAnimationOptionAllowUserInteraction
                                                               animations:^{
                                                                   modalViewController.view.superview.transform = CGAffineTransformMakeScale(1.5, 1.5);
                                                                   modalViewController.view.superview.transform = CGAffineTransformMakeScale(1.0, 1.0);
                                                               }
                                                               completion:^(BOOL finished) {

                                                                   modalViewController.view.superview.layer.shadowColor = originalShadowColor;
                                                                   
                                                               }];
                                              
//                                              modalViewController.view.superview.layer.shadowColor = originalShadowColor; 450 342

                                          }];
                         // Set the original shadow color back after the animation has finished
                     }];
}

//Call the method to present view controller with start frame where you want to start animation from and target frame where you want to end animation at.

- (void)presentModalViewController:(UIViewController *)modalViewController startFrame:(CGRect)startFrame withTargetFrame:(CGRect)targetFrame
{
    // Add the modal viewController but don't animate it. We will handle the animation manually
    [self presentViewController:modalViewController animated:NO completion:nil];
    
    // Remove the shadow. It causes weird artifacts while animating the view.
    CGColorRef originalShadowColor = modalViewController.view.superview.layer.shadowColor;
    modalViewController.view.superview.layer.shadowColor = [[UIColor clearColor] CGColor];
  
    // Set the frame to the one of the view we want to animate from
    modalViewController.view.superview.frame = startFrame;
    
    // Begin animation
    [UIView animateWithDuration:0.5f
                     animations:^{
                         // Set the original frame back
                         modalViewController.view.superview.frame = targetFrame;
                     }
                     completion:^(BOOL finished) {
                         // Set the original shadow color back after the animation has finished
                         modalViewController.view.superview.layer.shadowColor = originalShadowColor;
                     }];
}

//Call the method to dismiss view controller with start frame where you want to start animation from and target frame where you want to end animation at.

- (void)dismissModalViewController:(UIViewController *)modalViewController startFrame:(CGRect)startFrame withTargetFrame:(CGRect)targetFrame {
    // Begin animation
    [UIView animateWithDuration:0.5f
                     animations:^{
                         // Set the original frame back
                         modalViewController.view.superview.frame = targetFrame;
                     }
                     completion:^(BOOL finished) {
                         modalViewController.view.superview.frame = startFrame;
                         [modalViewController dismissViewControllerAnimated:NO completion:nil];
                     }];
    
}

- (void)dismissModalViewController:(UIViewController *)modalViewController modalViewControllerFrame:(CGRect)target{
    // Begin animation
    
    modalViewController.view.superview.frame = target;
    modalViewController.view.superview.center = [AppDelegate SharedApplication].window.center;

    [UIView animateWithDuration:0.5f
                     animations:^{
                         // Set the original frame back
                         
                     }
                     completion:^(BOOL finished) {
                         [UIView animateWithDuration:0.3 delay:0.0 options:UIViewAnimationOptionAllowUserInteraction
                                          animations:^{
                                              modalViewController.view.superview.transform = CGAffineTransformMakeScale(1.0, 1.0);
                                              modalViewController.view.superview.transform = CGAffineTransformMakeScale(1.3, 1.3);
                                          }
                                          completion:^(BOOL finished) {
                                              [UIView animateWithDuration:0.4 delay:0.0 options:UIViewAnimationOptionAllowUserInteraction
                                                               animations:^{
                                                                   modalViewController.view.superview.transform = CGAffineTransformMakeScale(1.3, 1.3);
                                                                   modalViewController.view.superview.transform = CGAffineTransformMakeScale(0.1, 0.1);
                                                               }
                                                               completion:^(BOOL finished) {
                                                                   
                                                                   [self dismissViewControllerAnimated:NO completion:^{
                                                                       modalViewController.view.superview.transform = CGAffineTransformMakeScale(1.0, 1.0);

                                                                   }];
                                                               }];
                                              
                                              
                                          }];
                     }];
    
}



@end
