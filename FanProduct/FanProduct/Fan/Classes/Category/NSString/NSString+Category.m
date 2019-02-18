//
//  NSString+Category.m
//  Baletu
//
//  Created by fangkangpeng on 2018/12/17.
//  Copyright © 2018 Fan. All rights reserved.
//

#import "NSString+Category.h"
#import <objc/runtime.h>



@implementation NSString (Category)
+ (void)load{
    [super load];
    method_exchangeImplementations(class_getInstanceMethod([self class], @selector(substringToIndex:)), class_getInstanceMethod([self class], @selector(blt_substringToIndex:)));
    method_exchangeImplementations(class_getInstanceMethod([self class], @selector(substringFromIndex:)), class_getInstanceMethod([self class], @selector(blt_substringFromIndex:)));
    
    Method originalMethod = class_getInstanceMethod(object_getClass((id)self), @selector(stringWithFormat:));
    Method swizzledMethod = class_getInstanceMethod(object_getClass((id)self), @selector(blt_stringWithFormat:));
    if (class_addMethod(object_getClass((id)self),  @selector(stringWithFormat:), method_getImplementation(swizzledMethod), method_getTypeEncoding(swizzledMethod))) {
        class_replaceMethod(object_getClass((id)self), @selector(blt_stringWithFormat:), method_getImplementation(originalMethod), method_getTypeEncoding(originalMethod));
    } else {
        method_exchangeImplementations(originalMethod, swizzledMethod);
    }

}
- (NSString *)blt_substringFromIndex:(NSUInteger)from{
    if (self.length  < from) {
        from = self.length ;
    }
    return [self blt_substringFromIndex:from];
}
- (NSString *)blt_substringToIndex:(NSUInteger)to{
    if (self.length  < to) {
        to = self.length ;
    }
    return [self blt_substringToIndex:to];
}
/**排除因为%@出现的(null)*/
+ (instancetype)blt_stringWithFormat:(NSString *)format, ...{
    va_list ap;
    va_start(ap, format);
    NSString * string =  [[self alloc] initWithFormat:format arguments:ap];
    va_end(ap);
    if (string.length) {
        string = [string stringByReplacingOccurrencesOfString:@"(null)" withString:@""];
        string = [string stringByReplacingOccurrencesOfString:@"<null>" withString:@""];
    }
    return string;
}
- (NSDictionary *)toDict{
    NSData *data = [self dataUsingEncoding:NSUTF8StringEncoding];
    NSError *error;
    id dict = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:&error];
    return dict;;
}
- (BOOL)isNotBlank {
    NSCharacterSet *blank = [NSCharacterSet whitespaceAndNewlineCharacterSet];
    for (NSInteger i = 0; i < self.length; ++i) {
        unichar c = [self characterAtIndex:i];
        if (![blank characterIsMember:c]) {
            return YES;
        }
    }
    return NO;
}
- (NSMutableDictionary *)urlToParamDict{
    
    //获取问号的位置，问号后是参数列表
    NSRange range = [self rangeOfString:@"?"];
    if(range.length == 0){
        return nil;
    }
    NSLog(@"参数列表开始的位置：%d", (int)range.location);
    
    //获取参数列表
    NSString *propertys = [self substringFromIndex:(int)(range.location+1)];
    NSLog(@"截取的参数列表：%@", propertys);
    
    //进行字符串的拆分，通过&来拆分，把每个参数分开
    NSArray *subArray = [propertys componentsSeparatedByString:@"&"];
    NSLog(@"把每个参数列表进行拆分，返回为数组：\n%@", subArray);
    
    //把subArray转换为字典
    //tempDic中存放一个URL中转换的键值对
    NSMutableDictionary *tempDic = [NSMutableDictionary dictionaryWithCapacity:4];
    
    for (int j = 0 ; j < subArray.count; j++){
        //在通过=拆分键和值
        if([subArray[j] rangeOfString:@"="].length != 0){
            NSArray *dicArray = [subArray[j] componentsSeparatedByString:@"="];
            NSLog(@"再把每个参数通过=号进行拆分：\n%@", dicArray);
            //给字典加入元素
            [tempDic setObject:dicArray[1] forKey:dicArray[0]];
        }
    }
    NSLog(@"打印参数列表生成的字典：\n%@", tempDic);
    return tempDic;
}
- (BOOL)equal:(NSString *)string{
    if ([self isEqualToString:string]) {
        return YES;
    }return NO;
}
@end


@implementation NSMutableAttributedString (Category)
- (void)changeStringStyleWithText:(NSString *)text Color:(UIColor *)color font:(UIFont *)font{
    NSRegularExpression *regular = [[NSRegularExpression alloc]initWithPattern:text options:NSRegularExpressionCaseInsensitive error:nil];
    NSArray * arr1 = [regular matchesInString:[self string] options:NSMatchingReportProgress range:NSMakeRange(0, self.string.length)];
    NSMutableArray *rangeArr = [NSMutableArray arrayWithCapacity:0];
    NSMutableArray *titleArr = [NSMutableArray arrayWithCapacity:0];
    for (NSTextCheckingResult *result in arr1) {
        if (result.range.location != NSNotFound) {
            [rangeArr insertObject:result atIndex:0];
            NSMutableAttributedString *titleAtt = [[NSMutableAttributedString alloc] initWithString:text];
            [titleAtt addAttributes:@{NSForegroundColorAttributeName:color,NSFontAttributeName:font} range:NSMakeRange(0,titleAtt.length)];
            [titleArr insertObject:titleAtt atIndex:0];
        }
    }
    int i = 0;
    for (NSTextCheckingResult *result in rangeArr) {
        NSMutableAttributedString *attchment = titleArr[i];
        [self replaceCharactersInRange:result.range withAttributedString:attchment];
        i++;
    }

}
@end
