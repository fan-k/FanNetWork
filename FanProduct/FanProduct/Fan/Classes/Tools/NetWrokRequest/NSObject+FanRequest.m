//
//  NSObject+FanRequest.m
//  Baletu
//
//  Created by fangkangpeng on 2018/12/20.
//  Copyright © 2018 Fan. All rights reserved.
//

#import "NSObject+FanRequest.h"
#import <objc/runtime.h>

static const char *FanRequestParams = "FanRequestParams";
static const char *FanRequestQueue = "FanRequestQueue";
static const char *FanItemQueue = "FanItemQueue";




@implementation NSObject (FanRequest)

#pragma mark -- 网络
- (void)requestWithUrl:(NSString *)url loading:(BOOL)loading{
    FanRequestItem *item = [FanRequestItem new];
    item.url = url;
    item.params = [NSMutableDictionary dictionaryWithDictionary:self.params];
    self.params = nil;
    item.requestQueue = [NSMutableArray arrayWithArray:self.requestQueue];
    item.itemQueue = [NSMutableArray arrayWithArray:self.itemQueue];
    item.showLoadIng = loading;
    __weak __typeof(&*self)weakSelf = self;
    item.completeBlock = ^(FanRequestItem *item) {
        if (item.success) {
            [weakSelf handelSuccessRequest:item];
        }else{
            [weakSelf handelFailureRequest:item];
        }
    };
    [item startRequest];
}
- (void)handelFailureRequest:(FanRequestItem *)item{}
- (void)handelSuccessRequest:(FanRequestItem *)item{}

#pragma mark -- get
- (void)setParams:(NSMutableDictionary *)params{
    objc_setAssociatedObject(self, FanRequestParams, params, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}
- (NSMutableDictionary *)params{
    NSMutableDictionary *dict = objc_getAssociatedObject(self,FanRequestParams);
    if (!dict) {
        dict = [NSMutableDictionary new];
        objc_setAssociatedObject(self, FanRequestParams, dict, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    }
    return dict;
}
- (void)setRequestQueue:(NSMutableArray *)requestQueue{
    objc_setAssociatedObject(self, FanRequestQueue, requestQueue, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}
- (NSMutableArray *)requestQueue{
    NSMutableArray *arr = objc_getAssociatedObject(self,FanRequestQueue);
    if (!arr) {
        arr = [NSMutableArray new];
        objc_setAssociatedObject(self, FanRequestQueue, arr, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    }
    return arr;
}
- (void)setItemQueue:(NSMutableArray *)itemQueue{
    objc_setAssociatedObject(self, FanItemQueue, itemQueue, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}
- (NSMutableArray *)itemQueue{
    NSMutableArray *arr = objc_getAssociatedObject(self,FanItemQueue);
    if (!arr) {
        arr = [NSMutableArray new];
        objc_setAssociatedObject(self, FanItemQueue, arr, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    }
    return arr;
}



@end
