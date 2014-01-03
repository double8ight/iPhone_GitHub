//
//  ViewController.m
//  day7_colorTest
//
//  Created by SDT-1 on 2014. 1. 3..
//  Copyright (c) 2014년 SDT-1. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UISlider *redSlider;
@property (weak, nonatomic) IBOutlet UISlider *greenSlider;
@property (weak, nonatomic) IBOutlet UISlider *blueSlider;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *activityIndicator;
@property (weak, nonatomic) IBOutlet UIView *colorView;
- (IBAction)powerOnOff:(id)sender;
- (IBAction)onColorSliderChanged:(id)sender;

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

- (void)viewWillAppear:(BOOL)animated
{
    [self onColorSliderChanged:nil];
}

- (IBAction)powerOnOff:(id)sender {
    BOOL isOn = ((UISwitch *)sender).on;
    
    self.redSlider.enabled = isOn;
    self.greenSlider.enabled = isOn;
    self.blueSlider.enabled = isOn;
    
    if(isOn)
    {
        //액티비티 인디케이터 시작
        [self.activityIndicator startAnimating];
        
        // 1초 뒤에 현재 색상으로 변경
        [self performSelector:@selector(onColorSliderChanged:) withObject:nil afterDelay:1.0];
        
    }
    else
    {
        self.colorView.backgroundColor = [UIColor grayColor];
    }
    
}

- (IBAction)onColorSliderChanged:(id)sender {
    
    if([self.activityIndicator isAnimating])
    {
        [self.activityIndicator stopAnimating];
    }
    self.colorView.backgroundColor = [UIColor colorWithRed:self.redSlider.value green:self.greenSlider.value blue:self.blueSlider.value alpha:1.0];
    
    
}
@end
