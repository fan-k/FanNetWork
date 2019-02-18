//
//  FanModel.h
//  Baletu
//
//  Created by fangkangpeng on 2018/12/17.
//  Copyright © 2018 Fan. All rights reserved.
//

#import "FanObject.h"
#import "UIColor+HexString.h"



@interface FanModel : FanObject
#pragma mark -- 自定义属性
/**model对应的cell的高度*/
@property (nonatomic ,assign) CGFloat cellHeight;
/**model对应的cell的在列表上的top*/
@property (nonatomic ,assign) CGFloat cellTop;
/**model对应的cell的在列表上的bottom*/
@property (nonatomic ,assign) CGFloat cellBottom;
/**model对应的cell的row*/
@property (nonatomic ,assign) NSInteger row;
/**model对应的cell的section*/
@property (nonatomic ,assign) NSInteger section;
/**model内数据元素的集合数组*/
@property (nonatomic ,strong) NSMutableArray *contentList;
/**model的业务跳转url*/
@property (nonatomic ,copy) NSString * urlScheme;
/**model的json解析数据记录*/
@property (nonatomic ,copy) NSDictionary * jsonData;

/**model 的ID ,可记录需要跳转页面的ID 等参数*/
@property (nonatomic ,copy) NSString * o_id;



#pragma mark -- 解析方法
/**
 model 数据解析

 @param json json
 @return instancetype
 */
+ (instancetype)modelWithJson:(NSDictionary *)json;


/**
 model的子类实现的具体解析方法

 @param json json
 @return instancetype
 */
+ (instancetype)subModelWithJson:(NSDictionary *)json;
@end


/**空model*/
@interface FanNilModel :FanModel
@end
