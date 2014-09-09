//
//  NMListaFechasPicoViewController.h
//  CharruaSurfReport
//
//  Created by norman martinez on 08/09/14.
//  Copyright (c) 2014 NMDevelopment. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NMCondicionPicoViewController.h"
#import "Pico.h"

@interface NMListaFechasPicoViewController : UIViewController <NMCondicionPicoViewControllerDelegate>

@property (retain,nonatomic) NSDecimalNumber *latitud;
@property (retain,nonatomic) NSDecimalNumber *longitud;
@property (retain,nonatomic) NSString *nombrePico;
@property (retain,nonatomic) NSString *fechaCondicion;
@property (strong, nonatomic) NSArray *listaFechas;

@property (strong, nonatomic) IBOutlet UIButton *btFecha1;
@property (strong, nonatomic) IBOutlet UIButton *btFecha2;
@property (strong, nonatomic) IBOutlet UIButton *btFecha3;
@property (strong, nonatomic) IBOutlet UIButton *btFecha4;
@property (strong, nonatomic) IBOutlet UIButton *btFecha5;
@property (strong, nonatomic) IBOutlet UIButton *btFecha6;
@property (strong, nonatomic) IBOutlet UIButton *btFecha7;

- (IBAction)btaFecha1:(id)sender;
- (IBAction)btaFecha2:(id)sender;
- (IBAction)btaFecha3:(id)sender;
- (IBAction)btaFecha4:(id)sender;
- (IBAction)btaFecha5:(id)sender;
- (IBAction)btaFecha6:(id)sender;
- (IBAction)btaFecha7:(id)sender;


@end
