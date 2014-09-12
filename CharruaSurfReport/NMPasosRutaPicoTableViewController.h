//
//  NMPasosRutaPicoTableViewController.h
//  CharruaSurfReport
//
//  Created by norman martinez on 11/09/14.
//  Copyright (c) 2014 NMDevelopment. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NMDetallePasoViewController.h"
@import MapKit;

@interface NMPasosRutaPicoTableViewController : UITableViewController

@property (strong, nonatomic) MKRoute *pasos;

@end
