//
//  ViewController.m
//  day9_194p_customCell
//
//  Created by SDT-1 on 2014. 1. 8..
//  Copyright (c) 2014년 SDT-1. All rights reserved.
//

#import "ViewController.h"
#import "Product.h"
#import "ProductCell.h"

@interface ViewController ()<UITableViewDelegate, UITableViewDataSource>
{
    NSArray *data;
}

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    
    // 제품목록
    data = @[[Product product:@"BaseBall" price:@"100" image:@"baseball.jpg"],
             [Product product:@"BasketBall" price:@"200" image:@"basketball.jpg"],
             [Product product:@"FootBall" price:@"250" image:@"football.jpg"],
             [Product product:@"RugbyBall" price:@"300" image:@"rugbyball.jpg"],
             [Product product:@"Wilson" price:@"999" image:@"wilson.jpg"]
             ];
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
    
    // View
    ProductCell *cell = [tableView dequeueReusableCellWithIdentifier:@"PRODUCT_CELL"];
    
    //셀 내용 갱신
    // Model
    Product *item = data[indexPath.row];
    
    // Position
    // [Content Injection 내용 주입]
    [cell setProductInfo:item];
    
    //뷰 컨트롤러가 셀의 델리게이트 역할을 수행한다.
    //cell.delegate = self;
    return cell;
}


@end
