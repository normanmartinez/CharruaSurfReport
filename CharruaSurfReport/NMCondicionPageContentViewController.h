//
//  NMCondicionPageContentViewController.h
//  CharruaSurfReport
//
//  Created by norman martinez on 01/09/14.
//  Copyright (c) 2014 NMDevelopment. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Pico.h"

@interface NMCondicionPageContentViewController : UIViewController

@property NSString *titleText;

@property NSUInteger pageIndex;
@property (nonatomic,retain) NSString *nombrePico;
@property (nonatomic,retain) NSDecimalNumber *latitud;
@property (nonatomic,retain) NSDecimalNumber *longitud;
@property (nonatomic,retain) NSString *fechaCondicion;

@property (strong, nonatomic) IBOutlet UILabel *lblNombrePico;
@property (strong, nonatomic) IBOutlet UILabel *lblHora;
@property (strong, nonatomic) IBOutlet UILabel *lblLatidud;
@property (strong, nonatomic) IBOutlet UILabel *lblLongitud;
@property (strong, nonatomic) IBOutlet UILabel *lblTemperatura;
@property (strong, nonatomic) IBOutlet UILabel *lblTemperaturaAgua;
@property (strong, nonatomic) IBOutlet UILabel *lblDireccionSwell;
@property (strong, nonatomic) IBOutlet UILabel *lblTamanoSwell;
@property (strong, nonatomic) IBOutlet UILabel *lblPeriodoSwell;
@property (strong, nonatomic) IBOutlet UILabel *lblDireccionViento;
@property (strong, nonatomic) IBOutlet UILabel *lblFechaCondicion;

@property (strong, nonatomic) NSDictionary *pico;
@end
