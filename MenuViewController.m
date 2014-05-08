//
//  MenuViewController.m
//  MultiPlayer
//
//  Created by Vinicius Resende Fialho on 26/02/14.
//  Copyright (c) 2014 Vinicius Resende Fialho. All rights reserved.
//

#import "MenuViewController.h"
#import "AuxPlayer.h"
#import "ListViewController.h"
#import "RecordViewController.h"
#import "Tv.h"

@interface MenuViewController ()

@end

@implementation MenuViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)buttonRadio:(id)sender {
    [[AuxPlayer sharedManager] setId:0];
    ListViewController *list = [[ListViewController alloc]init];
    [self presentViewController:list animated:YES completion:nil];
}

- (IBAction)buttonTv:(id)sender {
    [[AuxPlayer sharedManager] setId:1];
    ListViewController *list = [[ListViewController alloc]init];
    [self presentViewController:list animated:YES completion:nil];
}

- (IBAction)buttonMusica:(id)sender {
    
}

- (IBAction)buttonRecord:(id)sender {
    //[[AuxPlayer sharedManager] setId:1];
    RecordViewController *list = [[RecordViewController alloc]init];
    [self presentViewController:list animated:YES completion:nil];
}

- (BOOL)shouldAutorotate
{
    return NO;
}




@end
