//
//  UIView+Add.m
//  FeedDemo
//
//  Created by 杨涛 on 2017/4/6.
//  Copyright © 2017年 杨涛. All rights reserved.
//

#import "UIView+Add.h"
#import "Protocol.h"
@implementation UIView (Add)
- (CGFloat)left {
    return self.frame.origin.x;
}

- (void)setLeft:(CGFloat)x {
    CGRect frame = self.frame;
    frame.origin.x = x;
    self.frame = frame;
}

- (CGFloat)top {
    return self.frame.origin.y;
}

- (void)setTop:(CGFloat)y {
    CGRect frame = self.frame;
    frame.origin.y = y;
    self.frame = frame;
}

- (CGFloat)right {
    return self.frame.origin.x + self.frame.size.width;
}

- (void)setRight:(CGFloat)right {
    CGRect frame = self.frame;
    frame.origin.x = right - frame.size.width;
    self.frame = frame;
}

- (CGFloat)bottom {
    return self.frame.origin.y + self.frame.size.height;
}

- (void)setBottom:(CGFloat)bottom {
    CGRect frame = self.frame;
    frame.origin.y = bottom - frame.size.height;
    self.frame = frame;
}

- (CGFloat)width {
    return self.frame.size.width;
}

- (void)setWidth:(CGFloat)width {
    CGRect frame = self.frame;
    frame.size.width = width;
    self.frame = frame;
}

- (CGFloat)height {
    return self.frame.size.height;
}

- (void)setHeight:(CGFloat)height {
    CGRect frame = self.frame;
    frame.size.height = height;
    self.frame = frame;
}

- (CGFloat)centerX {
    return self.center.x;
}

- (void)setCenterX:(CGFloat)centerX {
    self.center = CGPointMake(centerX, self.center.y);
}

- (CGFloat)centerY {
    return self.center.y;
}

- (void)setCenterY:(CGFloat)centerY {
    self.center = CGPointMake(self.center.x, centerY);
}

- (CGPoint)origin {
    return self.frame.origin;
}

- (void)setOrigin:(CGPoint)origin {
    CGRect frame = self.frame;
    frame.origin = origin;
    self.frame = frame;
}

- (CGSize)size {
    return self.frame.size;
}

- (void)setSize:(CGSize)size {
    CGRect frame = self.frame;
    frame.size = size;
    self.frame = frame;
}
-(CAGradientLayer *)addPixLineToBottom{
    //sizeFromPixel(1) 计算不同分辨率上1像素的高
    CGRect rect=CGRectMake(0, self.height-sizeFromPixel(1),self.width , sizeFromPixel(1));
    
    return [self addPixLineWithRect:rect];
}
-(CAGradientLayer *)addPixLineToCenter{
    
    CGRect rect=CGRectMake(self.centerX-sizeFromPixel(1)/2.0, 0,sizeFromPixel(1) , self.height);
    return  [self addPixLineWithRect:rect];
    
}
-(CAGradientLayer *)addPixLineWithRect:(CGRect)rect{
    
    return [self addPixLineWithRect:rect lineColor:nil];
}

-(CAGradientLayer *)addPixLineWithRect:(CGRect)rect lineColor:(UIColor *)color{
    if (!color) {
        color=[UIColor grayColor];
    }
    
    CAGradientLayer *line=[CAGradientLayer layer];
    line.frame=rect;
    line.colors=@[(id)color.CGColor,(id)color.CGColor];
    line.locations=@[@0,@1.0];
    line.startPoint = CGPointMake(0, 0);
    line.endPoint = CGPointMake(0, 1);
    
    [self.layer addSublayer:line];
    
    
    return line;
}
-(void)roundWithSize:(CGFloat)size{
    
    
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        
        UIBezierPath *maskPath = [UIBezierPath bezierPathWithRoundedRect:self.bounds cornerRadius:size];
        
        CAShapeLayer *maskLayer = [[CAShapeLayer alloc] init];
        
        maskLayer.frame = self.bounds;
        
        maskLayer.path = maskPath.CGPath;

        dispatch_async(dispatch_get_main_queue(), ^{
            
            self.layer.mask = maskLayer;
        });
        
    });
 
}
@end
