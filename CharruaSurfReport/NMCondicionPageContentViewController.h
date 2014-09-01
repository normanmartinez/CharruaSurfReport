//
//  NMCondicionPageContentViewController.h
//  CharruaSurfReport
//
//  Created by norman martinez on 01/09/14.
//  Copyright (c) 2014 NMDevelopment. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NMCondicionPageContentViewController : UIViewController

@property NSString *titleText;

@property NSUInteger pageIndex;

@property (weak, nonatomic) IBOutlet UILabel *titleLabel;

@end
