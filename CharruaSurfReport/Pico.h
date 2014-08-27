//
//  Pico.h
//  CharruaSurfReport
//
//  Created by norman martinez on 27/08/14.
//  Copyright (c) 2014 NMDevelopment. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface Pico : NSManagedObject

@property (nonatomic, retain) NSString * nombrePico;
@property (nonatomic, retain) NSDecimalNumber * latitud;
@property (nonatomic, retain) NSDecimalNumber * longitud;
@property (nonatomic, retain) NSDate * fechaAlta;

@end
