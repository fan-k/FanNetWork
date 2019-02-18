//
//  FanImageView.m
//  Baletu
//
//  Created by fangkangpeng on 2018/12/26.
//  Copyright © 2018 Fan. All rights reserved.
//

#import "FanImageView.h"

@implementation FanImageView

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        
    }return self;
}
- (void)sd_setImageWithURL:(NSURL *)url placeholderImage:(UIImage *)placeholder{
    if (placeholder) {
        self.placeholderImage = placeholder;
    }else{
        if (self.placeholderImage) {
            placeholder = self.placeholderImage;
        }
    }
    [super sd_setImageWithURL:url placeholderImage:placeholder];
}
@end
