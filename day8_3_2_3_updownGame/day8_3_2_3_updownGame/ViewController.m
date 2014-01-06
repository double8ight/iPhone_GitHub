//
//  ViewController.m
//  day8_3_2_3_updownGame
//
//  Created by SDT-1 on 2014. 1. 6..
//  Copyright (c) 2014년 SDT-1. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () <UITextFieldDelegate, UIAlertViewDelegate>
{
    // interface에서 선언한 변수는 public정도의 수준
    int answer;
    int maximumTrial;
    int trial;
}


@property (weak, nonatomic) IBOutlet UISegmentedControl *gameSelector;
@property (weak, nonatomic) IBOutlet UIProgressView *progress;
@property (weak, nonatomic) IBOutlet UITextField *userInput;
@property (weak, nonatomic) IBOutlet UILabel *countLabel;
@property (weak, nonatomic) IBOutlet UILabel *label;

- (IBAction)checkInput:(id)sender;
- (IBAction)newGame:(id)sender;

@end

@implementation ViewController
// implementation에서 선언한 변수는 private 정도의 수준

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    [self newGame:nil];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



- (void)viewWillAppear:(BOOL)animated
{
    //키보드가 시작하자마자 올라오도록
    self.userInput.keyboardType = UIKeyboardTypeNumberPad;
    [self.userInput becomeFirstResponder];
    
    
}


// 리턴키로 확인 - 숫자키패드라서 테스트용
- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [self checkInput:nil];
    return YES;
}


- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if(alertView.firstOtherButtonIndex == buttonIndex)
    {
        [self newGame:nil];
    }
}

- (IBAction)checkInput:(id)sender {
    int inputVal = [self.userInput.text intValue];
    self.userInput.text = @"";
    
    if(inputVal == answer)
    {
        self.label.text = @"정답입니다.";
        UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"정답" message:@"다시 게임하시겠습니까?" delegate:self cancelButtonTitle:@"취소" otherButtonTitles:@"확인", nil];
        alert.tag = 11;
        [alert show];
        
    }
    else
    {
        trial++;
        if(trial >= maximumTrial)
        {
            NSString *msg = [NSString stringWithFormat:@"답은 %d 입니다.", answer];
            UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"실패" message:msg delegate:self cancelButtonTitle:@"취소" otherButtonTitles:@"확인", nil];
            alert.tag = 12;
            [alert show];
            
        }
        else
        {
            if(inputVal > answer)
            {
                self.label.text = @"Down";
                
            }
            else
                self.label.text = @"Up";
        }
        
        self.countLabel.text = [NSString stringWithFormat:@"%d/%d", trial, maximumTrial];
        
        
        self.progress.progress = trial / (float)maximumTrial;
        
        
    }
    
}

- (IBAction)newGame:(id)sender {
    int selectedGame = self.gameSelector.selectedSegmentIndex;
    int maximumRandom = 0;
    
    if(selectedGame == 0)
    {
        maximumTrial = 5;
        maximumRandom = 10;
    }
    else if(selectedGame == 1)
    {
        maximumTrial = 10;
        maximumRandom = 50;
    }
    else
    {
        maximumTrial = 20;
        maximumRandom = 100;
        
    }
    
    answer = random() % maximumRandom + 1;
    trial = 0;
    self.progress.progress = 0.0;
    self.countLabel.text = @"";
    self.label.text = @"";
    self.userInput.text = @"";
    
    NSLog(@"New Game with answer : %d", answer);
}




@end
