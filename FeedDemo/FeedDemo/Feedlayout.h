//
//  Feedlayout.h
//  FeedDemo
//
//  Created by 杨涛 on 2017/3/17.
//  Copyright © 2017年 杨涛. All rights reserved.
//

#import "LayoutModel.h"

@interface Feedlayout : LayoutModel

@property(assign,nonatomic)BOOL isOpen;//收起 显示
@property(nonatomic)CGRect avtarFrame;
@property(nonatomic)CGRect allBtnFrame;
@property(strong,nonatomic)YYTextLayout *userNameLayout;//用户名布局
@property(strong,nonatomic)YYTextLayout *timeLayout;//时间布局
@property(strong,nonatomic)YYTextLayout *contentLayout;//内容
@property(strong,nonatomic)NSMutableArray *imageSizeArr;

@end
