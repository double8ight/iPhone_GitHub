//
//  ViewController.m
//  day8_3_2_2_ActionSheet
//
//  Created by SDT-1 on 2014. 1. 6..
//  Copyright (c) 2014년 SDT-1. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UIActionSheetDelegate>

@end

@implementation ViewController
{
    UIActionSheet *sheet2;
    int count;
}

// Actionsheet에서 선택한 결과, 인덱스 출력
- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{
    NSLog(@"selected index: %d", buttonIndex);
}

// Actionsheet가 나타나기 전에
-(void)willPresentActionSheet:(UIActionSheet *)actionSheet
{
    if(actionSheet.tag == 2)
    {
        //count를 이용해서 제목을 변경해준다.
        NSString *title = [NSString stringWithFormat:@"%d번째", count++];
        actionSheet.title = title;
    }
    
}
- (IBAction)howBasicActionSheet:(id)sender {
    UIActionSheet *sheet = [[UIActionSheet alloc]initWithTitle:@"제목" delegate:self cancelButtonTitle:@"취소" destructiveButtonTitle:@"중요" otherButtonTitles:@"확인1", @"확인2", nil];
    
    sheet.tag = 1;
    [sheet showInView:self.view];
    
}


- (IBAction)showActionSheetWithCount:(id)sender {
    if(sheet2 == nil)
    {
        sheet2 = [[UIActionSheet alloc]initWithTitle:@"제목" delegate:self cancelButtonTitle:@"취소" destructiveButtonTitle:nil otherButtonTitles:@"선택2",@"선택2", nil];
        
        sheet2.tag = 2;
    }
    
    [sheet2 showInView:self.view];
}




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

@end
