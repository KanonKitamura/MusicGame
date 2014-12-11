//
//  ViewController.m
//  MusicGame
//
//  Created by kanon kitamura on 2014/12/09.
//  Copyright (c) 2014年 myname. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    time = 0.0;/*経過時間*/
    timeLabel.text=[NSString stringWithFormat:@"%.2f",time];
    
    /*timerを再生する。upメソッド,0.01秒に1回呼び出す)*/
    timer = [NSTimer scheduledTimerWithTimeInterval:0.01 target:self selector:@selector(up) userInfo:nil repeats:YES];

    label=[[UILabel alloc] initWithFrame:CGRectMake(0,0,50,50)];
    
    label.text=@"";
    label.font=[UIFont systemFontOfSize:50];
    [self.view addSubview:label];
    [label setBackgroundColor:[UIColor clearColor]];
    
    
    CGRect appFrame =[[UIScreen mainScreen]applicationFrame];
    speed = appFrame.size.height /1.2;
    
    
    NSString *path =[[NSBundle mainBundle]pathForResource:@"風船カーニバル"ofType:@"mp3"];
    NSURL *url=[NSURL fileURLWithPath:path];
    audio =[[AVAudioPlayer alloc]initWithContentsOfURL:url error:nil];
    [audio play];//再生メソッドを呼び出す
    
    
}

-(NSString *)hantei:(float)number
{
    if(time >= number -0.20 && time <= number +0.20){
        return @"PERFECT!!";
    }else if(time >= number -0.25 &&time<=number+0.25){
        return @"GREAT!";
    }else if(time >= number-0.30&&time<=number+0.30){
        return @"GOOD";
    }else {
        return @"BAD";
    
        
    }
}

-(IBAction)pushButton{
    
    hanteiLabel.text = [self hantei:10.0];
}

-(void)up{
    time +=0.01;
    timeLabel.text=[NSString stringWithFormat:@"%.2f",time];
    
    if(10.0-1.2 <=time){
        label.text =@"■";
        float y  =(time-10.0 +1.2)*speed-75;
        label.frame = CGRectMake(175,y,50,50);
     
        
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
