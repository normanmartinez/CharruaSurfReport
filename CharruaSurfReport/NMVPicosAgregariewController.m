//
//  NMVPicosAgregariewController.m
//  CharruaSurfReport
//
//  Created by norman martinez on 27/08/14.
//  Copyright (c) 2014 NMDevelopment. All rights reserved.
//

#import "NMVPicosAgregariewController.h"

@interface NMVPicosAgregariewController ()

@end

@implementation NMVPicosAgregariewController

@synthesize map  = _map;
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
    
    //trae la posición actual
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
    [self getCurrentPosition];
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
    span.latitudeDelta = 0.05;
    span.longitudeDelta = 0.05;
    
    // Region struct defines the map to show based on center coordinate and span
    MKCoordinateRegion region;
    region.center = newLocation.coordinate;
    region.span = span;
    
    // Update the map to display the current location
    [self.map setRegion:region animated:YES];
    
    // Stop core location services to conserve battery
    [manager stopUpdatingLocation];
    
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
