//
//  DataBaseMusica.h
//  MultiPlayer
//
//  Created by Vinicius Resende Fialho on 26/02/14.
//  Copyright (c) 2014 Vinicius Resende Fialho. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Musica.h"

@interface DataBaseMusica : NSObject


@property NSMutableArray *listaMusicas;


-(NSMutableArray*)SerializarMusicasSistema;
+(DataBaseMusica*)sharedManager;


@end
