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
//    UIImage *image = [UIImage imageNamed:@"111.png"];
//    NSData *imageData = UIImagePNGRepresentation(image);
//    self.params[@"pics"] = @[imageData];
//    self.params[@"activityId"] = @"100001";
//    self.params[@"status"] = @"0";
//    self.params[@"retrievePrizeWay"] = @"0";
//    self.params[@"thirdUserId"] = @"123456789";
//    self.params[@"qq"] = @"99282992";
//    self.params[@"email"] = @"xy@sina.com";
//    self.params[@"prizeId"] = @"22221";
//    self.params[@"actId"] = @"100001";
//    self.params[@"phone"] = @"13849391823";
//
//    self.params[@"item-method"] = @"POST";
//    self.params[@"contentType"] = @"application/json";
//    [self requestWithUrl:@"http://47.104.198.112:8200/acti/prize/way/add" loading:YES];
    
    self.params[@"id"] = @"1";
    self.params[@"status"] = @"0";

    
    self.params[@"item-method"] = @"PUT";
//    self.params[@"contentType"] = @"application/json";
    [self requestWithUrl:@"http://47.104.198.112:8200/acti/prize/way/edit" loading:YES];
    
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
