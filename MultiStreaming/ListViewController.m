//
//  ListViewController.m
//  MultiPlayer
//
//  Created by Vinicius Resende Fialho on 26/02/14.
//  Copyright (c) 2014 Vinicius Resende Fialho. All rights reserved.
//

#import "ListViewController.h"
#import "PlayerViewController.h"
#import "DataBaseRadio.h"
#import "DataBaseTv.h"
#import  "AuxPlayer.h"
#import "Radio.h"
#import "Tv.h"

@interface ListViewController ()

@end

@implementation ListViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        DataBaseRadio *radioSistema = [[DataBaseRadio alloc]init];
        [radioSistema SerializarRadiosSistema];
        
        DataBaseTv *tvSistema = [[DataBaseTv alloc]init];
        [tvSistema SerializarTvsSistema];
    }
    return self;
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    [[self list]reloadData];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.swipe = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(passaView:)];
    [self.swipe setNumberOfTouchesRequired:1];
    self.swipe.direction = UISwipeGestureRecognizerDirectionRight;
    [[self viewGestureLista] addGestureRecognizer:self.swipe];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)passaView:(UISwipeGestureRecognizer *)gesture {
    
    PlayerViewController *list = [[PlayerViewController alloc]init];
    [self presentViewController:list animated:UIModalTransitionStyleFlipHorizontal completion:nil];
}


//TableView
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return 1;
}

-(NSString*)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    
    switch ([AuxPlayer sharedManager].id) {
        case 0:
            return @"Lista de Radios";
            break;
            
        case 1:
            return @"Lista de Tvs";
            break;
            
        default:
            return @"fudeu";
            break;
    }
    
}


-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    switch ([AuxPlayer sharedManager].id) {
        case 0:
            return [[[DataBaseRadio sharedManager]allItems] count];
            break;
            
        case 1:
            return [[[DataBaseTv sharedManager]allItems] count];;
            break;
            
        default:
            return 0;
            break;
            
    }
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 130.0;
}


-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"UITableViewCell"];
    
    
    if(!cell){
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"UITableViewCell"];
    }
    
    
    switch ([AuxPlayer sharedManager].id) {
        case 0:{
            Radio *p = [[[DataBaseRadio sharedManager]allItems] objectAtIndex:[indexPath row]];
            [[cell textLabel] setFont:[UIFont systemFontOfSize:40.0]];

            NSString *conc = [NSString stringWithFormat:@"%@,%0.2f", [p nomeEstacao], [p banda]];
            [[cell textLabel]setText:conc];
            break;
        }
            
        case 1:{
            Tv *p = [[[DataBaseTv sharedManager]allItems] objectAtIndex:[indexPath row]];
            [[cell textLabel] setFont:[UIFont systemFontOfSize:40.0]];
           
            NSString *conc = [NSString stringWithFormat:@"%@", [p titulo]];
            [[cell textLabel]setText:conc];
            break;
        }
    }
    
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    Radio *p = [[Radio alloc]init];
    Tv *p2 = [[Tv alloc]init];
    
    switch ([AuxPlayer sharedManager].id) {
        case 0:{
            p = [[[DataBaseRadio sharedManager]allItems] objectAtIndex:[indexPath row]];
            NSURL *cami = [[NSURL alloc] initWithString:[p caminho]];
            [[AuxPlayer sharedManager]setLink:cami];
            [[AuxPlayer sharedManager]setIndice:(int)[indexPath row]];
            [self passaView:0];
            break;
        }
            
        case 1:{
            p2 = [[[DataBaseTv sharedManager]allItems] objectAtIndex:[indexPath row]];
            NSURL *cami2 = [[NSURL alloc] initWithString:[p2 caminho]];
            [[AuxPlayer sharedManager]setLink:cami2];
            [[AuxPlayer sharedManager]setIndice:(int)[indexPath row]];
            [self passaView:0];
            break;
        }
            
    }
    
    
}

- (BOOL)shouldAutorotate
{
    return NO;
}



@end





