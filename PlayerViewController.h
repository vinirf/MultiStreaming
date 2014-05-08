//
//  PlayerViewController.h
//  MultiPlayer
//
//  Created by Vinicius Resende Fialho on 26/02/14.
//  Copyright (c) 2014 Vinicius Resende Fialho. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>
#import <MediaPlayer/MediaPlayer.h>

@interface PlayerViewController : UIViewController <AVAudioPlayerDelegate> {
    AVQueuePlayer *queuePlayer;
    
    AVAudioPlayer *audio;
    CMTime time;
    NSTimer *sliderTimer;
    AVPlayer *avPlayer;
    
    IBOutlet UISlider *duracao;
    NSThread *carregando;

    
}

- (IBAction)buttonPlay:(id)sender;
- (IBAction)buttonPause:(id)sender;
- (IBAction)buttonFoward:(id)sender;
- (IBAction)buttonNext:(id)sender;
- (IBAction)duracaoSlider:(id)sender;
- (IBAction)full:(id)sender;

@property (weak, nonatomic) IBOutlet UIButton *playHidden;
@property (weak, nonatomic) IBOutlet UIButton *pauseHidden;

@property (weak, nonatomic) IBOutlet UIView *viewGesture;
@property UISwipeGestureRecognizer *swipe;

-(void)passaView:(UISwipeGestureRecognizer *)gesture;

@property (weak, nonatomic) IBOutlet UIView *viewVideo;
@property (strong, nonatomic) MPMoviePlayerController *moviePlayer;
- (IBAction)buttonHome:(id)sender;
@property (weak, nonatomic) IBOutlet UILabel *nomeArq;
-(void)startC;





@end
