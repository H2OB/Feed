//
//  UITableView+Protocol.h
//  TableView
//
//  Created by 杨涛 on 2017/3/17.
//  Copyright © 2017年 杨涛. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Protocol.h"
@interface UITableView (Protocol)


@property(retain,nonatomic,setter=setData:,getter=getData) id data;

//注册cell
-(void)registerClass:(NSString *)className identifier:(NSString *)identifier;
-(void)registerNib:(NSString *)NibName identifier:(NSString *)identifier;


/**
 设置数据

 @param data 数据
 */
-(void)setData:(id)data;
/**
 返回数据
 */
-(id)getData;

/**
 设置委托 代理
 */
-(void)setUpTableView;

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
