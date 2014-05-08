//
//  ListViewController.h
//  MultiPlayer
//
//  Created by Vinicius Resende Fialho on 26/02/14.
//  Copyright (c) 2014 Vinicius Resende Fialho. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ListViewController : UIViewController <UITableViewDataSource>


@property (weak, nonatomic) IBOutlet UIView *viewGestureLista;

@property (weak, nonatomic) IBOutlet UITableView *list;

@property UISwipeGestureRecognizer *swipe;

-(void)passaView:(UISwipeGestureRecognizer *)gesture;

@end
