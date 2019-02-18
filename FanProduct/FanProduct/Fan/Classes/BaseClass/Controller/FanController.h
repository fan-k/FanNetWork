//
//  FanController.h
//  Baletu
//
//  Created by fangkangpeng on 2018/12/17.
//  Copyright © 2018 Fan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIViewExt.h"
#import "UIColor+HexString.h"

@interface FanController : UIViewController


#pragma mark -- push



/**
 push页面的方法
 * 开启push动画
 @param controller 下级controller
 @param transferData 需要传递的数据transferData
 */
- (void)pushController:(FanController *)controller
          transferData:(id)transferData;

#pragma mark -- 导航


#pragma mark - 设置左侧按钮
/**
 设置左侧按钮
 
 @param name      字体
 @param selectedName 选中的名称
 */
-(void)setNavLeftButtonItemWithName:(NSString *)name
                       selectedName:(NSString *)selectedName;
/**
 设置左侧按钮
 
 @param imageName 名称
 @param selectedImageName 图片
 */
-(void)setNavLeftImageButtonItemWithImageName:(NSString *)imageName
                            selectedImageName:(NSString *)selectedImageName;

#pragma mark - 设置右侧按钮
/**
 设置右侧按钮
 
 @param name      字体
 @param selectedName 图片
 */
-(void)setNavRightButtonItemWithName:(NSString *)name
                        selectedName:(NSString *)selectedName;
/**
 设置右侧按钮
 
 @param imageName      字体
 @param selectedImageName 图片
 */
-(void)setNavRightImageButtonItemWithImageName:(NSString *)imageName
                             selectedImageName:(NSString *)selectedImageName;

@property (nonatomic ,strong) UIButton *leftButton;
@property (nonatomic ,strong) UILabel *navigationTitleLb;
@property (nonatomic ,strong) UIButton *rightButton;
@property (nonatomic ,strong) UIView *navigationView;
@property (nonatomic ,strong) UILabel *navigationLine;
@property (nonatomic ,copy) NSString *navTitle;
@property (nonatomic ,copy) NSString *leftButtonImage;
@property (nonatomic ,copy) NSString *leftButtonselectedImage;
@property (nonatomic ,copy) NSString *rightButtonImage;
@property (nonatomic ,copy) NSString *rightButtonselectedImage;


/**左侧按钮点击 可子类实现*/
-(void)leftNavBtnClick;
/**右侧按钮点击 可子类实现*/
-(void)rightNavBtnCilck;


@end
