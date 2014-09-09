//
//  NMPicosListaTableViewController.h
//  CharruaSurfReport
//
//  Created by norman martinez on 27/08/14.
//  Copyright (c) 2014 NMDevelopment. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Pico.h"
#import "NMCondicionPicoViewController.h"
#import "NMListaFechasPicoViewController.h"

@interface NMPicosListaTableViewController : UITableViewController <NSFetchedResultsControllerDelegate,UITableViewDataSource,UITableViewDelegate,NMCondicionPicoViewControllerDelegate>

@property (nonatomic, strong) NSManagedObjectContext *managedObjectContext;
@property (nonatomic, strong) NSFetchedResultsController *fetchedResultsController;

@property (nonatomic, strong) Pico *pico;

@end
