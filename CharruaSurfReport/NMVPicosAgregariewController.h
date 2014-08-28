//
//  NMVPicosAgregariewController.h
//  CharruaSurfReport
//
//  Created by norman martinez on 27/08/14.
//  Copyright (c) 2014 NMDevelopment. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>

@interface NMVPicosAgregariewController : UIViewController <MKMapViewDelegate> {
	IBOutlet MKMapView* _map;
    NSMutableArray *_currentAnnotations;
    NSString *tempUrl;
    UIButton *closeButton;
}

@property (nonatomic, strong) IBOutlet MKMapView *map;

@end
