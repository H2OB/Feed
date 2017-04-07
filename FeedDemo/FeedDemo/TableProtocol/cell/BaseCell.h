//
//  BaseCell.h
//  FeedDemo
//
//  Created by 杨涛 on 2017/3/6.
//  Copyright © 2017年 杨涛. All rights reserved.
//

#import <UIKit/UIKit.h>
@class UIClickView,LayoutModel;

typedef void(^CellAction)(id action);
/**
 所有cell的父类
 */
@interface BaseCell : UITableViewCell
/**
 containerView 用于替换contetView   ~介于tableViewCell的姿势图如果设置了阴影 圆角 选中的时候这些都会消息
 */
@property(strong ,nonatomic) UIClickView  *containerView;
@property(strong ,nonatomic) LayoutModel *layout;
@property(assign ,nonatomic) CAGradientLayer *line;//分割线
@property(strong ,nonatomic) UIColor *lineColor;
@property(copy ,nonatomic)   CellAction cellAction;



//初始化视图控件 这个方法教给子类去重写 不需要调用父类
- (void)setUpView;
- (UITableView*)currnTableView;
- (NSIndexPath *)currnIndexPath;
- (void)addActionBlock:(CellAction)block;

- (void)getlayout:(LayoutModel *)layout;




@end
