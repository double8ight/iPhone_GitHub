//
//  ViewController.m
//  day9_261p_webView
//
//  Created by SDT-1 on 2014. 1. 8..
//  Copyright (c) 2014년 SDT-1. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UITextFieldDelegate, UIWebViewDelegate>
@property (weak, nonatomic) IBOutlet UITextField *textField;
@property (weak, nonatomic) IBOutlet UIWebView *webView;

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

-(BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType
{
    if(UIWebViewNavigationTypeLinkClicked == navigationType)
    {
        NSLog(@"링크 클릭은 금지!");
        return NO;
    }
    return YES;
}

//에러처리
-(void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error
{
    NSString *msg = [error localizedDescription];
    UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"에러" message:msg delegate:nil cancelButtonTitle:@"확인" otherButtonTitles:nil, nil];
    [alert show];
}


-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [self go:nil];
    return YES;
}

- (IBAction)go:(id)sender {
    NSString *address = self.textField.text;
    if([address length] > 3)
    {
        if(![address hasPrefix:@"http://"])
        {
            address = [NSString stringWithFormat:@"http://%@",address];
        }
        NSURL *url = [NSURL URLWithString:address];
        NSURLRequest *request = [NSURLRequest requestWithURL:url];
        [self.webView loadRequest:request];
    
        // 키보드 감추기
        [self.textField resignFirstResponder];
    }
}



@end
