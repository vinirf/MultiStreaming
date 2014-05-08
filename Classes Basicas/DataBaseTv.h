//
//  DataBaseTv.h
//  MultiPlayer
//
//  Created by Vinicius Resende Fialho on 26/02/14.
//  Copyright (c) 2014 Vinicius Resende Fialho. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Tv.h"

@interface DataBaseTv : NSObject

@property NSMutableArray *listaTv;


-(NSMutableArray*)SerializarTvsSistema;
+(DataBaseTv*)sharedManager;
-(NSArray*)allItems;
-(void)validaCanaisBrasil:(NSMutableArray*)listaTodosCanais;

-(void)readJson;

@end
