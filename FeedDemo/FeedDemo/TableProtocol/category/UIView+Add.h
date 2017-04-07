//
//  UIView+Add.h
//  FeedDemo
//
//  Created by 杨涛 on 2017/4/6.
//  Copyright © 2017年 杨涛. All rights reserved.
//

#import <UIKit/UIKit.h>

//一个像素的实际大小
#define sizeFromPixel(value) value/[UIScreen mainScreen].scale

@interface UIView (Add)


/**
 坐标转换
 */
@property (nonatomic) CGFloat left;        ///< Shortcut for frame.origin.x.
@property (nonatomic) CGFloat top;         ///< Shortcut for frame.origin.y
@property (nonatomic) CGFloat right;       ///< Shortcut for frame.origin.x + frame.size.width
@property (nonatomic) CGFloat bottom;      ///< Shortcut for frame.origin.y + frame.size.height
@property (nonatomic) CGFloat width;       ///< Shortcut for frame.size.width.
@property (nonatomic) CGFloat height;      ///< Shortcut for frame.size.height.
@property (nonatomic) CGFloat centerX;     ///< Shortcut for center.x
@property (nonatomic) CGFloat centerY;     ///< Shortcut for center.y
@property (nonatomic) CGPoint origin;      ///< Shortcut for frame.origin.
@property (nonatomic) CGSize  size;        ///< Shortcut for frame.size.


/**

增加一个像素的线
 
 */
-(CAGradientLayer *)addPixLineToBottom;
-(CAGradientLayer *)addPixLineToCenter;
-(CAGradientLayer *)addPixLineWithRect:(CGRect)rect;
-(CAGradientLayer *)addPixLineWithRect:(CGRect)rect lineColor:(UIColor *)color;

/**
 
 设置圆角
 
 */

-(void)roundWithSize:(CGFloat)size;
@end
