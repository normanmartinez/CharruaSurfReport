//
//  NMAgregarPicoViewController.m
//  CharruaSurfReport
//
//  Created by norman martinez on 28/08/14.
//  Copyright (c) 2014 NMDevelopment. All rights reserved.
//

#import "NMLocalizarPicoViewController.h"

@interface NMLocalizarPicoViewController ()

@end

@implementation NMLocalizarPicoViewController

@synthesize currentLocation,locationManager;
@synthesize fetchedResultsController = _fetchedResultsController;


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
    id delegate = [[UIApplication sharedApplication] delegate];
    self.managedObjectContext = [delegate managedObjectContext];
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

/*
// Called when the location manager determines that there is a new location
- (void)locationManager:(CLLocationManager *)manager
     didUpdateLocations:(NSArray *)locations
{
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
}
 */

//valido la latitud y longitud del centro
- (IBAction)agregarPico:(id)sender
{
    CLLocationCoordinate2D centre = [self.map centerCoordinate];
    //latitudActual=(NSDecimalNumber *)[NSDecimalNumber numberWithDouble:centre.latitude];
    //longitudActual= (NSDecimalNumber *)[NSDecimalNumber numberWithDouble:centre.longitude];
    
    self.nuevoPico=(Pico *)[NSEntityDescription insertNewObjectForEntityForName:@"Pico" inManagedObjectContext:[self managedObjectContext]];
    self.nuevoPico.latitud=(NSDecimalNumber *)[NSDecimalNumber numberWithDouble:centre.latitude];
    self.nuevoPico.longitud=(NSDecimalNumber *)[NSDecimalNumber numberWithDouble:centre.longitude];
}

#pragma mark - Segue
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    UINavigationController *navigationController = segue.destinationViewController;
    //importante para ligar el delegado
    if ([[segue identifier] isEqualToString:@"salvarPico"])
    {
        NMSalvarPicoViewController *salvarPico=[[navigationController viewControllers] objectAtIndex:0];        salvarPico.delegate=self;
        salvarPico.nuevoPico=self.nuevoPico;
    }
}

-(void)salvarPicoDiDCancel:(Pico *)borrarPico
{
    NSManagedObjectContext *context = self.managedObjectContext;
    [context deleteObject:borrarPico];
    [self dismissViewControllerAnimated:YES completion:nil];
}

-(void)salvarPicoDidAdd
{
    NSError *error = nil;
    NSManagedObjectContext *context = self.managedObjectContext;
    if (![context save:&error]) {
        NSLog(@"Error! %@", error);
    }
    NSString *contenido=[[NSString alloc]initWithFormat:@"Se ha agregado el Pico %@",self.nuevoPico.nombrePico];
    UIAlertView *alerta =[[UIAlertView alloc]initWithTitle:@"Nuevo Pico: " message:contenido delegate:nil cancelButtonTitle:@"ok" otherButtonTitles:nil,nil];
    [alerta show];

    [self dismissViewControllerAnimated:YES completion:nil];
}


@end
