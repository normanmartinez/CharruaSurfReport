//
//  NMDetallePasoViewController.m
//  CharruaSurfReport
//
//  Created by norman martinez on 11/09/14.
//  Copyright (c) 2014 NMDevelopment. All rights reserved.
//

#import "NMDetallePasoViewController.h"

@interface NMDetallePasoViewController () <MKMapViewDelegate>

@end

@implementation NMDetallePasoViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.mapView.delegate = self;
    [self.mapView addOverlay:self.routeStep.polyline];
    [self.mapView setVisibleMapRect:self.routeStep.polyline.boundingMapRect animated:NO];
    self.instructionsTextView.text = self.routeStep.instructions;
    self.navigationItem.title = [NSString stringWithFormat:@"Step %02i", (int)self.stepIndex];
    self.distanceLabel.text = [NSString stringWithFormat:@"%0.2f km", self.routeStep.distance / 1000.0];
}

#pragma mark - MKMapViewDelegate methods
- (MKOverlayRenderer *)mapView:(MKMapView *)mapView rendererForOverlay:(id<MKOverlay>)overlay
{
    MKPolylineRenderer *renderer = [[MKPolylineRenderer alloc] initWithPolyline:self.routeStep.polyline];
    renderer.strokeColor = [[UIColor blueColor] colorWithAlphaComponent:0.5];
    renderer.lineWidth = 4.f;
    return  renderer;
}


@end
