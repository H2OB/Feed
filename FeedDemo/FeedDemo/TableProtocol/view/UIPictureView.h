//
//  ImageView.h
//  FeedDemo
//
//  Created by 杨涛 on 2017/3/7.
//  Copyright © 2017年 杨涛. All rights reserved.
//

#import "UIClickView.h"
/**
 比UIImageView轻量的显示图片的view
 */
@interface UIPictureView : UIClickView
@property (nonatomic, strong) UIImage *image;
@end
