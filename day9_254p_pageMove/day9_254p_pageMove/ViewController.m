//
//  ViewController.m
//  day9_254p_pageMove
//
//  Created by SDT-1 on 2014. 1. 8..
//  Copyright (c) 2014년 SDT-1. All rights reserved.
//

#import "ViewController.h"
#define IMAGE_NUM 4

@interface ViewController ()
{
    UIScrollView *scrollView;
    UIPageControl *pageControl;
    int loadedPageCount;
}

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    scrollView = [[UIScrollView alloc]initWithFrame:self.view.bounds];
    [self.view addSubview:scrollView];
    
    // 스크롤 뷰의 크기를 구함
    float width = scrollView.bounds.size.width;
    float height = scrollView.bounds.size.height;
    
    scrollView.delegate = self;
    scrollView.pagingEnabled = YES;
    scrollView.contentSize = CGSizeMake(width*IMAGE_NUM, height);
    
    
    pageControl = [[UIPageControl alloc]initWithFrame:CGRectMake(130, 400, 60, 40)];
    [self.view addSubview:pageControl];
    pageControl.numberOfPages = IMAGE_NUM;
    
    // 초기값 설정
    loadedPageCount = 0;
    [self loadContentsPages:0];
    [self loadContentsPages:1];
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


// 인자로 넘어온 페이지를 로딩
-(void)loadContentsPages:(int)pageNo
{
    // 이미 로딩한 페이지인지, 한계를 넘었는지를 체크
    if(pageNo < 0 || pageNo < loadedPageCount || pageNo >= IMAGE_NUM)
        return;
    
    float width = scrollView.frame.size.width;
    float height = scrollView.frame.size.height;
    
    NSString *fileName = [NSString stringWithFormat:@"image%d", pageNo+1];
    NSString *filePath = [[NSBundle mainBundle]pathForResource:fileName ofType:@"jpg"];
    UIImage *image = [UIImage imageWithContentsOfFile:filePath];
    UIImageView *imageView = [[UIImageView alloc]initWithImage:image];
    imageView.frame = CGRectMake(width*pageNo, 0, width, height);
    
    [scrollView addSubview:imageView];
    loadedPageCount++;
    
    
}

// 스크롤이 끝나면 새로운 페이지 로딩
-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView1
{
    //페이지 인덱스 계산
    float width = scrollView1.frame.size.width;
    float offsetX = scrollView1.contentOffset.x;
    int pageNo = floor(offsetX / width);
    pageControl.currentPage = pageNo;
    
    // 전, 후페이지 까지 함께 로딩
    [self loadContentsPages:pageNo-1];
    [self loadContentsPages:pageNo];
    [self loadContentsPages:pageNo+1];
    
    
}

@end
