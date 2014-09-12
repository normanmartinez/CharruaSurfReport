//
//  NMRutaPicoViewController.m
//  CharruaSurfReport
//
//  Created by norman martinez on 10/09/14.
//  Copyright (c) 2014 NMDevelopment. All rights reserved.
//

#import "NMRutaPicoViewController.h"

@interface NMRutaPicoViewController () <MKMapViewDelegate> {
    MKPolyline *_routeOverlay;
    MKRoute *_currentRoute;
}
@end

@implementation NMRutaPicoViewController

@synthesize pico;

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
	
    self.activityIndicator.hidden = YES;
    
    self.detalleRuta.enabled = NO;
    self.mapView.delegate = self;
    self.navigationItem.title = [[NSString alloc] initWithFormat:@"Ruta a %@",self.pico.nombrePico];
    [self generarRutaLatidud:[self.pico.latitud doubleValue] RutaLongitud:[self.pico.longitud doubleValue]];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.destinationViewController isKindOfClass:[NMPasosRutaPicoTableViewController class]])
    {
        NMPasosRutaPicoTableViewController *pasos = (NMPasosRutaPicoTableViewController *)segue.destinationViewController;
        pasos.pasos = _currentRoute;
    }
}

- (NSUInteger)supportedInterfaceOrientations
{
    return UIInterfaceOrientationMaskPortrait;
}

//Metodo que, a partir de la lat y long genera la ruta en el mapa
-(void)generarRutaLatidud:(double)lat RutaLongitud:(double)lon
{
    self.activityIndicator.hidden = NO;
    [self.activityIndicator startAnimating];
    self.detalleRuta.enabled = NO;
    
    MKDirectionsRequest *directionsRequest = [MKDirectionsRequest new];
    
    MKMapItem *source = [MKMapItem mapItemForCurrentLocation];
    [directionsRequest setSource:source];
    
    // marca el destino
    CLLocationCoordinate2D destinationCoords = CLLocationCoordinate2DMake(lat,lon);
    MKPlacemark *destinationPlacemark = [[MKPlacemark alloc] initWithCoordinate:destinationCoords addressDictionary:nil];
    MKMapItem *destination = [[MKMapItem alloc] initWithPlacemark:destinationPlacemark];
    [directionsRequest setDestination:destination];
    
    MKDirections *directions = [[MKDirections alloc] initWithRequest:directionsRequest];
    [directions calculateDirectionsWithCompletionHandler:^(MKDirectionsResponse *response, NSError *error) {
        
        self.activityIndicator.hidden = YES;
        [self.activityIndicator stopAnimating];
        
        //Maneja el resultado
        if (error) {
            UIAlertView *alerta =[[UIAlertView alloc]initWithTitle:@"Nuevo Pico: " message:@"No se pudo encontrar la ruta!" delegate:nil cancelButtonTitle:@"ok" otherButtonTitles:nil,nil];
            [alerta show];
            
            return;
        }
        
        self.detalleRuta.enabled = YES;
        self.detalleRuta.hidden = NO;
        _currentRoute = [response.routes firstObject];
        [self plotRouteOnMap:_currentRoute];
    }];
}

#pragma mark - Utility Methods

- (void)plotRouteOnMap:(MKRoute *)route
{
    if(_routeOverlay) {
        [self.mapView removeOverlay:_routeOverlay];
    }
    
    _routeOverlay = route.polyline;
   
    [self.mapView addOverlay:_routeOverlay];
    
}


#pragma mark - MKMapViewDelegate methods
- (MKOverlayRenderer *)mapView:(MKMapView *)mapView rendererForOverlay:(id<MKOverlay>)overlay
{
    MKPolylineRenderer *renderer = [[MKPolylineRenderer alloc] initWithPolyline:overlay];
    renderer.strokeColor = [UIColor redColor];
    renderer.lineWidth = 4.0;
    return  renderer;
}



@end
