//
//  FanUrlScheme.m
//  Baletu
//
//  Created by fangkangpeng on 2018/12/29.
//  Copyright © 2018 Fan. All rights reserved.
//

#import "FanUrlScheme.h"
#import <objc/runtime.h>

@implementation FanUrlScheme

+ (instancetype)shareInstance{
    static FanUrlScheme *tools = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        tools = [[FanUrlScheme alloc] init];
    });
    return tools;
}
+ (UIViewController *)currentViewController{
    return [FanUrlScheme topViewController];
}
+ (UIViewController *)topViewController {
    UIViewController *resultVC;
    resultVC = [self _topViewController:[[UIApplication sharedApplication].keyWindow rootViewController]];
    while (resultVC.presentedViewController) {
        resultVC = [self _topViewController:resultVC.presentedViewController];
    }
    return resultVC;
}

+ (UIViewController *)_topViewController:(UIViewController *)vc {
    if ([vc isKindOfClass:[UINavigationController class]]) {
        return [FanUrlScheme _topViewController:[(UINavigationController *)vc topViewController]];
    } else if ([vc isKindOfClass:[UITabBarController class]]) {
        return [FanUrlScheme _topViewController:[(UITabBarController *)vc selectedViewController]];
    } else {
        return vc;
    }
    return nil;
}
- (void)pushViewControllerWithUrl:(NSString *)url transferData:(id)transferData hander:(void (^ _Nullable)(id, int))hander{
    if(url.length == 0) return;
    if ([url hasPrefix:@"http"]) {
        //区分下网页 暂时return 不处理
        return;
    }
    NSString *className = [url rangeOfString:@"/"].location != NSNotFound ? [[url componentsSeparatedByString:@"/"] lastObject] : url;
    //取链接内的参数
    NSMutableDictionary *params =  [url urlToParamDict];

    if ([className containsString:@"?"]) {
        NSArray *arr = [className componentsSeparatedByString:@"?"];
        className = [arr firstObject];
    }
    id urlClass = [NSClassFromString(className) new];
    if([urlClass isKindOfClass:[UIViewController class]]){
        UIViewController *vc = (UIViewController *)urlClass;
        vc.transferData = transferData;
        vc.params = params;
        vc.customActionBlock = ^(id obj, cat_action_type idx) {
            if(hander){
                hander(obj ,idx);
            }
        };
        [[FanUrlScheme currentViewController].navigationController pushViewController:vc animated:YES];
    }
}

- (void)presentViewControllerWithUrl:(NSString *)url transferData:(id)transferData hander:(void (^ _Nullable)(id, int))hander{
    
}
@end


static const char *FanVCPassValue = "FanVCPassValue";
static const char *FanVCPassUrlParams = "FanVCPassUrlParams";

@implementation UIViewController (passValue)

- (void)setTransferData:(id)transferData{
    objc_setAssociatedObject(self, FanVCPassValue, transferData, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}
- (id)transferData{
    return objc_getAssociatedObject(self,FanVCPassValue);
}
- (void)setUrlParams:(NSDictionary *)urlParams{
    objc_setAssociatedObject(self, FanVCPassUrlParams, urlParams, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}
- (NSDictionary *)urlParams{
    return objc_getAssociatedObject(self,FanVCPassUrlParams);
}
@end


