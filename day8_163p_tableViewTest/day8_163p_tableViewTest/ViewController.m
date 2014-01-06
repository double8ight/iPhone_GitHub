//
//  ViewController.m
//  day8_163p_tableViewTest
//
//  Created by SDT-1 on 2014. 1. 6..
//  Copyright (c) 2014년 SDT-1. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UITableViewDataSource>

@end

@implementation ViewController


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 100;
}

#define CELL_ID @"CELL_ID"

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    // 셀 ID가 CELL_ID 인셀객체 생성
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CELL_ID];
    
    // 재사용 가능한 셀이 없는 경우 - 새로운 셀 생성
    if(cell == nil)
    {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CELL_ID];
        
    }
    else
    {
        NSLog(@"셀 재사용!");
    }
    
    cell.textLabel.text = [NSString stringWithFormat:@"Cell %d", indexPath.row];
    
    return cell;
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
