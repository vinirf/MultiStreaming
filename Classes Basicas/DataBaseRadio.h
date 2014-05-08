//
//  DataBaseRadio.h
//  MultiPlayer
//
//  Created by Vinicius Resende Fialho on 26/02/14.
//  Copyright (c) 2014 Vinicius Resende Fialho. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Radio.h"

@interface DataBaseRadio : NSObject

@property NSMutableArray *listaRadio;


-(NSMutableArray*)SerializarRadiosSistema;
+(DataBaseRadio*)sharedManager;
-(NSArray*)allItems;

@end
