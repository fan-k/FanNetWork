//
//  UILabel+Category.m
//  Baletu
//
//  Created by fangkangpeng on 2018/12/27.
//  Copyright © 2018 Fan. All rights reserved.
//

#import "UILabel+Category.h"

@implementation UILabel (Category)
+ (instancetype)createLabelWithFrame:(CGRect)frame text:(NSString *)text titleColor:(UIColor *)textColor textAlignment:(NSTextAlignment)textAlignment font:(UIFont *)font{
    UILabel *l = [[UILabel alloc]initWithFrame:frame];
    l.text = text;
    l.textColor = textColor;
    l.textAlignment = textAlignment;
    l.font = font;
    return l;
}
@end
