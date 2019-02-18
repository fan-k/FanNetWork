//
//  FanTableViewCell.h
//  Baletu
//
//  Created by fangkangpeng on 2018/12/20.
//  Copyright © 2018 Fan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FanView.h"


typedef enum : NSUInteger {
    FanTableViewCellSeparatorStyleNone = 0,    //无分割线
    FanTableViewCellSeparatorStyle0_0,         //从0开始，居右0的分割线
    FanTableViewCellSeparatorStyle15_15,       //左15 右15 分割线
} FanTableViewCellSeparatorStyle;



@interface FanTableViewCell : UITableViewCell
@property (nonatomic ,strong) id cellModel;
- (void)cellModel:(id)cellModel;
- (void)initView;
/**分割线的样式*/
@property (nonatomic ,assign) FanTableViewCellSeparatorStyle FanSeparatorStyle;
/**分割线*/
@property (nonatomic ,strong) UIView * DividingLine;
@end


@interface FanNilCell : FanTableViewCell

@end
