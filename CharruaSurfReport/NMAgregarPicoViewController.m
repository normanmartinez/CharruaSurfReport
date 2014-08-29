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
@synthesize currentLocation,locationManager;

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
    locationManager = [[CLLocationManager alloc] init];
    self.locationManager.delegate = self;
    self.locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters;
    [self.locationManager startUpdatingLocation];
    
    self.map.showsUserLocation = YES;
}

// Called when the location manager determines that there is a new location
- (void)locationManager:(CLLocationManager *)manager
     didUpdateLocations:(NSArray *)locations {
{
    /*
    CLLocation *newLocation = [locations lastObject];
    if (newLocation.verticalAccuracy < 0 ||
        newLocation.horizontalAccuracy < 0) {
        // invalid accuracy
        return;
    }
    
    if (newLocation.horizontalAccuracy > 100 ||
        newLocation.verticalAccuracy > 50) {
        // accuracy radius is so large, we don't want to use it
        return;
    }
    MKCoordinateRegion region;
    region = MKCoordinateRegionMakeWithDistance(newLocation.coordinate,100, 100);
    [self.map setRegion:region animated:YES];
     */
}

}

@end
