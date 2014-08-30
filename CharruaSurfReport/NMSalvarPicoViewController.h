//
//  NMSalvarPicoViewController.h
//  CharruaSurfReport
//
//  Created by norman martinez on 29/08/14.
//  Copyright (c) 2014 NMDevelopment. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Pico.h"

@class NMSalvarPicoViewController;
@protocol NMSalvarPicoViewControllerDelegate <NSObject>

-(void)salvarPicoDiDCancel:(Pico *)borrarPico;
-(void)salvarPicoDidAdd;

@end

@interface NMSalvarPicoViewController : UIViewController <UITextFieldDelegate>

@property (strong, nonatomic) IBOutlet UITextField *txtNombrePico;
@property (strong, nonatomic) IBOutlet UILabel *lblLatitud;
@property (strong, nonatomic) IBOutlet UILabel *lblLongitud;

@property (nonatomic, strong) Pico *nuevoPico;

@property (retain,nonatomic) NSDecimalNumber *latitud;
@property (retain,nonatomic) NSDecimalNumber *longitud;

@property (nonatomic,weak) id<NMSalvarPicoViewControllerDelegate> delegate;

- (IBAction)salvarPico:(id)sender;
- (IBAction)cancelarPico:(id)sender;

@end
