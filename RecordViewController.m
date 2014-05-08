//
//  RecordViewController.m
//  MultiPlayer
//
//  Created by Vinicius Resende Fialho on 06/03/14.
//  Copyright (c) 2014 Vinicius Resende Fialho. All rights reserved.
//

#import "RecordViewController.h"
#import "MenuViewController.h"

@interface RecordViewController ()

@end

@implementation RecordViewController

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
    
    NSMutableDictionary *recordSetting = [[NSMutableDictionary alloc]init];
    //AVFormatIDKey==kAudioFormatLinearPCM
    [recordSetting setValue:[NSNumber numberWithInt:kAudioFormatMPEG4AAC] forKey:AVFormatIDKey];
    //AVSampleRateKey==8000/44100/96000
    [recordSetting setValue:[NSNumber numberWithFloat:44100] forKey:AVSampleRateKey];
    //canal 1 = mono - canal 2 = stereo
    [recordSetting setValue:[NSNumber numberWithInt:2] forKey:AVNumberOfChannelsKey];
    //quality
    [recordSetting setValue:[NSNumber numberWithInt:AVAudioQualityHigh] forKey:AVEncoderAudioQualityKey];
    
    NSURL *url = [NSURL fileURLWithPath:[NSTemporaryDirectory() stringByAppendingPathComponent:@"VoiceFile"]];
    
    //    NSString *strUrl = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject];
    //    NSURL *url = [NSURL fileURLWithPath:[NSString stringWithFormat:@"%@/lll.aac", strUrl]];
    
    urlPlay = url;
    recorder = [[AVAudioRecorder alloc] initWithURL:url settings:recordSetting error:nil];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)stopRecord:(id)sender {
    [[self timeAnimation] invalidate];
    
    
    [recorder stop];
    self.hiddenStop.hidden = YES;
    self.hiddenPlay.hidden = NO;
}

- (IBAction)playRecord:(id)sender {
    self.timeAnimation = [NSTimer scheduledTimerWithTimeInterval:1.0
                                                          target:self
                                                        selector:@selector(startThread)
                                                        userInfo:nil
                                                         repeats:YES];
    
    [recorder prepareToRecord];
    [recorder record];
    self.hiddenStop.hidden = NO;
    self.hiddenPlay.hidden = YES;
    
    
}

- (IBAction)homeRecord:(id)sender {
    MenuViewController *list = [[MenuViewController alloc]init];
    [self presentViewController:list animated:UIModalPresentationCurrentContext completion:nil];
    [self stopRecord:0];
}

- (IBAction)playAudio:(id)sender {
    player = [[AVAudioPlayer alloc]initWithContentsOfURL:urlPlay error:nil];
    [player play];
}

-(void)startThread {
    self.fadein.animationImages = [NSArray arrayWithObjects:[UIImage imageNamed:@"fonein.png"],[UIImage imageNamed:@"foneiout.png"], nil];
    self.fadein.animationDuration = 1.0f;
    self.fadein.animationRepeatCount = 1;
    [[self fadein] startAnimating];
    
}

- (BOOL)shouldAutorotate
{
    return NO;
}



@end




