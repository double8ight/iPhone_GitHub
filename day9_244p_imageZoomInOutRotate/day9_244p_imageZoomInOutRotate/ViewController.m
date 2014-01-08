//
//  ViewController.m
//  day9_244p_imageZoomInOutRotate
//
//  Created by SDT-1 on 2014. 1. 8..
//  Copyright (c) 2014년 SDT-1. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *ballImage;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    //코드로 사용할 때
    UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc]initWithTarget:self action:@selector(handlePan:)];
    [self.ballImage addGestureRecognizer:pan];
    
    UIPanGestureRecognizer *pinch = [[UIPanGestureRecognizer alloc]initWithTarget:self action:@selector(handlePinch:)];
    [self.ballImage addGestureRecognizer:pinch];
    
    UIPanGestureRecognizer *rotate = [[UIPanGestureRecognizer alloc]initWithTarget:self action:@selector(handleRotate:)];
    [self.ballImage addGestureRecognizer:rotate];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)handlePan:(UIPanGestureRecognizer *)gesture {
    CGPoint point = [gesture locationInView:self.view];
    self.ballImage.center = point;
}

- (IBAction)handleRotate:(UIRotationGestureRecognizer *)gesture {
    self.ballImage.transform = CGAffineTransformRotate(self.ballImage.transform, gesture.rotation);
    // 연속된 값으로 반환되므로 0으로 초기화
    [gesture setRotation:0.0];
    
}
- (IBAction)handlePinch:(UIPinchGestureRecognizer *)gesture  {
    CGFloat scale = gesture.scale;
    self.ballImage.transform = CGAffineTransformScale(self.ballImage.transform, scale, scale);
    
    // 연속된 값으로 반환되므로 1로 초기화
    [gesture setScale:1.0];
}

@end
