//
//  FanViewModel.m
//  Baletu
//
//  Created by fangkangpeng on 2018/12/20.
//  Copyright © 2018 Fan. All rights reserved.
//

#import "FanViewModel.h"
#import "FanTableViewCell.h"


@implementation FanViewModel
- (void)dealloc{
    _tableView.delegate = nil;
    _tableView.dataSource = nil;
    _tableView = nil;
    self.customActionBlock  = nil;
    self.resultActionBlock  = nil;
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}
+ (instancetype)initWithTableView:(FanTableView *)tableView{
    FanViewModel *model = [self new];
    model.contentList = [NSMutableArray array];
    model.tableView = tableView;
    tableView.delegate = model;
    tableView.dataSource = model;
    return model;
}
- (void)setTableView:(FanTableView *)tableView{
    _tableView = tableView;
    if (!tableView.tableHeaderView) {
        tableView.tableHeaderView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 0, 0.1)];
    }
    if (!tableView.tableFooterView) {
        tableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 0, 0.1)];
    }
    //注册常用的 公共cell
    [tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:FanTableViewCellId];
    [tableView registerClass:[FanNilCell class] forCellReuseIdentifier:FanNilCellId];
}
- (void)insertList:(id)obj index:(int)index{
    
}
- (void)setList:(NSArray *)list type:(int)type{//type 0 刷新 1追加.
    if (!self.contentList) {
        self.contentList = [NSMutableArray array];
    }
    list = list ?: [NSArray array];
    if (type == tct_refresh) {
        //无更多
        [self.contentList setArray:list];
    }else if (type == tct_append){
        //设置无更多数据
        [self.contentList addObjectsFromArray:list];
    }else if (type == tct_append_front){
        [self.contentList insertObjects:list atIndexes:[NSIndexSet indexSetWithIndex:0]];
    }
    [_tableView reloadData];
}
#pragma mark taleview
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 60;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.contentList.count;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *identifier = @"Identifier";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier forIndexPath:indexPath];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row >= self.contentList.count) {
        return ;
    }
    if (self.customActionBlock) {
        self.customActionBlock(self.contentList[indexPath.row], cat_action_cell_click);
    }
}
- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    if (self.customActionBlock) {
        self.customActionBlock(scrollView, cat_action_scrollView_didScroll);
    }
}
- (NSMutableArray *)editArr{
    if (!_editArr) {
        _editArr = [NSMutableArray array];
    }
    return _editArr;
}
@end

