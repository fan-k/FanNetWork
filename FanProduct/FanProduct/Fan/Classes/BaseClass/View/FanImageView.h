//
//  FanImageView.h
//  Baletu
//
//  Created by fangkangpeng on 2018/12/26.
//  Copyright © 2018 Fan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIImageView+WebCache.h"


/*
 * UIImageView的基类
 * 重写了SDWebImg加载网络图片的方法
 * 占位图
 */
@interface FanImageView : UIImageView
/**占位图 在加载网络图片之前设置*/
@property (nonatomic ,copy) UIImage *placeholderImage;

@end
