//
//  LayoutModel.h
//  TableView
//
//  Created by 杨涛 on 2017/3/17.
//  Copyright © 2017年 杨涛. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 布局模型类
 */
@interface LayoutModel : NSObject
@property(copy,nonatomic) NSString *reuseIdentifier;
@property(strong,nonatomic) id dataModel;
@property(assign,nonatomic) CGFloat cellHeight;

-(void)celllayout;
//匹配url
-(NSArray *)compareUrl:(NSString*)string;
//得到富文本的布局，内容
-(YYTextLayout *)layout:(UIFont *)font color:(UIColor*)color width:(CGFloat )width string:(NSString *)string max:(BOOL)max;
//根据identifier 得到一个布局模型 identifier和tableVew注册的cell的identifier保持一致
-(id )initWithModel:(id)model identifier:(NSString *)identifier;
@end
