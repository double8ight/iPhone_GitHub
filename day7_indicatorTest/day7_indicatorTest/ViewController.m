//
//  ViewController.m
//  day7_indicatorTest
//
//  Created by SDT-1 on 2014. 1. 3..
//  Copyright (c) 2014년 SDT-1. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *indicator1;

@property (strong, nonatomic) UIActivityIndicatorView *indicator2;

@end


@implementation ViewController
- (IBAction)startIndicator:(id)sender {
    [self.indicator1 startAnimating];
    
    [self.indicator2 performSelector:@selector(startAnimating) withObject:nil afterDelay:0.3];
}
- (IBAction)stopIndicator:(id)sender {
    [self.indicator1 stopAnimating];
    
    [self.indicator2 performSelector:@selector(stopAnimating) withObject:nil afterDelay:0.7];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    self.indicator2 = [[UIActivityIndicatorView alloc]initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
    self.indicator2.hidesWhenStopped = YES;
    self.indicator2.center = CGPointMake(160, 200);
    [self.view addSubview:self.indicator2];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
