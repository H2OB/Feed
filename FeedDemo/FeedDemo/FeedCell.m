//
//  FeedCell.m
//  FeedDemo
//
//  Created by 杨涛 on 2017/3/6.
//  Copyright © 2017年 杨涛. All rights reserved.
//

#import "FeedCell.h"
#import "UIPictureView.h"
#import "Feedlayout.h"
#import "FeedModel.h"
#import "UIView+Add.h"
#define ImageSevice(str) [NSString stringWithFormat:@"http://101.201.145.44:8080/image-service/%@",str]


@implementation FeedCell
{
    YYLabel *userNameLabel;
    YYLabel *cotentLabel;
    YYLabel *timeLabel;
    UIPictureView *iconView;
    UIButton *allBtn;
    
    NSMutableArray *imgViewArray;
    
    
    
    
}
-(void)setUpView{
    
    iconView=[UIPictureView new];
    iconView.contentMode=UIViewContentModeScaleAspectFill;
    iconView.clipsToBounds=YES;
    [self.containerView addSubview:iconView];
    
    
    
    
    
    userNameLabel = [YYLabel new];
    userNameLabel.opaque=YES;
    userNameLabel.displaysAsynchronously = YES;
    userNameLabel.ignoreCommonProperties = YES;
    [self.containerView addSubview:userNameLabel];
    
    cotentLabel = [YYLabel new];
    cotentLabel.opaque=YES;
    cotentLabel.displaysAsynchronously = YES;
    cotentLabel.ignoreCommonProperties = YES;
    [self.containerView addSubview:cotentLabel];
    
    timeLabel = [YYLabel new];
    timeLabel.displaysAsynchronously = YES;
    timeLabel.ignoreCommonProperties = YES;
    timeLabel.opaque=YES;
    [self.containerView addSubview:timeLabel];
    
    allBtn=[UIButton buttonWithType:UIButtonTypeCustom];
    
    [allBtn setTitle:@"全文" forState:UIControlStateNormal];

    [allBtn setTitle:@"收起" forState:UIControlStateSelected];
    allBtn .titleLabel.font=[UIFont systemFontOfSize:15];
    [allBtn setTitleColor:[UIColor colorWithHexString:@"68769a"]  forState:UIControlStateNormal];
    [allBtn setTitleColor:[UIColor colorWithHexString:@"68769a"] forState:UIControlStateSelected];
    [allBtn addTarget:self action:@selector(allBtnlick:) forControlEvents:UIControlEventTouchUpInside];
    [self.containerView addSubview:allBtn];
    
    
    imgViewArray=[NSMutableArray array];
    
    for (int i = 0; i<9; i++) {
        UIPictureView *imageView =[[UIPictureView alloc]initWithFrame:CGRectZero];

        [self.containerView addSubview:imageView];
        
        [imgViewArray addObject:imageView];
        
    }
    
    
    
    
    
    
}
-(void)getlayout:(Feedlayout *)layout{
    
    FeedModel *feed=layout.dataModel;
    iconView.frame=layout.avtarFrame;
    
    userNameLabel.size=layout.userNameLayout.textBoundingSize;
    userNameLabel.textLayout=layout.userNameLayout;
    userNameLabel.left=iconView.bottom+10;
    userNameLabel.top=iconView.top+5;
    
    timeLabel.size=layout.timeLayout.textBoundingSize;
    timeLabel.top=userNameLabel.bottom+7;
    timeLabel.left=userNameLabel.left;
    timeLabel.textLayout=layout.timeLayout;
    
    cotentLabel.left=userNameLabel.left;
    cotentLabel.top=iconView.bottom+10;
    cotentLabel.size=layout.contentLayout.textBoundingSize;
    cotentLabel.textLayout=layout.contentLayout;
    
    allBtn.frame=layout.allBtnFrame;
    allBtn.selected=layout.isOpen;
    
    //    [iconView.layer setImageURL:[NSURL URLWithString:ImageSevice(feed.avtar)]];
    /// 圆角头像
    [iconView.layer setImageWithURL:[NSURL URLWithString:ImageSevice(feed.avtar)] //profileImageURL
                        placeholder:nil
                            options:kNilOptions
                            manager:[FeedCell avatarImageManagerWithSize:iconView.size key:@"FeedAvtar"] // 圆角头像manager，内置圆角处理
                           progress:nil
                          transform:nil
                         completion:nil];
    
    
    
    
    
    if (feed.imageArr.count>0){
        
        
        [imgViewArray enumerateObjectsUsingBlock:^(UIPictureView *view, NSUInteger idx, BOOL * _Nonnull stop) {
            if (feed.imageArr.count-1>=idx) {
                
                CGRect rect=CGRectFromString(layout.imageSizeArr[idx]);
                
                view.frame=rect;
                
                @weakify(view);
                
                [view.layer setImageWithURL:[NSURL URLWithString:ImageSevice(feed.imageArr[idx][@"bigPath"])]
                                placeholder:nil
                                    options:YYWebImageOptionAvoidSetImage //当图片下载完成之后不讲图片设置为视图
                                 completion:^(UIImage *image, NSURL *url, YYWebImageFromType from, YYWebImageStage stage, NSError *error) {
                                     @strongify(view);
                                     if (!view) return;
                                     if (image && stage == YYWebImageStageFinished) {
                                         
                                         view.image = image;
                                         
                                         view.contentMode=UIViewContentModeScaleAspectFill;
                                         view.clipsToBounds=YES;
                                         
                                         if (from != YYWebImageFromMemoryCacheFast) {
                                             CATransition *transition = [CATransition animation];
                                             transition.duration = 0.15;
                                             transition.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut];
                                             transition.type = kCATransitionFade;
                                             [view.layer addAnimation:transition forKey:@"contents"];
                                         }
                                     }
                }];
                
                
                
                
                
                
            }else{
                view.frame=CGRectZero;
            }
            
        }];
    }else{
        
        [imgViewArray enumerateObjectsUsingBlock:^(UIPictureView *view, NSUInteger idx, BOOL * _Nonnull stop) {
            
            
            view.frame=CGRectZero;
            
            
        }];
    }
    
    
    
    
    
}
-(void)allBtnlick:(UIButton *)butn{
    
     Feedlayout *layout =(Feedlayout *)self.layout;
     layout.isOpen=!layout.isOpen;

    [layout celllayout];
    
    UITableView *tableView =[self currnTableView];
    NSIndexPath *indexPath =[self currnIndexPath];
    [tableView beginUpdates];
    
    [tableView reloadRowAtIndexPath:indexPath withRowAnimation:UITableViewRowAnimationAutomatic];
    [tableView endUpdates];
    
    
    if (self.self.cellAction) self.cellAction(@(butn.selected));

}

//这个图片处理不一定放这里，放到图片工具类
+ (YYWebImageManager *)avatarImageManagerWithSize:(CGSize)size key:(NSString *)key {
    static YYWebImageManager *manager;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        NSString *path = [[UIApplication sharedApplication].cachesPath stringByAppendingPathComponent:key];
        YYImageCache *cache = [[YYImageCache alloc] initWithPath:path];
        manager = [[YYWebImageManager alloc] initWithCache:cache queue:[YYWebImageManager sharedManager].queue];
        manager.sharedTransformBlock = ^(UIImage *image, NSURL *url) {
            if (!image) return image;
            
            image=[image imageByResizeToSize:size contentMode:UIViewContentModeScaleAspectFill];
            
            return [image imageByRoundCornerRadius:size.width/2]; // a large value
        };
    });
    return manager;
}


@end
