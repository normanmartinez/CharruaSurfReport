//
//  NMPasosRutaPicoTableViewController.m
//  CharruaSurfReport
//
//  Created by norman martinez on 11/09/14.
//  Copyright (c) 2014 NMDevelopment. All rights reserved.
//

#import "NMPasosRutaPicoTableViewController.h"

@interface NMPasosRutaPicoTableViewController ()

@end

@implementation NMPasosRutaPicoTableViewController


- (void)viewDidLoad
{
    [super viewDidLoad];
    
   //self.navigationItem.title = @"Pasos";
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return [self.pasos.steps count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    // Pull out the correct step
    MKRouteStep *step = self.pasos.steps[indexPath.row];
    
    // Configure the cell...
    //cell.textLabel.text = [NSString stringWithFormat:@"%02d) %0.1fkm", indexPath.row, step.distance / 1000.0];
    cell.textLabel.text =step.instructions;
    cell.detailTextLabel.text = step.notice;
    
    return cell;
}

#pragma mark - Navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue destinationViewController] isKindOfClass:[NMDetallePasoViewController class]]) {
        NMDetallePasoViewController *vc = (NMDetallePasoViewController *)[segue destinationViewController];
        NSIndexPath *selectedRow = [self.tableView indexPathForSelectedRow];
        
        // If we have a selected row then set the step appropriately
        if(selectedRow) {
            vc.routeStep = self.pasos.steps[selectedRow.row];
            vc.stepIndex = selectedRow.row;
        }
    }
}

@end
