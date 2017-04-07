//
//  TouchsView.h
//  FeedDemo
//
//  Created by 杨涛 on 2017/3/6.
//  Copyright © 2017年 杨涛. All rights reserved.
//

#import <UIKit/UIKit.h>


//点击状态
typedef NS_ENUM(NSUInteger, ClickState) {
    ClickStateBegan, ///< gesture start
    ClickStateMoved, ///< gesture moved
    ClickStateEnded, ///< gesture end
    ClickStateCancelled, ///< gesture cancel
};
/**
 有点击效果的view
 */
@interface UIClickView : UIView
typedef void(^TouchBlock)(UIClickView *view, ClickState state, NSSet *touches, UIEvent *event);

typedef void(^longPressBlock)(UIClickView *view, CGPoint point);

@property (nonatomic, copy) TouchBlock touchBlock;
@property (nonatomic, copy) longPressBlock longPressBlock;

@property(strong,nonatomic)UIColor*selectColor;//选中颜色;
@property(strong,nonatomic)UIColor*defaultColor;//默认颜色;
@property(assign,nonatomic)BOOL showClickEffect;//显示点击效果;

-(void)addTouchBlock:(TouchBlock)block;
-(void)addlongPressBlock:(longPressBlock)block;
@end
