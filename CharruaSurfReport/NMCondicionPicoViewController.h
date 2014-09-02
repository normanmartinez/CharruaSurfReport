//
//  NMCondicionPicoViewController.h
//  CharruaSurfReport
//
//  Created by norman martinez on 01/09/14.
//  Copyright (c) 2014 NMDevelopment. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NMCondicionPageContentViewController.h"
#import "Pico.h"

@interface NMCondicionPicoViewController : UIViewController <UIPageViewControllerDataSource>

@property (strong, nonatomic) UIPageViewController *pageViewController;

@property (strong, nonatomic) Pico *pico;
@property (strong, nonatomic) NSArray *pageTitles;

@end
