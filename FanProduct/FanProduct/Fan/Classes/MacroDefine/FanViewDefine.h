//
//  FanViewDefine.h
//  Baletu
//
//  Created by fangkangpeng on 2018/12/20.
//  Copyright © 2018 Fan. All rights reserved.
//

#ifndef FanViewDefine_h
#define FanViewDefine_h


#define FanRandomColor [UIColor colorWithRed:arc4random_uniform(255)/255.0 green:arc4random_uniform(255)/255.0 blue:arc4random_uniform(255)/255.0 alpha:1]


#endif /* FanViewDefine_h */

/**是否为iPhoneX系列*/
static inline BOOL FaniPhoneX() {
    BOOL iPhoneXSeries = NO;
    if (UIDevice.currentDevice.userInterfaceIdiom != UIUserInterfaceIdiomPhone) {
        return iPhoneXSeries;
    }
    
    if (@available(iOS 11.0, *)) {
        UIWindow *mainWindow = [[[UIApplication sharedApplication] delegate] window];
        if (mainWindow.safeAreaInsets.bottom > 0.0) {
            iPhoneXSeries = YES;
        }
    }
    
    return iPhoneXSeries;
}
/**导航高度*/
static inline  CGFloat FanNavHeight(){
    if(FaniPhoneX()){
        return 88.0f;
    }else{
        return 64.0f;
    }
}
/**导航子视图距顶高度*/
static inline CGFloat FanNavSubViewTop(CGFloat height){
    if(FaniPhoneX()){
        return 24.0f + height;
    }else{
        return height;
    }
}
/**tabbar高度*/
static inline  CGFloat FanTabbarHeight(){
    if(FaniPhoneX()){
        return 83.0f;
    }else{
        return 49.0f;
    }
}
/**tabbbar内部子视图高度计算*/
static inline  CGFloat FanTabbarSubViewHeight(CGFloat height){
    if(FaniPhoneX()){
        return height - 34.0f;
    }else{
        return height;
    }
}
/**tabbar 视图高度*/
static inline  CGFloat FanTabbarViewHeight(CGFloat height){
    if(FaniPhoneX()){
        return height + 34.0f;
    }else{
        return height;
    }
}
/**设备宽*/
static inline  CGFloat FanScreenWidth(){
    CGFloat ssss  = [[UIScreen mainScreen] bounds].size.width;
    return ssss;
}
/**设备高*/
static inline  CGFloat FanScreenHeight(){
    CGFloat ssss  = [[UIScreen mainScreen] bounds].size.height;
    return ssss;
}

/**分割线高度*/
static inline CGFloat FanLineHeight(){
    return  (1 / [UIScreen mainScreen].scale);
}

/**以375为基础 适配比例后的宽*/
static inline CGFloat FanWidth(CGFloat width){
    return width * FanScreenWidth()/375;
}
/**以667为基础 适配比例后的高*/
static inline CGFloat FanHeight(CGFloat height){
    return height * FanScreenHeight()/667;
}

