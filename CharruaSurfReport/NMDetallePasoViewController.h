//
//  NMDetallePasoViewController.h
//  CharruaSurfReport
//
//  Created by norman martinez on 11/09/14.
//  Copyright (c) 2014 NMDevelopment. All rights reserved.
//

#import <UIKit/UIKit.h>
@import MapKit;

@interface NMDetallePasoViewController : UIViewController

@property (weak, nonatomic) IBOutlet UITextView *instructionsTextView;
@property (weak, nonatomic) IBOutlet UILabel *distanceLabel;
@property (weak, nonatomic) IBOutlet MKMapView *mapView;

@property (strong, nonatomic) MKRouteStep *routeStep;
@property (assign, nonatomic) NSUInteger stepIndex;

@end
