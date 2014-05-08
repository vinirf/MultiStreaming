//
//  AuxPlayer.m
//  MultiPlayer
//
//  Created by Vinicius Resende Fialho on 26/02/14.
//  Copyright (c) 2014 Vinicius Resende Fialho. All rights reserved.
//

#import "AuxPlayer.h"

@implementation AuxPlayer

+(AuxPlayer*)sharedManager{
    static AuxPlayer *unicoAux = nil;
    if(!unicoAux){
        unicoAux = [[super allocWithZone:nil]init];
    }
    return unicoAux;
}

-(id)init{
    self = [super init];
    if(self){
        [self setLink:[[NSURL alloc] initWithString:@"https://dl.dropboxusercontent.com/u/66188885/pp.mp3"]];
    }
    return self;
}

+(id)allocWithZone:(struct _NSZone *)zone{
    return [self sharedManager];
}


@end
