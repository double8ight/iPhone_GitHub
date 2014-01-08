//
//  ViewController.m
//  day9_225p_viewProperty
//
//  Created by SDT-1 on 2014. 1. 8..
//  Copyright (c) 2014년 SDT-1. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
{
    BOOL moveFlag;
}
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
- (IBAction)series:(id)sender;
- (IBAction)alpha:(id)sender;
- (IBAction)move:(id)sender;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)series:(id)sender {
    [UIView beginAnimations:@"series1" context:NULL];
    [UIView setAnimationDelegate:self];
    [UIView setAnimationDuration:1.0];
    
    // 델리게이트
    [UIView setAnimationDelegate:self];
    [UIView setAnimationDidStopSelector:@selector(changeBackgroundClear)];
    self.imageView.backgroundColor = [UIColor whiteColor];
    
    [UIView commitAnimations];
    
    
    //블록을 이용한 코드
    //일단 안침
    
    
    
}

-(void)changeBackgroundClear
{
    [UIView beginAnimations:@"series2" context:NULL];
    [UIView setAnimationDelegate:self];
    [UIView setAnimationDuration:1.0];
    
    self.imageView.backgroundColor = [UIColor clearColor];
    
    [UIView commitAnimations];
}



// 토글 방식으로 투명도 애니메이션
- (IBAction)alpha:(id)sender {
    
    // 이번엔 블록 프로그래밍
    [UIView animateWithDuration:0.7 animations:^{
        self.imageView.alpha = (self.imageView.alpha == 0.0) ? 1.0 : 0.0;
    }];
    
}

- (IBAction)move:(id)sender {
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:0.7];
    
    
    if(moveFlag)
        self.imageView.center = CGPointMake(self.imageView.center.x + 100, self.imageView.center.y + 100);
    else
        self.imageView.center = CGPointMake(self.imageView.center.x - 100, self.imageView.center.y - 100);
    
    moveFlag = !moveFlag;
    
    [UIView commitAnimations];
    
    
    // 블록을 이용한 코드 생략
        
    
}
@end
