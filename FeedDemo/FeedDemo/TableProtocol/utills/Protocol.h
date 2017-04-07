//
//  Protocol.h
//  TableView
//
//  Created by 杨涛 on 2017/3/17.
//  Copyright © 2017年 杨涛. All rights reserved.
//

#ifndef Protocol_h
#define Protocol_h


#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
//返回分区
typedef NSInteger(^SecionNumBlock)(id data);
//返回行数
typedef NSInteger(^RowNumForSecionBlock)(id data, NSInteger secion);
//行高
typedef CGFloat(^RowHeightBlock)(id data, NSIndexPath *indexPath);
//header footer 高度
typedef CGFloat(^HeaderFooterHeightBlock)(id data,NSInteger seion);
//点击事件
typedef void(^TableViewAction)(UITableView *tableView,id data,NSIndexPath *indexPath,id action);
// 显示行
typedef UITableViewCell*(^CellForRowBlock)(UITableView *tableView,id data,NSIndexPath *indexPath);
//将要显示行
typedef UITableViewCell*(^WillDisplayCellBlock)(id data,UITableViewCell *cell,NSIndexPath *indexPath);
//header footer view
typedef UIView *(^HeaderFooterViewBlock)(id data,NSInteger secion);




#endif /* Protocol_h */
