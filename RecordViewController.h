//
//  RecordViewController.h
//  MultiPlayer
//
//  Created by Vinicius Resende Fialho on 06/03/14.
//  Copyright (c) 2014 Vinicius Resende Fialho. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AudioToolbox/AudioToolbox.h>
#import <AVFoundation/AVFoundation.h>

@interface RecordViewController : UIViewController {
    AVAudioRecorder *recorder;
    NSURL *urlPlay;
    AVAudioPlayer *player;
}

- (IBAction)stopRecord:(id)sender;
- (IBAction)playRecord:(id)sender;
- (IBAction)homeRecord:(id)sender;
- (IBAction)playAudio:(id)sender;

@property (weak, nonatomic) IBOutlet UIButton *hiddenPlay;
@property (weak, nonatomic) IBOutlet UIButton *hiddenStop;

@property (weak, nonatomic) IBOutlet UIImageView *fadein;


@property NSTimer *timeAnimation;
-(void)startThread;

@end
