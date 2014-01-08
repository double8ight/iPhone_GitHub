//
//  ProductCell.h
//  day9_194p_customCell
//
//  Created by SDT-1 on 2014. 1. 8..
//  Copyright (c) 2014년 SDT-1. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "Product.h"

@interface ProductCell : UITableViewCell


// custom Cell이다! tableView의 속성에서 class부분을 UITableViewCell -> productCell로 바꿔주어야한다.
@property (weak, nonatomic) IBOutlet UILabel *productName;
@property (weak, nonatomic) IBOutlet UILabel *productPrice;
@property (weak, nonatomic) IBOutlet UIImageView *productImage;

-(void)setProductInfo:(Product *)item;

@end
