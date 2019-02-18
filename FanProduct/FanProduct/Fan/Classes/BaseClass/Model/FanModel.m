//
//  FanModel.m
//  Baletu
//
//  Created by fangkangpeng on 2018/12/17.
//  Copyright © 2018 Fan. All rights reserved.
//

#import "FanModel.h"
#import <objc/runtime.h>





@implementation FanModel

#pragma mark -- 解析
+ (instancetype)modelWithJson:(NSDictionary *)json{
    if (json && [json isKindOfClass:[NSDictionary class]]) {
        FanModel *model = [self subModelWithJson:json];
        if(model) {
            model.jsonData = json;
            model.urlScheme = DICTION_OBJECT(json, @"urlScheme");
        }
        return model;
    } return nil;
}
+ (instancetype)subModelWithJson:(NSDictionary *)json{
    return nil;
}

- (CGFloat)cellHeight{
    return 0.01;
}
#pragma Mark -- 归档反归档
- (id)initWithCoder:(NSCoder *)aDecoder {
    if (self = [super init]) {
        unsigned int outCount;
        Ivar * ivars = class_copyIvarList([self class], &outCount);
        for (int i = 0; i < outCount; i ++) {
            Ivar ivar = ivars[i];
            NSString * key = [NSString stringWithUTF8String:ivar_getName(ivar)];
            if ([aDecoder decodeObjectForKey:key]) {
                [self setValue:[aDecoder decodeObjectForKey:key]  forKey:key];
            }
        }
        free(ivars);
    }
    return self;
}
- (void)encodeWithCoder:(NSCoder *)aCoder {
    unsigned int outCount;
    Ivar * ivars = class_copyIvarList([self class], &outCount);
    for (int i = 0; i < outCount; i ++) {
        Ivar ivar = ivars[i];
        NSString * key = [NSString stringWithUTF8String:ivar_getName(ivar)];
        if ([self valueForKey:key]) {
            [aCoder encodeObject:[self valueForKey:key] forKey:key];
        }
    }
    free(ivars);
}

- (NSMutableArray *)contentList{
    if (!_contentList) {
        _contentList = [NSMutableArray array];
    }return _contentList;
}

@end



@implementation FanNilModel
- (CGFloat)cellHeight{
    return 10;
}
@end
