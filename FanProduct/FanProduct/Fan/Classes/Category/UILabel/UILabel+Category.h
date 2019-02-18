//
//  UILabel+Category.h
//  Baletu
//
//  Created by fangkangpeng on 2018/12/27.
//  Copyright © 2018 Fan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UILabel (Category)

/**
 创建label

 @param frame frame
 @param text text
 @param textColor textColor
 @param textAlignment textAlignment
 @param font font
 @return label
 */
+ (instancetype)createLabelWithFrame:(CGRect)frame
                                text:(NSString *)text
                          titleColor:(UIColor *)textColor
                       textAlignment:(NSTextAlignment)textAlignment
                                font:(UIFont *)font;
@end
