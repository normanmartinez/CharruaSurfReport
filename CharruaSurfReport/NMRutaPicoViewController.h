//
//  NMRutaPicoViewController.h
//  CharruaSurfReport
//
//  Created by norman martinez on 10/09/14.
//  Copyright (c) 2014 NMDevelopment. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Pico.h"
#import "NMPasosRutaPicoTableViewController.h"
@import MapKit;

@interface NMRutaPicoViewController : UIViewController

@property (weak, nonatomic) IBOutlet MKMapView *mapView;
@property (weak, nonatomic) IBOutlet UIButton *detalleRuta;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *activityIndicator;

@property (nonatomic, strong) Pico *pico;

@end
