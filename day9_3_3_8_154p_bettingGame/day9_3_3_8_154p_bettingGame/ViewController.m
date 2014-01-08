//
//  ViewController.m
//  day9_3_3_8_154p_bettingGame
//
//  Created by SDT-1 on 2014. 1. 8..
//  Copyright (c) 2014년 SDT-1. All rights reserved.
//

#import "ViewController.h"
#define MAX_NUM 5

@interface ViewController ()
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
