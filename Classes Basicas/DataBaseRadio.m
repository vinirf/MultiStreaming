//
//  DataBaseRadio.m
//  MultiPlayer
//
//  Created by Vinicius Resende Fialho on 26/02/14.
//  Copyright (c) 2014 Vinicius Resende Fialho. All rights reserved.
//

#import "DataBaseRadio.h"

@implementation DataBaseRadio

+(DataBaseRadio*)sharedManager{
    static DataBaseRadio *unicoDataRadio = nil;
    if(!unicoDataRadio){
        unicoDataRadio = [[super allocWithZone:nil]init];
    }
    return unicoDataRadio;
}

-(id)init{
    self = [super init];
    if(self){
        self.listaRadio= [[NSMutableArray alloc]init];
    }
    return self;
}

+(id)allocWithZone:(struct _NSZone *)zone{
    return [self sharedManager];
}

-(NSMutableArray*)SerializarRadiosSistema{
 
    
    Radio *est1 = [[Radio alloc]init];
    [est1 setNomeEstacao:@"TremBao FM"];
    [est1 setGenero:@"Sertanejo"];
    [est1 setBanda:95.6];
    [est1 setCaminho:@"http://74.222.1.133:11146/listen.pls"];
    
    
    Radio *est2 = [[Radio alloc]init];
    [est2 setNomeEstacao:@"Imagine"];
    [est2 setGenero:@"Eletric"];
    [est2 setBanda:89.7];
    [est2 setCaminho:@"http://imagine.1stepstream.com:8000/live"];
    
    
    
    Radio *est3 = [[Radio alloc]init];
    [est3 setNomeEstacao:@"SKAI"];
    [est3 setGenero:@"Rock"];
    [est3 setBanda:100.3];
    [est3 setCaminho:@"http://85.17.81.140/listen/trollradio-gr"];
    
    
    [[self listaRadio]addObject:est1];
    [[self listaRadio]addObject:est2];
    [[self listaRadio]addObject:est3];

    
    return [self listaRadio];

    
}

-(NSArray*)allItems{
    return [self listaRadio];
}



@end
