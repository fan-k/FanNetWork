//
//  UIViewController+StatusStyle.m
//  Baletu
//
//  Created by fangkangpeng on 2019/1/4.
//  Copyright © 2019 Fan. All rights reserved.
//

#import "UIViewController+StatusStyle.h"
#import <objc/runtime.h>
@implementation UIViewController (StatusStyle)
+ (void)load{
    [super load];
    method_exchangeImplementations(class_getInstanceMethod([self class], @selector(init)), class_getInstanceMethod([self class], @selector(blt_init)));
}
- (instancetype)blt_init{
    [self blt_init];
    //记录状态栏的色值 退出页面时设置状态
    return self;
}

- (void)viewWillDisappear:(BOOL)animated{
    [UIApplication sharedApplication].statusBarStyle = UIStatusBarStyleDefault;
}
@end
