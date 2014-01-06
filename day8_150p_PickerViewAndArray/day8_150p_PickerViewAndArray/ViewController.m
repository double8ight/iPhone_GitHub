//
//  ViewController.m
//  day8_150p_PickerViewAndArray
//
//  Created by SDT-1 on 2014. 1. 6..
//  Copyright (c) 2014년 SDT-1. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UIPickerViewDelegate, UIPickerViewDataSource>
{
    NSArray *data;
}
@property (weak, nonatomic) IBOutlet UILabel *label;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    data = [[NSArray alloc] initWithObjects:@"Item1", @"Item2", @"Item3", @"Item4", @"Item5", nil];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 2;
    
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    if(component == 0)
        return 10;
    else
        return [data count];
}


// 각 컴포넌트와 로우인덱스에 해당하는 문자열 항목 반환
- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    if(component == 0)
    {
        return [NSString stringWithFormat:@"Row : %d", row];
    }
    else
        return [data objectAtIndex:row];
}

// 사용자 선택시
- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    NSString *item = [self pickerView:pickerView titleForRow:row forComponent:component];
    self.label.text = [NSString stringWithFormat:@"컴포넌트 %d 로우 %d, 항목 : %@", component, row, item];
    
}

@end
