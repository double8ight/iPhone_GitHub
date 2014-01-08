//
//  ViewController.m
//  day9_201p_sectionDivision
//
//  Created by SDT-1 on 2014. 1. 8..
//  Copyright (c) 2014년 SDT-1. All rights reserved.
//

#import "ViewController.h"
#import "ProductCell.h"
#import "Product.h"
#import "CartDelegate.h"

@interface ViewController () <UITableViewDataSource, UITableViewDelegate, CartDelegate>
{
    NSArray *data;
    NSMutableArray *cart;
}
@property (weak, nonatomic) IBOutlet UITableView *table;

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
    
    cart = [[NSMutableArray alloc]init];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)addItem:(id)sender
{
    // 제품찾기 - 셀객체로 IndexPath 얻기
    UITableViewCell *cell = (UITableViewCell *)sender;
    
    // +버튼이 눌린 셀이 cell 이다
    // cell.indexPath 속성이 없기때문이다.
    // 따라서 어떤 셀의 indexPath를 얻고 싶으면
    // 반드시 테이블 뷰로부터 질의해야 한다.
    NSIndexPath *indexPath = [self.table indexPathForCell:cell];
    Product *item = data[indexPath.row];
    
    // 카트에 상품 추가
    [cart addObject:item];
    
    // 테이블 카트 섹션 리로드
    NSIndexSet *indexSet = [NSIndexSet indexSetWithIndex:1];
    [self.table reloadSections:indexSet withRowAnimation:UITableViewRowAnimationAutomatic];
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    
    return 2;
    
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if(section == 0)
        return [data count];
    else
        return [cart count];
    
}

-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    return (section == 0) ? @"상품목록" : @"카트";
}


-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if(indexPath.section == 0)
    {
        ProductCell *cell = [tableView dequeueReusableCellWithIdentifier:@"PRODUCT_CELL" forIndexPath:indexPath];
        
        // 셀 내용 갱신
        Product *item = data[indexPath.row];
        [cell setProductInfo:item];
        
        // 뷰컨트롤러가 셀의 델리게이트 역할을 수행한다.
        cell.delegate = self;
        
        return cell;
    }
    else
    {
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CART_CELL" forIndexPath:indexPath];
        
        Product *item = cart[indexPath.row];
        cell.textLabel.text = item.name;
        return cell;
    
    }
}





@end
