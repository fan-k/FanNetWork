//
//  FanRequestFiles.h
//  Baletu
//
//  Created by fangkangpeng on 2018/12/17.
//  Copyright © 2018 Fan. All rights reserved.
//
// 所有的接口字段

/*
 * BMNetwokAPI/AFNetworkTool/FanRequestItem
 * 状态码：3830101  没有租约
 *        3830102 没有在租期的最后一个月
 *        0 成功  非0为异常
 *        0201一小时超过5次获取验证
 *        100从新获取
 */



#pragma mark -- 401
//401
static NSString *FanBaseUrl401 = @"https://api.baletu.com/App401/";
#pragma mark --用户信息
/*
 * 用户信息接口
 * User/getDetail.html
 * params :id --> user_id
 */
static NSString *const FanUserDetail= @"User/getDetail.html";



#pragma mark -- 融云
/*
 * 获取单个用户信息接口
 * User/getOtherDetail.html
 * params :id --> user_id
 */
static NSString *const FanUserOtherDetail= @"User/getOtherDetail.html";

#pragma mark -- 房源详情

/*
 * 房源详情
 */
static NSString *const FanHouseDetail = @"House/getApartmentHousesShows378.html";
/*
 * 房源详情 获取电话
 */
static NSString *const FanHouseDetailPhone = @"Public/beforeHouseContact";
/*
 * 举报
 */
static NSString *const FanReport = @"House/reportHouseProblem";
/*
 * 换一批－小区在租
 */
static NSString *const FanHouseGetSubdistrictInRentHouses378 = @"House/getSubdistrictInRentHouses378.html";
/*
 * 换一批－相似房源
 */
static NSString *const FanHouseGetApartmentHousesShows2RelationHouses378 = @"House/getApartmentHousesShows2RelationHouses378.html";
/**删除收藏*/
static NSString *const FanHouseDeleteCollect = @"Collect/delete.html";
/**添加收藏*/
static NSString *const FanHouseAddCollect = @"Collect/addHouseMenuList";
/*
 * 换一批－地铁沿线
 */
static NSString *const FanHouseGetApartmentHousesShows2SubwayHouses378 = @"House/getApartmentHousesShows2SubwayHouses378.html";
/*
 * 房源详情 获取房东商铺信息
 *
 * land_user_id 房东user_id
 * lan_co_id    机构id
 * favg         房源设施评分
 * aavg         房东服务评分
 */
static NSString *const FanHouseLandShop = @"House/landShop";


/*
 * 房源详情 获取房东房源列表
 *
 * house_id  房源id
 * P         页数
 * type      推荐房源模块类型（1- 其他房源 2-相似房源 3-地铁沿线房）
 */
static NSString *const FanHouseLandShopGetMoreHouse = @"House/getHouseMore378";


/*
 * 房源详情 获取房东评价列表
 *
 * lan_user_id   房东id
 * house_id      房间id
 * labels        筛选的标签，格式'55,56,57'  //这里用不上
 * device_id     设备id
 * only_house    获取本房间评价  //这里用不上
 * P
 * S
 */
static NSString *const FanHouseLandShopGetEvallist = @"Eval/getEvallist";

#pragma mark -- 行程
/**预约行程*/
static NSString *const FanBookTrip = @"Public/reservation";
/*
 * 置顶接口
 * FindRoommate/stickTopic
 * params : topic_id --> topic_id
 */
static NSString *const FanFindRommateStickTopic= @"FindRoommate/stickTopic";


#pragma mark -- 400
//400
static NSString *FanBaseUrl400 = @"https://api.baletu.com/App400/";
