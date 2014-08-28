//
//  NMAgregarPicoViewController.m
//  CharruaSurfReport
//
//  Created by norman martinez on 28/08/14.
//  Copyright (c) 2014 NMDevelopment. All rights reserved.
//

#import "NMAgregarPicoViewController.h"

@interface NMAgregarPicoViewController ()

@end

@implementation NMAgregarPicoViewController
@synthesize currentLocation;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self getCurrentPosition];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//Recupera la posición actual del usuario
-(void)getCurrentPosition
{
    CLLocationManager *locationManager = [[CLLocationManager alloc] init];
    [locationManager setDelegate:self];
    [locationManager startUpdatingLocation];
    [self.map setDelegate:self];
    self.map.showsUserLocation = YES;
}

// Called when the location manager determines that there is a new location
- (void)locationManager:(CLLocationManager *)manager didUpdateToLocation:(CLLocation *)newLocation
           fromLocation:(CLLocation *)oldLocation
{
    self.currentLocation = newLocation;
    
    // Create a mapkit region based on the location
    // Span defines the area covered by the map in degrees
    MKCoordinateSpan span;
    span.latitudeDelta = 0.03;
    span.longitudeDelta = 0.03;
    
    // Region struct defines the map to show based on center coordinate and span
    MKCoordinateRegion region;
    region.center = newLocation.coordinate;
    region.span = span;
    
    // Update the map to display the current location
    [self.map setRegion:region animated:YES];
    
    // Stop core location services to conserve battery
    [manager stopUpdatingLocation];
    
}

@end
