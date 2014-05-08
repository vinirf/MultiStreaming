//
//  AuxPlayer.h
//  MultiPlayer
//
//  Created by Vinicius Resende Fialho on 26/02/14.
//  Copyright (c) 2014 Vinicius Resende Fialho. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AuxPlayer : NSObject


@property int id;
@property NSURL *link;
@property int indice;

+(AuxPlayer*)sharedManager;


@end
