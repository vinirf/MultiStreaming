//
//  DataBaseMusica.m
//  MultiPlayer
//
//  Created by Vinicius Resende Fialho on 26/02/14.
//  Copyright (c) 2014 Vinicius Resende Fialho. All rights reserved.
//

#import "DataBaseMusica.h"

@implementation DataBaseMusica


+(DataBaseMusica*)sharedManager{
    static DataBaseMusica *unicoDataMusica = nil;
    if(!unicoDataMusica){
        unicoDataMusica = [[super allocWithZone:nil]init];
    }
    return unicoDataMusica;
}

-(id)init{
    self = [super init];
    if(self){
        self.listaMusicas= [[NSMutableArray alloc]init];
    }
    return self;
}

+(id)allocWithZone:(struct _NSZone *)zone{
    return [self sharedManager];
}

-(NSMutableArray*)SerializarMusicasSistema {
    return  NULL;
}

@end
