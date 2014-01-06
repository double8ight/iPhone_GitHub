//
//  ViewController.m
//  day8_keyboardNotificationTest
//
//  Created by SDT-1 on 2014. 1. 6..
//  Copyright (c) 2014년 SDT-1. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () <UITextFieldDelegate>

@end

@implementation ViewController
{
    int dy;
}

- (UITextField *)firstResponderTextField
{
    for(id child in self.view.subviews)
    {
        if([child isKindOfClass:[UITextField class]])
        {
            UITextField *textField = (UITextField *)child;
            if(textField.isFirstResponder)
            {
                return textField;
                
            }
        }
    }
    
    return nil;
}
- (IBAction)dismissKeyboard:(id)sender {
    [[self firstResponderTextField]resignFirstResponder];
}



- (void)keyboardWillShow:(NSNotification *)noti
{
    NSLog(@"keyboardWillShow, noti : %@", noti);
    
    UITextField *firstResponder = (UITextField *)[self firstResponderTextField];
    
    int y = firstResponder.frame.origin.y + firstResponder.frame.size.height + 5;
    int viewHeight = self.view.frame.size.height;
    
    NSDictionary *userInfo = [noti userInfo];
    
    CGRect rect = [[userInfo objectForKey:UIKeyboardFrameBeginUserInfoKey]CGRectValue];
    int keyboardHeight = (int)rect.size.height;
    
    float animationDuration = [[userInfo objectForKey:UIKeyboardAnimationDurationUserInfoKey]floatValue];
    
    // 키보드가 텍스트필드를 가리는 경우
    if(keyboardHeight > (viewHeight - y))
    {
        NSLog(@"키보드가 가림");
        [UIView animateWithDuration:animationDuration animations:^{
            dy = keyboardHeight - (viewHeight -y);
            self.view.center = CGPointMake(self.view.center.x , self.view.center.y - dy);
    
        
        }];
    }
    else
    {
        NSLog(@"키보드가 가리지 않음");
        dy = 0;
        
    }
}

-(void) keyboardWillHide:(NSNotification *)noti
{
    NSLog(@"keyboardWillHide");
    
    if(dy>0)
    {
        float animationDuration = [[[noti userInfo]objectForKey:UIKeyboardAnimationDurationUserInfoKey]floatValue];
            [UIView animateWithDuration:animationDuration animations:^{
            self.view.center = CGPointMake(self.view.center.x, self.view.center.y + dy);
        }];
    }
}



- (void)viewDidAppear:(BOOL)animated
{
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(keyboardWillShow:) name:UIKeyboardWillShowNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillHide:) name:UIKeyboardWillHideNotification object:nil];
}

- (void)viewWillDisappear:(BOOL)animated
{
    [[NSNotificationCenter defaultCenter]removeObserver:self];
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
