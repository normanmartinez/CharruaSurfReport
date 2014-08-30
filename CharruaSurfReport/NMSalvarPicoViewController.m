//
//  NMSalvarPicoViewController.m
//  CharruaSurfReport
//
//  Created by norman martinez on 29/08/14.
//  Copyright (c) 2014 NMDevelopment. All rights reserved.
//

#import "NMSalvarPicoViewController.h"

@interface NMSalvarPicoViewController ()

@end

@implementation NMSalvarPicoViewController

@synthesize latitud,longitud;

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
    self.lblLatitud.text=[self.nuevoPico.latitud stringValue];
    self.lblLongitud.text=[self.nuevoPico.longitud stringValue];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)salvarPico:(id)sender
{
    [self.nuevoPico setNombrePico:self.txtNombrePico.text];
    [self.nuevoPico setFechaAlta:[NSDate date]];
    
    [self.delegate salvarPicoDidAdd];
}

- (IBAction)cancelarPico:(id)sender {
    [self.delegate salvarPicoDiDCancel:[self nuevoPico]];
}
@end
