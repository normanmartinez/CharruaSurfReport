//
//  Pico.h
//  CharruaSurfReport
//
//  Created by norman martinez on 03/09/14.
//  Copyright (c) 2014 NMDevelopment. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface Pico : NSManagedObject

@property (nonatomic, retain) NSDate * fechaAlta;
@property (nonatomic, retain) NSDecimalNumber * latitud;
@property (nonatomic, retain) NSDecimalNumber * longitud;
@property (nonatomic, retain) NSString * nombrePico;
@property (nonatomic, retain) NSNumber * hora;
@property (nonatomic, retain) NSDecimalNumber * temperatura;
@property (nonatomic, retain) NSDecimalNumber * temperaturaAgua;
@property (nonatomic, retain) NSNumber * direccionSwell;
@property (nonatomic, retain) NSDecimalNumber * tamanoSwell;
@property (nonatomic, retain) NSDecimalNumber * periodoSwell;
@property (nonatomic, retain) NSNumber * direccionViento;

@end
