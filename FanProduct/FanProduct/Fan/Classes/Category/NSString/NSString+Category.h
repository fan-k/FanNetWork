//
//  NSString+Category.h
//  Baletu
//
//  Created by fangkangpeng on 2018/12/17.
//  Copyright © 2018 Fan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (Category)


/**
 判断字符数非空

 @return yes/no
 */
- (BOOL)isNotBlank;

/**
 json字符串转字典

 @return NSDictionary
 */
- (NSDictionary *)toDict;


/**
 URL链接 转化为字典参数

 @return 字典
 */
- (NSDictionary *)urlToParamDict;
/**
 比较俩字符串

 @param string
 */
- (BOOL)equal:(NSString *)string;
@end


@interface NSMutableAttributedString (Category)

/**
 改变指定文本的字体大小颜色样式

 @param color color
 @param font font
 @param text text
 */
- (void)changeStringStyleWithText:(NSString *)text Color:(UIColor *)color font:(UIFont *)font;
@end
