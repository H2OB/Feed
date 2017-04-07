//
//  ImageView.m
//  FeedDemo
//
//  Created by 杨涛 on 2017/3/7.
//  Copyright © 2017年 杨涛. All rights reserved.
//

#import "UIPictureView.h"

@implementation UIPictureView
{
    UIImage *_image;
}
- (void)setImage:(UIImage *)image {
    _image = image;
    self.layer.contents = (id)image.CGImage;
}
- (UIImage *)image {
    id content = self.layer.contents;
    if (content != (id)_image.CGImage) {
        CGImageRef ref = (__bridge CGImageRef)(content);
        if (ref && CFGetTypeID(ref) == CGImageGetTypeID()) {
            _image = [UIImage imageWithCGImage:ref scale:self.layer.contentsScale orientation:UIImageOrientationUp];
        } else {
            _image = nil;
        }
    }
    return _image;
}
@end
