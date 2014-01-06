//
//  ViewController.m
//  day8_140p_countDownAndTimer
//
//  Created by SDT-1 on 2014. 1. 6..
//  Copyright (c) 2014년 SDT-1. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIDatePicker *datePicker;
- (IBAction)toggleTimer:(id)sender;

- (void)startTimer;
- (void)stopTimer;
@end

@implementation ViewController
{
    NSTimer *timer;
    BOOL timerWorking;
    
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)tickDown:(NSTimer *)timer
{
    self.datePicker.countDownDuration = self.datePicker.countDownDuration - 60;
    
    // 1분 이내면 정지
    if(self.datePicker.countDownDuration <= 60)
    {
        NSLog(@"Done!");
        [self stopTimer];
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)startTimer
{
    timer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(tickDown:) userInfo:nil repeats:YES];
}

- (void)stopTimer
{
    [timer invalidate];
    timer = nil;
    timerWorking = NO;
}

- (IBAction)toggleTimer:(id)sender {
    NSString *title = timerWorking ? @"Start" : @"Stop";
    [sender setTitle:title forState:UIControlStateNormal];
    timerWorking = !timerWorking;
    
    if(timerWorking)
        [self startTimer];
    else
        [self stopTimer];
}
@end
