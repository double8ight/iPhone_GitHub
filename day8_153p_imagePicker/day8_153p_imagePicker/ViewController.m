//
//  ViewController.m
//  day8_153p_imagePicker
//
//  Created by SDT-1 on 2014. 1. 6..
//  Copyright (c) 2014년 SDT-1. All rights reserved.
//

#import "ViewController.h"
#define MAX_NUM 5

@interface ViewController ()<UIPickerViewDataSource, UIPickerViewDelegate>
@property (weak, nonatomic) IBOutlet UIPickerView *picker;
- (IBAction)selectRandom:(id)sender;

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

- (IBAction)selectRandom:(id)sender {
    int r = arc4random() % MAX_NUM;
    [self.picker selectRow:r inComponent:0 animated:YES];
    
}

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 1;
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
    NSString *imagePath = [NSString stringWithFormat:@"fm0%d.jpg", row];
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
