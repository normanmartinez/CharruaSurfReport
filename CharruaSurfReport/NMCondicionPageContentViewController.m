//
//  NMCondicionPageContentViewController.m
//  CharruaSurfReport
//
//  Created by norman martinez on 01/09/14.
//  Copyright (c) 2014 NMDevelopment. All rights reserved.
//

#import "NMCondicionPageContentViewController.h"

@interface NMCondicionPageContentViewController ()

@end

@implementation NMCondicionPageContentViewController

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
    self.lblNombrePico.text=self.nombrePico;
    
    if([[pico valueForKey:@"time"]isEqualToString:@"0"])
        self.lblHora.text=[NSString stringWithFormat:@"00.00"];
    else
        self.lblHora.text=(NSString *)[pico valueForKey:@"time"];
    
    self.lblLatidud.text=[self.latitud stringValue];
    self.lblLongitud.text=[self.longitud stringValue];
    self.lblTemperatura.text=(NSString *)[pico valueForKey:@"tempC"];
    self.lblTemperaturaAgua.text=(NSString *)[pico valueForKey:@"waterTemp_C"];
    self.lblDireccionViento.text=(NSString *)[pico valueForKey:@"winddirDegree"];
    self.lblDireccionSwell.text=(NSString *)[pico valueForKey:@"swellDir"];
    self.lblTamanoSwell.text=(NSString *)[pico valueForKey:@"swellHeight_m"];
    self.lblPeriodoSwell.text=(NSString *)[pico valueForKey:@"swellPeriod_secs"];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
