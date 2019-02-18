//
//  FanRootController.m
//  FanProduct
//
//  Created by 樊康鹏 on 2019/2/18.
//  Copyright © 2019 樊康鹏. All rights reserved.
//

#import "FanRootController.h"

@interface FanRootController ()

@end

@implementation FanRootController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self setNavTitle:@"导航标题"];
    [self setNavLeftButtonItemWithName:@"返回" selectedName:nil];
    // 网络请求
    self.params[@"params"] = @"测试";
    [self requestWithUrl:@"url" loading:YES];
    
    //rootscheme
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [[FanUrlScheme shareInstance] pushViewControllerWithUrl:@"fan://FanRootController" transferData:nil hander:nil];
    });
}

//请求回调方法
- (void)handelFailureRequest:(FanRequestItem *)item{
    //请求失败
}
- (void)handelSuccessRequest:(FanRequestItem *)item{
    //请求成功
    //通过item.url 区分请求
}


@end
