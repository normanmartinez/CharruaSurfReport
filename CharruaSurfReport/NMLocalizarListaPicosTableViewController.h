//
//  NMLocalizarListaPicosTableViewController.h
//  CharruaSurfReport
//
//  Created by norman martinez on 10/09/14.
//  Copyright (c) 2014 NMDevelopment. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Pico.h"

@interface NMLocalizarListaPicosTableViewController : UITableViewController <NSFetchedResultsControllerDelegate,UITableViewDataSource,UITableViewDelegate>

@property (nonatomic, strong) NSManagedObjectContext *managedObjectContext;
@property (nonatomic, strong) NSFetchedResultsController *fetchedResultsController;

@property (nonatomic, strong) Pico *pico;

@end
