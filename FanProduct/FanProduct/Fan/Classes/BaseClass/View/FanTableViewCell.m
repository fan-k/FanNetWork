//
//  FanTableViewCell.m
//  Baletu
//
//  Created by fangkangpeng on 2018/12/20.
//  Copyright © 2018 Fan. All rights reserved.
//

#import "FanTableViewCell.h"

@implementation FanTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self){
        self.backgroundColor = [UIColor whiteColor];
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        [self initView];
    }
    return self;
}
- (void)initView{}
- (void)awakeFromNib {
    [super awakeFromNib];
//    self.selectionStyle = UITableViewCellSelectionStyleNone;
    // Initialization code
}
- (void)setBackgroundColor:(UIColor *)backgroundColor{
    [super setBackgroundColor:backgroundColor];
    self.contentView.backgroundColor = backgroundColor;
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)dealloc{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
    self.customActionBlock  = nil;
}

- (void)setAccessoryType:(UITableViewCellAccessoryType)accessoryType{
    if (accessoryType == UITableViewCellAccessoryDisclosureIndicator) {
        UIImage *image = [UIImage imageNamed:@"house_detail_cell_accessView"];
        UIImageView *img = [[UIImageView alloc] initWithFrame:CGRectMake(self.contentView.width_w - 25, self.contentView.height_h/2 - image.size.height/2, image.size.width, image.size.height)];
        img.image = image;
        self.accessoryType = UITableViewCellAccessoryNone;
        self.accessoryView = img;
    }else{
        [super setAccessoryType:accessoryType];
    }
}
- (void)setFanSeparatorStyle:(FanTableViewCellSeparatorStyle)FanSeparatorStyle{
    _FanSeparatorStyle = FanSeparatorStyle;
    if (FanSeparatorStyle == FanTableViewCellSeparatorStyle0_0) {
        self.DividingLine.hidden = NO;
        self.DividingLine.frame = CGRectMake(0, self.height_h - FanLineHeight(), self.width_w, FanLineHeight());
    }else if (FanSeparatorStyle == FanTableViewCellSeparatorStyle15_15) {
        self.DividingLine.hidden = NO;
        self.DividingLine.frame = CGRectMake(15, self.height_h - FanLineHeight(), self.width_w - 30, FanLineHeight());
    }else {
        self.DividingLine.hidden = YES;
    }
}
- (void)setCellModel:(id)cellModel{
    _cellModel = cellModel;
    if ([self respondsToSelector:@selector(cellModel:)]) {
        [self cellModel:cellModel];
    }
}


- (UIView *)DividingLine{
    if (!_DividingLine) {
        _DividingLine = [UIView new];
        _DividingLine.backgroundColor = [UIColor colorWithHexString:@"#e5e5e5"];
        [self.contentView addSubview:_DividingLine];
    }return _DividingLine;
}
@end


@implementation FanNilCell
- (void)initView{
    self.backgroundColor = [UIColor colorWithHexString:@"#f2f2f2"];
}
@end
