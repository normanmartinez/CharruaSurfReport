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

@synthesize pico,fechaCondicion,latitud,longitud;

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
    self.lblFechaCondicion.text=self.fechaCondicion;
    self.lblHora.text=(NSString *)[pico valueForKey:@"time"];
    self.lblLatidud.text=[self formateaLocalizacion:self.latitud];
    self.lblLongitud.text=[self formateaLocalizacion:self.longitud];
    NSString *tem=[[NSString alloc]initWithFormat:@"%@ C",(NSString *)[pico valueForKey:@"tempC"]];
    self.lblTemperatura.text=tem;
    NSString *temA=[[NSString alloc]initWithFormat:@"%@ C",(NSString *)[pico valueForKey:@"waterTemp_C"]];
    self.lblTemperaturaAgua.text=temA;
    self.lblDireccionViento.text=[self direccionViento:[[pico valueForKey:@"winddirDegree"]doubleValue]];
    self.lblDireccionSwell.text=[self direccionSwell:[[pico valueForKey:@"swellDir"]doubleValue]];
    NSString *tam =[[NSString alloc]initWithFormat:@"%@ m",(NSString *)[pico valueForKey:@"swellHeight_m"]];
    self.lblTamanoSwell.text=tam;
    NSString *per =[[NSString alloc]initWithFormat:@"%@ s",(NSString *)[pico valueForKey:@"swellPeriod_secs"]];
    self.lblPeriodoSwell.text=per;
    NSString *velocidad =[[NSString alloc]initWithFormat:@"%@ Kmph",(NSString *)[pico valueForKey:@"windspeedKmph"]];
    self.lblVelocidadViento.text=velocidad;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(NSString *)direccionSwell:(double)valor
{
    /*
     0-N
     11.25
        22.5-NNE
     33.75
        45-NE
     56.25
        67.5-ENE
     78.75
        90-E
     101.25
        112.5-ESE
     123.75
        135-SE
     146.25
        157.5-SSE
     168.75
        180-S
     191.25
        202.5-SSO
     213,75
        225-SO
     236.25
        247.5-OSO
     258.75
        270-O
     281.25
        292.5-ONO
     303.75
        315-NO
     326.25
        337.5-NNO
     348.75
        360-N
     */
    NSString *direccion;
    if((valor >=11.25) && (valor <33.75) )
    {
        direccion=@"NNE";
    }
    else if ((valor >=33.75) && (valor <56.25))
    {
        direccion=@"NE";
    }
    else if ((valor >=56.25) && (valor <78.75))
    {
        direccion=@"ENE";
    }
    else if ((valor >=78.75) && (valor <101.25))
    {
        direccion=@"E";
    }
    else if ((valor >=101.25) && (valor <123.75) )
    {
        direccion=@"ESE";
    }
    else if ((valor >=123.75) && (valor <146.25) )
    {
        direccion=@"SE";
    }
    else if ((valor >=146.25) && (valor <168.75) )
    {
        direccion=@"SSE";
    }
    else if ((valor >=168.75) && (valor <191.25) )
    {
        direccion=@"S";
    }
    else if ((valor >=191.25) && (valor <213.75) )
    {
        direccion=@"SSO";
    }
    else if ((valor >=213.75) && (valor <236.25) )
    {
        direccion=@"SO";
    }
    else if ((valor >=236.25) && (valor <258.75) )
    {
        direccion=@"OSO";
    }
    else if ((valor >=258.75) && (valor <281.25) )
    {
        direccion=@"O";
    }
    else if ((valor >=281.25) && (valor <303.75) )
    {
        direccion=@"ONO";
    }
    else if ((valor >=303.75) && (valor <326.25) )
    {
        direccion=@"NO";
    }
    else if ((valor >=326.25) && (valor <348.75) )
    {
        direccion=@"NNO";
    }
    else if ((valor >=348.75) && (valor <=360) )
    {
        direccion=@"N";
    }
    else
    {
        direccion=@"N";
    }
    return direccion;
}

-(NSString *)direccionViento:(double)valor
{
    NSString *direccion;
    if((valor >=11.25) && (valor <33.75) )
    {
        direccion=@"NNE";
    }
    else if ((valor >=33.75) && (valor <56.25))
    {
        direccion=@"NE";
    }
    else if ((valor >=56.25) && (valor <78.75))
    {
        direccion=@"ENE";
    }
    else if ((valor >=78.75) && (valor <101.25))
    {
        direccion=@"E";
    }
    else if ((valor >=101.25) && (valor <123.75) )
    {
        direccion=@"ESE";
    }
    else if ((valor >=123.75) && (valor <146.25) )
    {
        direccion=@"SE";
    }
    else if ((valor >=146.25) && (valor <168.75) )
    {
        direccion=@"SSE";
    }
    else if ((valor >=168.75) && (valor <191.25) )
    {
        direccion=@"S";
    }
    else if ((valor >=191.25) && (valor <213.75) )
    {
        direccion=@"SSO";
    }
    else if ((valor >=213.75) && (valor <236.25) )
    {
        direccion=@"SO";
    }
    else if ((valor >=236.25) && (valor <258.75) )
    {
        direccion=@"OSO";
    }
    else if ((valor >=258.75) && (valor <281.25) )
    {
        direccion=@"O";
    }
    else if ((valor >=281.25) && (valor <303.75) )
    {
        direccion=@"ONO";
    }
    else if ((valor >=303.75) && (valor <326.25) )
    {
        direccion=@"NO";
    }
    else if ((valor >=326.25) && (valor <348.75) )
    {
        direccion=@"NNO";
    }
    else if ((valor >=348.75) && (valor <=360) )
    {
        direccion=@"N";
    }
    else
    {
        direccion=@"N";
    }
    return  direccion;
}

-(NSString *)formateaLocalizacion:(NSDecimalNumber *)valor
{
    NSNumberFormatter *formatter = [[NSNumberFormatter alloc] init];
    [formatter setNumberStyle:NSNumberFormatterDecimalStyle];
    [formatter setRoundingMode: NSNumberFormatterRoundHalfUp];
    [formatter setMaximumFractionDigits:6];
    
    return[formatter stringFromNumber:valor];
}

@end
