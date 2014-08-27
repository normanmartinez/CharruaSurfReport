//
//  NMAppDelegate.h
//  CharruaSurfReport
//
//  Created by norman martinez on 26/08/14.
//  Copyright (c) 2014 NMDevelopment. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NMPicosListaTableViewController.h"

@interface NMAppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (readonly, strong, nonatomic) NSManagedObjectContext *managedObjectContext;
@property (readonly, strong, nonatomic) NSManagedObjectModel *managedObjectModel;
@property (readonly, strong, nonatomic) NSPersistentStoreCoordinator *persistentStoreCoordinator;

- (void)saveContext;
- (NSURL *)applicationDocumentsDirectory;

@end
