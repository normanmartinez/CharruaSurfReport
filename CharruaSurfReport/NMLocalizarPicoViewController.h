//
//  NMAgregarPicoViewController.h
//  CharruaSurfReport
//
//  Created by norman martinez on 28/08/14.
//  Copyright (c) 2014 NMDevelopment. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import <CoreLocation/CoreLocation.h>

#import "Pico.h"
#import "NMSalvarPicoViewController.h"


@interface NMLocalizarPicoViewController : UIViewController<CLLocationManagerDelegate,MKMapViewDelegate,NMSalvarPicoViewControllerDelegate>

@property (strong, nonatomic) IBOutlet MKMapView *map;
@property (nonatomic, retain) CLLocation* currentLocation;
@property (strong, nonatomic) CLLocationManager *locationManager;

- (IBAction)agregarPico:(id)sender;

@end