//
//  ProductCell.m
//  day9_194p_customCell
//
//  Created by SDT-1 on 2014. 1. 8..
//  Copyright (c) 2014년 SDT-1. All rights reserved.
//

#import "ProductCell.h"

@implementation ProductCell

// 제품 정보를 셀로 반영
-(void)setProductInfo:(Product *)item
{
    // 뷰에 반영
    self.productName.text = item.name;
    self.productPrice.text = item.price;
    self.productImage.image = [UIImage imageNamed:item.imageName];
}

@end
