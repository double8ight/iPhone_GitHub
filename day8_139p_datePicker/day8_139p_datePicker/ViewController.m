//
//  ViewController.m
//  day8_139p_datePicker
//
//  Created by SDT-1 on 2014. 1. 6..
//  Copyright (c) 2014년 SDT-1. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITextField *yearField;
@property (weak, nonatomic) IBOutlet UITextField *monthField;
@property (weak, nonatomic) IBOutlet UITextField *dayField;
@property (weak, nonatomic) IBOutlet UIDatePicker *datePicker;
- (IBAction)pickerChanged:(id)sender;

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

- (IBAction)pickerChanged:(id)sender {
    NSLog(@"picker Changed");
    NSDate *selectedDate = self.datePicker.date;
    
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSInteger flag = NSYearCalendarUnit|NSMonthCalendarUnit|NSDayCalendarUnit;
    NSDateComponents *comp = [calendar components:flag fromDate:selectedDate];
    
    self.yearField.text = [NSString stringWithFormat:@"%d", [comp year]];
    self.monthField.text = [NSString stringWithFormat:@"%d", [comp month]];
    self.dayField.text = [NSString stringWithFormat:@"%d", [comp day]];
    
}
@end
