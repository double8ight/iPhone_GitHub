//
//  ViewController.m
//  day8_3_4_13_tableViewCellMove
//
//  Created by SDT-1 on 2014. 1. 6..
//  Copyright (c) 2014년 SDT-1. All rights reserved.
//

#import "ViewController.h"
#define CELL_ID @"CELL_ID"

@interface ViewController ()<UITextFieldDelegate, UITableViewDataSource, UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *table;
@property (weak, nonatomic) IBOutlet UITextField *userInput;
- (IBAction)addItem:(id)sender;
@property (weak, nonatomic) IBOutlet UIButton *toggleEditMode;
- (IBAction)toggleEditMode:(id)sender;
@property (weak, nonatomic) IBOutlet UIButton *editButton;

@end

@implementation ViewController
{
    NSMutableArray *data;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    data = [[NSMutableArray alloc]init];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [data count];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    //Dynamic Prototypes 방식 사용
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CELL_ID"];
    cell.textLabel.text = [data objectAtIndex:indexPath.row];
    
    return cell;
}

-(void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if(editingStyle == UITableViewCellEditingStyleDelete)
    {
        [data removeObjectAtIndex:indexPath.row];
        
        // 테이블 셀 삭제해서 데이터와 동기화
        NSArray *rowList = [NSArray arrayWithObject:indexPath];
        [tableView deleteRowsAtIndexPaths:rowList withRowAnimation:UITableViewRowAnimationAutomatic];
    }
}

-(BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    return YES;
}

// 셀 이동, Non-ARC 환경에서는 리테인 카운트 주의
-(void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)sourceIndexPath toIndexPath:(NSIndexPath *)destinationIndexPath
{
    NSObject *obj = [data objectAtIndex:sourceIndexPath.row];
    [data removeObjectAtIndex:sourceIndexPath.row];
    [data insertObject:obj atIndex:destinationIndexPath.row];
    
}



- (IBAction)addItem:(id)sender {
    NSString *inputStr = self.userInput.text;
    
    if([inputStr length] > 0)
    {
        //데이터 추가
        [data addObject:inputStr];
        
        // 테이블에 셀 추가
        NSIndexPath *indexPath = [NSIndexPath indexPathForRow:([data count]-1) inSection:0];
        NSArray *row = [NSArray arrayWithObject:indexPath];
        [self.table insertRowsAtIndexPaths:row withRowAnimation:UITableViewRowAnimationAutomatic];
        
        
        // 텍스트필드 초기화
        self.userInput.text = @"";
    }
    
}
- (IBAction)toggleEditMode:(id)sender {
    self.table.editing = !self.table.editing;
    self.editButton.titleLabel.text = self.table.editing ? @"Done" : @"Edit";
    [self.view addSubview:self.editButton];
}
@end
