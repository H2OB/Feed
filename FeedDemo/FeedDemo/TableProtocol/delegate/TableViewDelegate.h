//
//  TableViewDelegate.h
//  TableView
//
//  Created by 杨涛 on 2017/3/17.
//  Copyright © 2017年 杨涛. All rights reserved.
//

#import "Protocol.h"

@interface TableViewDelegate : NSObject<UITableViewDelegate,UITableViewDataSource>

/**
 设置数据
 @param data  dic或者arr
 */
-(void)setData:(id)data;

/**
 返回数据

 @return 数据
 */
-(id)getData;

/**
 初始化

 @param tableView 需要实现委托代理的tableView
 @return 代理对象
 */
-(id)initWithTableView:(UITableView *)tableView;
/**
 设置分区数
 */
-(void)setNumberOfSections:(SecionNumBlock)block;
/**
 设置分区中的行数
 */
-(void)setNumberOfRows:(RowNumForSecionBlock)block;

/**
 设置分区头部高度
 */
-(void)setHeightForHeader:(HeaderFooterHeightBlock)block;
/**
 设置分区头部视图
 */
-(void)setViewForHeader:(HeaderFooterViewBlock)block;
/**
 设置分区底部高度
 */
-(void)setHeightForFooter:(HeaderFooterHeightBlock)block;
/**
 设置分区底部视图
 */
-(void)setViewForFooter:(HeaderFooterViewBlock)block;
/**
 设置行高
 */
-(void)setHeightForRow:(RowHeightBlock)block;
/**
 设置将要显示行的回调
 */
-(void)setWillDisplayCell:(WillDisplayCellBlock)block;
/**
 设置行
 */
-(void)setCellForRow:(CellForRowBlock)block;
/**
 设置行点击事件
 */
-(void)addSelectRowAction:(TableViewAction)action;
/**
 设置行内部点击事件 比如 按钮 开关  分段
 */
-(void)addCellClickAction:(TableViewAction)action;
@end
