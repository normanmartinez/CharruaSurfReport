//
//  NMListaFechasPicoViewController.m
//  CharruaSurfReport
//
//  Created by norman martinez on 08/09/14.
//  Copyright (c) 2014 NMDevelopment. All rights reserved.
//

#import "NMListaFechasPicoViewController.h"

@interface NMListaFechasPicoViewController ()

@end

@implementation NMListaFechasPicoViewController

@synthesize nombrePico, latitud, longitud,fechaCondicion,listaFechas;

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
    
    //recupero lista de fechas para la geolocalización
    self.listaFechas=[self listadoCondicionesLatitud:self.latitud listadoCondicionesLongitud:self.longitud];
    [self cargaFechas];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    NMCondicionPicoViewController *condicion =[segue destinationViewController];
    condicion.delegate=self;
    condicion.nombrePico=self.nombrePico;
    condicion.latitud=self.latitud;
    condicion.longitud=self.longitud;
    condicion.fechaCondicion=self.fechaCondicion;
}

//Recupera el array de condiciones de un pico
-(NSArray *)listadoCondicionesLatitud:(NSDecimalNumber *)lat listadoCondicionesLongitud:(NSDecimalNumber *)lon
{
    /*NSString *urlAPI =[[NSString alloc]initWithFormat:@"http://api.worldweatheronline.com/free/v1/marine.ashx?key=cf48441cc45eea89cbd259a8c698c4a569fdcb2c&q=%@,%@&format=json",(NSString *)lat,(NSString *)lon];*/
    
    NSString *urlAPI =[[NSString alloc]initWithFormat:@"http://api.worldweatheronline.com/premium/v1/marine.ashx?q=%@,%@&format=json&key=%@",(NSString *)lat,(NSString *)lon,[self recuperaValorPlist:@"WorldWeatherKey"]];
    
    NSURL *url=[NSURL URLWithString:urlAPI];
    NSError *error=nil;
    NSData *data=[NSData dataWithContentsOfURL:url];
    NSDictionary *nivelBase=[NSJSONSerialization
                             JSONObjectWithData:data
                             options:NSJSONReadingMutableContainers
                             error:&error];
    
    NSDictionary *nivel1 = [nivelBase objectForKey:@"data"];
    NSArray *nivel2 = [nivel1 objectForKey:@"weather"];
    return nivel2;
}

-(NSString *)recuperaValorPlist:(NSString *)key
{
    NSString *path = [[NSBundle mainBundle] pathForResource: @"WorldWeather" ofType: @"plist"];
    NSDictionary *dict = [NSDictionary dictionaryWithContentsOfFile: path];
    
    return [dict objectForKey:key];
}

//Cargo las fechas en los distintos botones
-(void)cargaFechas
{
    [self.btFecha1 setTitle:(NSString *)[[self.listaFechas objectAtIndex:0] objectForKey:@"date"] forState:UIControlStateNormal];
    [self.btFecha2 setTitle:(NSString *)[[self.listaFechas objectAtIndex:1] objectForKey:@"date"] forState:UIControlStateNormal];
    [self.btFecha3 setTitle:(NSString *)[[self.listaFechas objectAtIndex:2] objectForKey:@"date"] forState:UIControlStateNormal];
    [self.btFecha4 setTitle:(NSString *)[[self.listaFechas objectAtIndex:3] objectForKey:@"date"] forState:UIControlStateNormal];
    [self.btFecha5 setTitle:(NSString *)[[self.listaFechas objectAtIndex:4] objectForKey:@"date"] forState:UIControlStateNormal];
    [self.btFecha6 setTitle:(NSString *)[[self.listaFechas objectAtIndex:5] objectForKey:@"date"] forState:UIControlStateNormal];
    [self.btFecha7 setTitle:(NSString *)[[self.listaFechas objectAtIndex:6] objectForKey:@"date"] forState:UIControlStateNormal];
}

- (IBAction)btaFecha1:(id)sender {
    self.fechaCondicion=self.btFecha1.titleLabel.text;
}

- (IBAction)btaFecha2:(id)sender {
    self.fechaCondicion=self.btFecha2.titleLabel.text;
}

- (IBAction)btaFecha3:(id)sender {
    self.fechaCondicion=self.btFecha3.titleLabel.text;
}

- (IBAction)btaFecha4:(id)sender {
    self.fechaCondicion=self.btFecha4.titleLabel.text;
}

- (IBAction)btaFecha5:(id)sender {
    self.fechaCondicion=self.btFecha5.titleLabel.text;
}

- (IBAction)btaFecha6:(id)sender {
    self.fechaCondicion=self.btFecha6.titleLabel.text;
}

- (IBAction)btaFecha7:(id)sender {
    self.fechaCondicion=self.btFecha7.titleLabel.text;
}
@end
