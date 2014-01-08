//
//  ViewController.m
//  day9_249p_imageZoomInOutScroll
//
//  Created by SDT-1 on 2014. 1. 8..
//  Copyright (c) 2014년 SDT-1. All rights reserved.
//

#import "ViewController.h"
#define TAG_CONTENT 99

@interface ViewController ()<UIScrollViewDelegate>

@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
- (IBAction)fitToWidth:(id)sender;
- (IBAction)fitToHeight:(id)sender;
- (IBAction)scaleDouble:(id)sender;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    
    // 화면보다 큰 뷰를 IB에서 다루기 힘들다. 그래서 코드로 작성
    NSString *filePath = [[NSBundle mainBundle]pathForResource:@"wallpaper" ofType:@"jpg"];
    UIImage *image = [UIImage imageWithContentsOfFile:filePath];
    UIImageView *imageView = [[UIImageView alloc]initWithImage:image];
    imageView.tag = TAG_CONTENT;
    
    [self.scrollView addSubview:imageView];
    self.scrollView.delegate = self;
    self.scrollView.contentSize = imageView.frame.size;
    self.scrollView.minimumZoomScale = self.scrollView.frame.size.width / imageView.frame.size.width;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)fitToWidth:(id)sender {
    UIView *contentView = [self.view viewWithTag:TAG_CONTENT];
    float scale = self.scrollView.frame.size.width / contentView.frame.size.width;
    NSLog(@"scale : %f", scale);
    [self.scrollView setZoomScale:scale animated:YES];
}

- (IBAction)fitToHeight:(id)sender {
    UIView *contentView = [self.view viewWithTag:TAG_CONTENT];
    float scale = self.scrollView.frame.size.height / contentView.frame.size.height;
    NSLog(@"scale : %f", scale);
    [self.scrollView setZoomScale:scale animated:YES];
}

- (IBAction)scaleDouble:(id)sender {
    float x = self.scrollView.contentOffset.x;
    float y = self.scrollView.contentOffset.y;
    float w = self.scrollView.frame.size.width / 2;
    float h = self.scrollView.frame.size.height / 2;
    
    CGRect doubleRect = CGRectMake(x, y, w, h);
    
    [self.scrollView zoomToRect:doubleRect animated:YES];
    
}

// 확대/축소 대상의 뷰
-(UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView
{
    return [self.view viewWithTag:TAG_CONTENT];
}

@end
