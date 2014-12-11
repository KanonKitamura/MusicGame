//
//  ViewController.h
//  MusicGame
//
//  Created by kanon kitamura on 2014/12/09.
//  Copyright (c) 2014年 myname. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>

@interface ViewController : UIViewController

{
    IBOutlet UILabel *timeLabel;
    IBOutlet UILabel *hanteiLabel;
    
    float time;
    NSTimer *timer;
    
    float speed;
    UILabel *label;
    
    AVAudioPlayer *audio;

}

-(IBAction)pushButton;
-(void)up;
-(NSString *)hantei:(float)number;

@end

