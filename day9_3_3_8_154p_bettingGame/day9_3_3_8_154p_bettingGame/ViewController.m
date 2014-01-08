//
//  ViewController.m
//  day9_3_3_8_154p_bettingGame
//
//  Created by SDT-1 on 2014. 1. 8..
//  Copyright (c) 2014년 SDT-1. All rights reserved.
//

#import "ViewController.h"
#define MAX_NUM 5

@interface ViewController () <UITextFieldDelegate>
{
    UIActionSheet *sheet;
    float height;
}
@property (weak, nonatomic) IBOutlet UIPickerView *picker1;
@property (weak, nonatomic) IBOutlet UIPickerView *picker2;
@property (weak, nonatomic) IBOutlet UIPickerView *picker3;
- (IBAction)selectRandom:(id)sender;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    // 이 프로젝트는 생략
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)selectRandom:(id)sender {
    int r1 = arc4random() % MAX_NUM;
    [self.picker1 selectRow:r1 inComponent:0 animated:YES];
    
    int r2 = arc4random() % MAX_NUM;
    [self.picker1 selectRow:r2 inComponent:1 animated:YES];

    
    int r3 = arc4random() % MAX_NUM;
    [self.picker1 selectRow:r3 inComponent:2 animated:YES];
    
    
    
    
    
    CGSize viewSize = self.view.bounds.size;
    
    if(sheet == nil)
    {
        //액션시트 생성
        sheet = [[UIActionSheet alloc]init];
        
        //툴바와 Done 버튼
        UIToolbar *toolbar = [[UIToolbar alloc]initWithFrame:CGRectMake(0, 0, viewSize.width, 44)];
        
        UIBarButtonItem *done = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self action:@selector(handleDone:)];
        
        NSArray *items = [NSArray arrayWithObject:done];
        [toolbar setItems:items];
        
        UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(20, 50, 0, 0)];
        label.text = @"배팅금액 입력";
        label.textColor = [ UIColor blackColor];
        label.backgroundColor = [UIColor clearColor];
        [label sizeToFit];
        [sheet addSubview:label];
        
        UITextField *textField = [[UITextField alloc]initWithFrame:CGRectMake(130, 50, 171, 31)];
        
        textField.borderStyle = UITextBorderStyleRoundedRect;
        textField.keyboardType = UIKeyboardTypeNumberPad;
        //textField.delegate = self;
        
        [sheet addSubview:textField];
        
        
        
        
        // 시트에 추가
        [sheet addSubview:toolbar];
        
        //시트 나타나기
        [sheet showInView:self.view];
        
        
        // 액션시트크기와 위치계산용
        height = toolbar.frame.size.height + textField.frame.size.height + 250;
        
        
    }
    
    
    [sheet showInView:self.view];
    sheet.frame = CGRectMake(0, viewSize.height - height, viewSize.width, height);

}

- (void)handleDone:(id)sender
{
    [sheet dismissWithClickedButtonIndex:0 animated:YES];

}

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 3;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    return MAX_NUM;
    
}

- (CGFloat) pickerView:(UIPickerView *)pickerView rowHeightForComponent:(NSInteger)component
{
    return 64;
}

- (UIView *)pickerView:(UIPickerView *)pickerView viewForRow:(NSInteger)row forComponent:(NSInteger)component reusingView:(UIView *)view
{
    NSString *imagePath = [NSString stringWithFormat:@"fm0%d.jpg", row + 1];
    UIImage *image = [UIImage imageNamed:imagePath];
    UIImageView *imageView;
    
    if(view == nil)
    {
        imageView = [[UIImageView alloc]initWithImage:image];
        imageView.frame = CGRectMake(0, 0, 100, 60);
        
    }
    else
    {
        imageView = (UIImageView *)view;
        imageView.image = image;
    }
    
    return imageView;
}

@end
