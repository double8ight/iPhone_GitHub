//
//  ViewController.m
//  day9_231p_transformAnimation
//
//  Created by SDT-1 on 2014. 1. 8..
//  Copyright (c) 2014년 SDT-1. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
- (IBAction)setOriginal:(id)sender;
- (IBAction)series:(id)sender;
- (IBAction)combination:(id)sender;
- (IBAction)rotate:(id)sender;


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

- (IBAction)setOriginal:(id)sender {
    [UIView beginAnimations:@"original" context:nil];
    [UIView setAnimationDuration:0.7];
    
    self.imageView.transform = CGAffineTransformIdentity;
    
    [UIView commitAnimations];
    
}

- (IBAction)series:(id)sender {
}

- (IBAction)combination:(id)sender {
    CGAffineTransform t1 = CGAffineTransformMakeScale(1.2, 1.2);
    CGAffineTransform t2 = CGAffineTransformMakeTranslation(30, 30);
    CGAffineTransform comb = CGAffineTransformConcat(t1, t2);
    
    CGAffineTransform t = CGAffineTransformConcat(self.imageView.transform, comb);
    
    [UIView beginAnimations:@"id_move" context:nil];
    [UIView setAnimationDuration:UIViewAnimationCurveEaseIn];
    [UIView setAnimationDuration:0.7];

    
    self.imageView.transform = t;
    
    [UIView commitAnimations];

    
    // 블록방식은 생략
}


- (IBAction)rotate:(id)sender {
    [UIView beginAnimations:@"id_rotate" context:nil];
    [UIView setAnimationDuration:UIViewAnimationCurveEaseIn];
    [UIView setAnimationDuration:0.7];
    
    
    self.imageView.transform = CGAffineTransformRotate(self.imageView.transform, M_PI);
    
    [UIView commitAnimations];
    
    // 블록방식 생략
}
@end
