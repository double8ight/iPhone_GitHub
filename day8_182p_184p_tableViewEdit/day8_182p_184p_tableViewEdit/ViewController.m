//
//  ViewController.m
//  day8_182p_184p_tableViewEdit
//
//  Created by SDT-1 on 2014. 1. 6..
//  Copyright (c) 2014년 SDT-1. All rights reserved.
//

#import "ViewController.h"
#define CELL_ID @"CELL_ID"

@interface ViewController ()<UITableViewDelegate, UITableViewDataSource, UIAlertViewDelegate>
{
    NSMutableArray *data;
}
@property (weak, nonatomic) IBOutlet UITableView *table;
- (IBAction)toggleEdit:(id)sender;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    data = [[NSMutableArray alloc]initWithObjects:@"Item1",@"Item2",@"Item3",@"Item4",@"Item5",@"Item6", nil];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(BOOL)alertViewShouldEnableFirstOtherButton:(UIAlertView *)alertView
{
    // 입력문자열 길이가 2보다 클때만 추가가능
    NSString *inputStr = [alertView textFieldAtIndex:0].text;
    return [inputStr length] >2 ;
}

-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    // TODO : 데이터 추가
}


- (IBAction)toggleEdit:(id)sender {
    self.table.editing = !self.table.editing;
}


// 각 스타일을 번갈아가면서 사용
- (UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if(indexPath.row % 3 == 0)
    {
        return UITableViewCellEditingStyleNone;
    }
    else if(indexPath.row % 3 == 1)
    {
        return UITableViewCellEditingStyleInsert;
    }
    else
    {
        return UITableViewCellEditingStyleDelete;
    }
}

// 삭제/추가작업 - 로그로 확인
-(void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if(UITableViewCellEditingStyleDelete == editingStyle)
    {
        NSLog(@"%d 번째 삭제", indexPath.row);
        [data removeObjectAtIndex:indexPath.row];
        
        // 테이블 셀 삭제
        NSArray *rowList = [NSArray arrayWithObject:indexPath];
        [tableView deleteRowsAtIndexPaths:rowList withRowAnimation:UITableViewRowAnimationAutomatic];
    }
    else
    {
        NSLog(@"%d 번째 추가", indexPath.row);
        
        UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"추가" message:nil delegate:self cancelButtonTitle:@"취소" otherButtonTitles:@"확인", nil];
        alert.alertViewStyle = UIAlertViewStylePlainTextInput;
        [alert show];
    }

}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [data count];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    //Dynamic Prototypes 방식 사용
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CELL_ID"];
    cell.textLabel.text = data[indexPath.row];
    
    return cell;
}

@end
