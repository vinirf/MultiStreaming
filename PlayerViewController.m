//
//  PlayerViewController.m
//  MultiPlayer
//
//  Created by Vinicius Resende Fialho on 26/02/14.
//  Copyright (c) 2014 Vinicius Resende Fialho. All rights reserved.
//

#import "PlayerViewController.h"
#import "DataBaseTv.h"
#import "AuxPlayer.h"
#import "DataBaseRadio.h"
#import "MenuViewController.h"
#import "Tv.h"
#import "Radio.h"


@interface PlayerViewController ()

@end

@implementation PlayerViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        [self setModalTransitionStyle: UIModalTransitionStyleFlipHorizontal];
        
        
    }
    return self;
}

-(void)startC{
    //[[self car] startAnimating];
}


- (void)viewDidLoad
{
    [super viewDidLoad];
    self.swipe = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(passaView:)];
    [self.swipe setNumberOfTouchesRequired:1];
    self.swipe.direction = UISwipeGestureRecognizerDirectionLeft;
    [[self viewGesture] addGestureRecognizer:self.swipe];
    
    
    carregando = [[NSThread alloc] initWithTarget:self selector:@selector(startC) object:nil];
    [carregando start];
    
    switch ([AuxPlayer sharedManager].id) {
        case 0:{
            AVPlayerItem *item1 = [[AVPlayerItem alloc] initWithURL:[[AuxPlayer sharedManager] link]];
            queuePlayer = [[AVQueuePlayer alloc] initWithItems:[NSArray arrayWithObjects:item1, nil]];
            queuePlayer.volume = 5.0;
            [queuePlayer play];
            
            Radio * rad = [[[DataBaseRadio sharedManager]allItems]objectAtIndex:[[AuxPlayer sharedManager] indice]];
            [[self nomeArq]setText:[rad nomeEstacao]];
            break;
        }
            
        case 1:{
            [duracao setHidden:TRUE];
            Tv * rad = [[[DataBaseTv sharedManager]allItems]objectAtIndex:[[AuxPlayer sharedManager] indice]];
            [[self nomeArq]setText:[rad titulo]];
            self.moviePlayer=[[MPMoviePlayerController alloc] initWithContentURL:[[AuxPlayer sharedManager] link]];
            self.moviePlayer.repeatMode = NO;
            self.moviePlayer.controlStyle = MPMovieControlStyleNone;
            [self.moviePlayer setFullscreen:YES animated:YES];
            
            [[self moviePlayer] play];
            
            [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(moviePlayBackDonePressed:)
                                                         name:MPMoviePlayerDidExitFullscreenNotification object:self.moviePlayer];
            
            [self.view addSubview:self.moviePlayer.view];//add a view moviePlayer a nossa tela
            self.moviePlayer.view.frame = self.viewVideo.frame;
            break;
        }
    }
    
    [carregando cancel];
    //[[self car] setHidden:YES];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)updateItemProgress{
    
    Float64 currentTime = CMTimeGetSeconds([[queuePlayer currentItem] currentTime]);
    Float64 duration = CMTimeGetSeconds([[queuePlayer currentItem] duration]);
    Float64 progress = currentTime / duration;
    
    //UiSLider
    [duracao setValue:progress];
}

- (IBAction)duracaoSlider:(UISlider *)sender {
    
    [queuePlayer pause];
    [[queuePlayer currentItem] seekToTime:CMTimeMake(CMTimeGetSeconds([[queuePlayer currentItem] duration])*[sender value], 1)];
    [queuePlayer play];
}

- (IBAction)full:(id)sender {
    
    self.moviePlayer.controlStyle = MPMovieControlStyleDefault;
    [self.moviePlayer setFullscreen:YES animated:YES];
    
       
}

- (void) moviePlayBackDonePressed:(NSNotification*)notification {
   
     self.moviePlayer.controlStyle = MPMovieControlStyleNone;
     [[self moviePlayer ]play];
}


- (IBAction)buttonPlay:(id)sender {
    //Verfica o time pausado
    
    switch ([AuxPlayer sharedManager].id) {
        case 0:{
            if(CMTimeGetSeconds(time) > 0){
                [[queuePlayer currentItem] seekToTime:time];
            }
            [queuePlayer play];
            //Chama a cada segundo o Update Slide e Progress
            [NSTimer scheduledTimerWithTimeInterval:.1 target:self selector:@selector(updateItemProgress) userInfo:nil repeats:YES];
            break;
        }
            
        case 1:{
            [[self moviePlayer] play];
            break;
        }
    }
    
    
    self.playHidden.hidden = YES;
    self.pauseHidden.hidden = NO;
}

- (IBAction)buttonPause:(id)sender {
    
    switch ([AuxPlayer sharedManager].id) {
        case 0:{
            //Salva o tempo da musica pausado
            time = [queuePlayer currentTime];
            //Pausa Musica
            [queuePlayer pause];
            break;
        }
            
        case 1:{
            [[self moviePlayer] pause];
            break;
        }
    }
    
    
    self.playHidden.hidden = NO;
    self.pauseHidden.hidden = YES;
    
}

- (IBAction)buttonFoward:(id)sender {
    
    
    [[AuxPlayer sharedManager]indice];
    int tamRadio = (int)[[[DataBaseRadio sharedManager]allItems]count];
    int tamTv = (int)[[[DataBaseTv sharedManager]allItems]count];
    
    switch ([AuxPlayer sharedManager].id) {
        case 0:{
            if([AuxPlayer sharedManager].indice == 0){
                [AuxPlayer sharedManager].indice = tamRadio - 1;
            }else{
                [AuxPlayer sharedManager].indice -= 1;
            }
            
            Radio * rad = [[[DataBaseRadio sharedManager]allItems]objectAtIndex:[[AuxPlayer sharedManager] indice]];
            NSURL *url=[[NSURL alloc] initWithString:[rad caminho]];
            [[AuxPlayer sharedManager] setLink:url];
            
            AVPlayerItem *item1 = [[AVPlayerItem alloc] initWithURL:url];
            [queuePlayer removeAllItems];
            [queuePlayer initWithPlayerItem:item1];
            [queuePlayer play];
            [[self nomeArq]setText:[rad nomeEstacao]];
            
            break;
        }
            
        case 1:{
            if([AuxPlayer sharedManager].indice == 0){
                [AuxPlayer sharedManager].indice = tamTv - 1;
            }else{
                [AuxPlayer sharedManager].indice -= 1;
            }
            
            Tv *chan = [[[DataBaseTv sharedManager]allItems]objectAtIndex:[[AuxPlayer sharedManager] indice]];
            NSURL *url=[[NSURL alloc] initWithString:[chan caminho]];
            [[AuxPlayer sharedManager] setLink:url];
            //[self.moviePlayer initWithContentURL:url];
            self.moviePlayer.contentURL = url;
            [self.moviePlayer play];
            [[self nomeArq]setText:[chan titulo]];
            
            break;
        }
    }
    
    
    
    self.playHidden.hidden = YES;
    self.pauseHidden.hidden = NO;
    
}

- (IBAction)buttonNext:(id)sender {
    [[AuxPlayer sharedManager]indice];
    int tamRadio = (int)[[[DataBaseRadio sharedManager]allItems]count];
    int tamTv = (int)[[[DataBaseTv sharedManager]allItems]count];
    
    switch ([AuxPlayer sharedManager].id) {
        case 0:{
            if([AuxPlayer sharedManager].indice == tamRadio - 1){
                [AuxPlayer sharedManager].indice = 0;
            }else{
                [AuxPlayer sharedManager].indice += 1;
            }
            
            Radio * rad = [[[DataBaseRadio sharedManager]allItems]objectAtIndex:[[AuxPlayer sharedManager] indice]];
            NSURL *url=[[NSURL alloc] initWithString:[rad caminho]];
            [[AuxPlayer sharedManager] setLink:url];
            
            AVPlayerItem *item1 = [[AVPlayerItem alloc] initWithURL:url];
            [queuePlayer removeAllItems];
            [queuePlayer initWithPlayerItem:item1];
            [queuePlayer play];
            [[self nomeArq]setText:[rad nomeEstacao]];
            
            break;
        }
            
        case 1:{
            if([AuxPlayer sharedManager].indice == tamTv - 1){
                [AuxPlayer sharedManager].indice = 0;
            }else{
                [AuxPlayer sharedManager].indice += 1;
            }
            
            Tv *chan = [[[DataBaseTv sharedManager]allItems]objectAtIndex:[[AuxPlayer sharedManager] indice]];
            NSURL *url=[[NSURL alloc] initWithString:[chan caminho]];
            [[AuxPlayer sharedManager] setLink:url];
            //[self.moviePlayer initWithContentURL:url];
            self.moviePlayer.contentURL = url;
            [self.moviePlayer play];
            [[self nomeArq]setText:[chan titulo]];
            
            break;
        }
    }
    
    
    
    self.playHidden.hidden = YES;
    self.pauseHidden.hidden = NO;
    
}


-(void)passaView:(UISwipeGestureRecognizer *)gesture {
    [self setModalTransitionStyle: UIModalTransitionStyleFlipHorizontal];
    [self dismissViewControllerAnimated:YES completion:nil];
    [[self moviePlayer]pause];
    [queuePlayer pause];
}

- (IBAction)buttonHome:(id)sender {
    MenuViewController *list = [[MenuViewController alloc]init];
    [self presentViewController:list animated:UIModalPresentationCurrentContext completion:nil];
    [[self moviePlayer] stop];
    [queuePlayer pause];
}

- (BOOL)shouldAutorotate
{
    return NO;
}





@end




