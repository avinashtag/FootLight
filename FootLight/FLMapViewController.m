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
#import "MBProgressHUD.h"
#import "FLAnnotation.h"


@interface FLMapViewController ()

@end

@implementation FLMapViewController

CLPlacemark *thePlacemark;
MKRoute *routeDetails;


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
//    [self openMapForRoutes];
    
    FLAnnotation *annotation = [[FLAnnotation alloc]initWithCordinate:CLLocationCoordinate2DMake([_model.venueLatitude doubleValue], [_model.venueLongitude doubleValue]) title:_model.title subtitle:_model.venueTheatreCity];
//    annotation.title = self.model.title;
//    annotation.coordinate = CLLocationCoordinate2DMake([self.model.venueLatitude doubleValue], [self.model.venueLongitude doubleValue]);
    
    [self.mapView removeAnnotations:self.mapView.annotations];
    [self.mapView addAnnotation:annotation];
    MKCoordinateRegion newRegion;
    newRegion.center.latitude = [_model.venueLatitude doubleValue];
    newRegion.center.longitude = [_model.venueLongitude doubleValue];
    newRegion.span.latitudeDelta = 0.112872;
    newRegion.span.longitudeDelta = 0.109863;
    
    [self.mapView setRegion:newRegion animated:YES];
    [self.mapView setDelegate:self];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void)mapView:(MKMapView *)mapView annotationView:(MKAnnotationView *)view calloutAccessoryControlTapped:(UIControl *)control
{
    [self route];
}


- (MKAnnotationView *)mapView:(MKMapView *)theMapView viewForAnnotation:(id <MKAnnotation>)annotation
{
    static    NSString *reuseId = @"rtd";

    MKPinAnnotationView *returnedAnnotationView = (MKPinAnnotationView*)[theMapView dequeueReusableAnnotationViewWithIdentifier:reuseId];
    
    if (returnedAnnotationView) {
        [returnedAnnotationView prepareForReuse];
    } else {
        returnedAnnotationView = [[MKPinAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:reuseId];
    }
    returnedAnnotationView.pinColor = MKPinAnnotationColorRed;
    returnedAnnotationView.canShowCallout = YES;
    returnedAnnotationView.animatesDrop = YES;
    returnedAnnotationView.rightCalloutAccessoryView = [UIButton buttonWithType:UIButtonTypeDetailDisclosure];
    // in case it's the user location, we already have an annotation, so just return nil
//    if (![annotation isKindOfClass:[MKUserLocation class]])
//    {
//        if ([annotation isKindOfClass:[FLAnnotation class]])  // for Japanese Tea Garden
//        {
//            returnedAnnotationView = [[MKAnnotationView alloc]initWithAnnotation:annotation reuseIdentifier:reuseId];
//        }
//    }
    
    return returnedAnnotationView;
}

- (void) openMapForRoutes {
    
    [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    NSString *mapUrl = nil;
    
    CLLocationCoordinate2D cordinate = [AppDelegate SharedApplication].locationManager.location.coordinate;
    // create mapURL string using latitude and longitude of users current location (latitude and longitude) and department latitude and longitude
    mapUrl = [NSString stringWithFormat:@"http://maps.google.com/maps?saddr=%f,%f&daddr=%@,%@",
              cordinate.latitude,
              cordinate.longitude,
              self.model.venueLatitude,
              self.model.venueLongitude];
    mapUrl = [mapUrl stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    NSURL *url = [NSURL URLWithString:mapUrl];
    [self.webview loadRequest:[NSURLRequest requestWithURL:url]];
    
}

- (void)webViewDidFinishLoad:(UIWebView *)webView{
    [MBProgressHUD hideHUDForView:self.view animated:YES];
}
- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error{
    [MBProgressHUD hideHUDForView:self.view animated:YES];
    NSLog(@"fail to load %@",error.description);
}

-(MKOverlayRenderer *)mapView:(MKMapView *)mapView rendererForOverlay:(id<MKOverlay>)overlay {
    MKPolylineRenderer  * routeLineRenderer = [[MKPolylineRenderer alloc] initWithPolyline:routeDetails.polyline];
    routeLineRenderer.strokeColor = [UIColor redColor];
    routeLineRenderer.lineWidth = 5;
    return routeLineRenderer;
}

-(void)route{
    
    
    CLLocationCoordinate2D destinationLocation = CLLocationCoordinate2DMake([self.model.venueLatitude doubleValue], [self.model.venueLongitude doubleValue]);
    //*****temp
    CLLocationCoordinate2D sourceLocation = CLLocationCoordinate2DMake([@(34.1632510) doubleValue], [@(-118.3732890) doubleValue]);
    MKPlacemark *placemarksource = [[MKPlacemark alloc] initWithCoordinate:sourceLocation addressDictionary:nil];
//********** temp end
    
    MKDirectionsRequest *directionsRequest = [[MKDirectionsRequest alloc] init];
    MKPlacemark *placemark = [[MKPlacemark alloc] initWithCoordinate:destinationLocation addressDictionary:nil];
//    [directionsRequest setSource:[[MKMapItem alloc] initWithPlacemark:placemarksource]];;
    [directionsRequest setSource:[MKMapItem mapItemForCurrentLocation]];;
    [directionsRequest setDestination:[[MKMapItem alloc] initWithPlacemark:placemark]];
    directionsRequest.transportType = MKDirectionsTransportTypeAutomobile;
    MKDirections *directions = [[MKDirections alloc] initWithRequest:directionsRequest];
    [directions calculateDirectionsWithCompletionHandler:^(MKDirectionsResponse *response, NSError *error) {
        if (error) {
            NSLog(@"Error %@", error.description);
        } else {
            routeDetails = response.routes.lastObject;
            [self.mapView addOverlay:routeDetails.polyline];
//            self.destinationLabel.text = [placemark.addressDictionary objectForKey:@"Street"];
//            self.distanceLabel.text = [NSString stringWithFormat:@"%0.1f Miles", routeDetails.distance/1609.344];
//            self.transportLabel.text = [NSString stringWithFormat:@"%u" ,routeDetails.transportType];
            self.allSteps = @"";
            for (int i = 0; i < routeDetails.steps.count; i++) {
                MKRouteStep *step = [routeDetails.steps objectAtIndex:i];
                NSString *newStep = step.instructions;
                self.allSteps = [self.allSteps stringByAppendingString:newStep];
                self.allSteps = [self.allSteps stringByAppendingString:@"\n\n"];
//                self.steps.text = self.allSteps;
            }
        }
    }];

}
@end
