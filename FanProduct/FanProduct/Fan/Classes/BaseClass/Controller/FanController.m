//
//  FanController.m
//  Baletu
//
//  Created by fangkangpeng on 2018/12/17.
//  Copyright © 2018 Fan. All rights reserved.
//

#import "FanController.h"

@interface FanController ()

@end

@implementation FanController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.automaticallyAdjustsScrollViewInsets = NO;
    self.navigationController.navigationBar.hidden = YES;
    self.view.backgroundColor = [UIColor whiteColor];
    
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark -- push

- (void)pushController:(FanController *)controller transferData:(id)transferData{
    controller.hidesBottomBarWhenPushed = YES;
    controller.transferData  = transferData;
    [self.navigationController pushViewController:controller animated:YES];
}

#pragma mark -- 导航
- (void)rightButtomMethod{
    if ([self respondsToSelector:@selector(rightNavBtnCilck)]) {
        [self rightNavBtnCilck];
    }
}

- (void)leftButtomMethod{
    if ([self respondsToSelector:@selector(leftNavBtnClick)]) {
        [self leftNavBtnClick];
    }else{
        [self.navigationController popViewControllerAnimated:YES];
    }
}

- (void)setNavTitle:(NSString *)navTitle{
    _navTitle = navTitle;
    //神策统计需要 设定系统导航的title
    self.navigationItem.title = navTitle;
    [self.navigationTitleLb setText:navTitle];
}
- (void)setNavLeftButtonItemWithName:(NSString *)name
                        selectedName:(NSString *)selectedName{
    if ([name isNotBlank]) {
        CGFloat width = [FanSize getWidthWithString:name fontSize:15] + 10;
        self.leftButton.width_w = width;
        self.leftButton.titleLabel.font = FanFont(15);
        self.leftButton.titleEdgeInsets = UIEdgeInsetsMake(0, 10, 0, 0);
        [self.leftButton setTitle:name forState:UIControlStateNormal];
    }
    if ([selectedName isNotBlank]) {
        [self.leftButton setTitle:selectedName forState:UIControlStateSelected];
        self.leftButton.titleEdgeInsets = UIEdgeInsetsMake(0, 10, 0, 0);
    }
}
- (void)setNavLeftImageButtonItemWithImageName:(NSString *)imageName
                             selectedImageName:(NSString *)selectedImageName{
    if ([imageName isNotBlank]) {
        _leftButtonImage = imageName;
        UIImage *image = [UIImage imageNamed:imageName];
        self.leftButton.imageEdgeInsets = UIEdgeInsetsMake(22 - image.size.height/2, 10, 22 - image.size.height/2, 22 - image.size.width/2);
        [self.leftButton setImage:image forState:UIControlStateNormal];
    }
    if ([selectedImageName isNotBlank]) {
        _leftButtonselectedImage = selectedImageName;
        [self.leftButton setImage:[UIImage imageNamed:selectedImageName] forState:UIControlStateSelected];
    }
}
#pragma mark - 设置右侧按钮
- (void)setNavRightButtonItemWithName:(NSString *)name
                         selectedName:(NSString *)selectedName{
    if ([name isNotBlank]) {
        CGFloat width = [FanSize getWidthWithString:name fontSize:15];
        self.rightButton.left_l = FanScreenWidth() - 15 - width;
        self.rightButton.width_w = width;
        self.rightButton.titleLabel.font = FanFont(15);
        [self.rightButton setTitle:name forState:UIControlStateNormal];
    }
    if ([selectedName isNotBlank]) {
        [self.rightButton setTitle:selectedName forState:UIControlStateSelected];
    }
}
- (void)setNavRightImageButtonItemWithImageName:(NSString *)imageName
                              selectedImageName:(NSString *)selectedImageName{
    if ([imageName isNotBlank]) {
        _rightButtonImage = imageName;
        UIImage *image = [UIImage imageNamed:imageName];
        self.rightButton.imageEdgeInsets = UIEdgeInsetsMake(22 - image.size.height/2, 22 - image.size.width/2, 22 - image.size.height/2, 0);
        [self.rightButton setImage:image forState:UIControlStateNormal];
    }
    if ([selectedImageName isNotBlank]) {
        _rightButtonselectedImage = selectedImageName;
        [self.rightButton setImage:[UIImage imageNamed:selectedImageName] forState:UIControlStateSelected];
    }
}

- (UIView *)navigationView{
    if (!_navigationView) {
        _navigationView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, FanScreenWidth(), FanNavHeight())];
        [_navigationView setBackgroundColor:[UIColor whiteColor]];
        [_navigationView addSubview:self.navigationLine];
        [self.view addSubview:_navigationView];
        [self.view bringSubviewToFront:_navigationView];
//        self.navigationController.navigationBar.hidden = YES;
    }
    return _navigationView;
}
- (UILabel *)navigationLine{
    if (!_navigationLine) {
        _navigationLine = [[UILabel alloc] initWithFrame:CGRectMake(0, FanNavHeight() - FanLineHeight(), FanScreenWidth(), FanLineHeight())];
        [_navigationLine setBackgroundColor:[UIColor colorWithRed:234/255.0 green:234/255.0 blue:234/255.0 alpha:1]];
    }
    return _navigationLine;
}
- (UIButton *)leftButton{
    if (!_leftButton) {
        _leftButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _leftButton.frame = CGRectMake(5, FanNavSubViewTop(20), 59, 44);
        [_leftButton setTitleColor:[UIColor colorWithHexString:@"#1c1c1c"] forState:UIControlStateNormal];
        [_leftButton setTitleColor:[UIColor colorWithHexString:@"#1c1c1c"] forState:UIControlStateSelected];
        _leftButton.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
        [_leftButton addTarget:self action:@selector(leftButtomMethod) forControlEvents:UIControlEventTouchUpInside];
        [self.navigationView addSubview:_leftButton];
    }
    return _leftButton;
}
- (UIButton *)rightButton{
    if (!_rightButton) {
        _rightButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _rightButton.frame = CGRectMake(FanScreenWidth() - 15 - 44, FanNavSubViewTop(20), 44, 44);
        [_rightButton setTitleColor:[UIColor colorWithHexString:@"#1c1c1c"] forState:UIControlStateNormal];
        [_rightButton setTitleColor:[UIColor colorWithHexString:@"#1c1c1c"] forState:UIControlStateSelected];
        _rightButton.contentHorizontalAlignment = UIControlContentHorizontalAlignmentRight;
        [_rightButton addTarget:self action:@selector(rightButtomMethod) forControlEvents:UIControlEventTouchUpInside];
        [self.navigationView addSubview:_rightButton];
    }
    return _rightButton;
}
- (UILabel *)navigationTitleLb{
    if (!_navigationTitleLb) {
        _navigationTitleLb = [[UILabel alloc] initWithFrame:CGRectMake(60, FanNavSubViewTop(33), FanScreenWidth() - 120, 20)];
        _navigationTitleLb.textColor = [UIColor colorWithHexString:@"#1c1c1c"];
        _navigationTitleLb.font = FanFont(17);
        _navigationTitleLb.textAlignment = NSTextAlignmentCenter;
        _navigationTitleLb.tag = 9090;
        [self.navigationView addSubview:_navigationTitleLb];
    }
    return _navigationTitleLb;
}


@end
