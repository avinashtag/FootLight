//
//  FLMapViewController.m
//  FootLight
//
//  Created by Avinash Tag on 29/10/2014.
//  Copyright (c) 2014 Avinash Tag. All rights reserved.
//

#import "FLMapViewController.h"
#import "CustomAnnotation.h"
#import "AppDelegate.h"

@interface FLMapViewController ()

@end

@implementation FLMapViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    CLLocationCoordinate2D cord =[AppDelegate SharedApplication].locationManager.location.coordinate;
 
    CustomAnnotation *item = [[CustomAnnotation alloc] init];
    item.place = @"Tea Garden";
    item.imageName = @"teagarden";
    item.coordinate = CLLocationCoordinate2DMake(cord.latitude, cord.longitude);
    
    [self.mapAnnotations addObject:item];

    [self.mapView removeAnnotations:self.mapView.annotations];
    
    // add all 3 annotations
    [self.mapView addAnnotations:self.mapAnnotations];
    MKCoordinateRegion newRegion;
    newRegion.center.latitude = cord.latitude;
    newRegion.center.longitude = cord.longitude;
    newRegion.span.latitudeDelta = 0.112872;
    newRegion.span.longitudeDelta = 0.109863;
    
    [self.mapView setRegion:newRegion animated:YES];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
- (void)mapView:(MKMapView *)mapView annotationView:(MKAnnotationView *)view calloutAccessoryControlTapped:(UIControl *)control
{
    // here we illustrate how to detect which annotation type was clicked on for its callout
    id <MKAnnotation> annotation = [view annotation];
    /*if ([annotation isKindOfClass:[BridgeAnnotation class]])
    {
        NSLog(@"clicked Golden Gate Bridge annotation");
        
        DetailViewController *detailViewController = [[self storyboard] instantiateViewControllerWithIdentifier:@"DetailViewController"];
        if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPad)
        {
            // for iPad, we use a popover
            if (self.bridgePopoverController == nil)
            {
                _bridgePopoverController = [[UIPopoverController alloc] initWithContentViewController:detailViewController];
            }
            [self.bridgePopoverController presentPopoverFromRect:control.bounds
                                                          inView:control
                                        permittedArrowDirections:UIPopoverArrowDirectionLeft
                                                        animated:YES];
        }
        else
        {
            // for iPhone we navigate to a detail view controller using UINavigationController
            [self.navigationController pushViewController:detailViewController animated:YES];
        }
    }*/
}

- (MKAnnotationView *)mapView:(MKMapView *)theMapView viewForAnnotation:(id <MKAnnotation>)annotation
{
    MKAnnotationView *returnedAnnotationView = nil;
    
    // in case it's the user location, we already have an annotation, so just return nil
    if (![annotation isKindOfClass:[MKUserLocation class]])
    {
        // handle our three custom annotations
        //
        if ([annotation isKindOfClass:[CustomAnnotation class]])  // for Japanese Tea Garden
        {
            returnedAnnotationView = [CustomAnnotation createViewAnnotationForMapView:self.mapView annotation:annotation];
        }
    }
    
    return returnedAnnotationView;
}

@end
