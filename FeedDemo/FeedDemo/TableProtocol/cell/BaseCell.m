//
//  BaseCell.m
//  FeedDemo
//
//  Created by 杨涛 on 2017/3/6.
//  Copyright © 2017年 杨涛. All rights reserved.
//

#import "BaseCell.h"
#import "UIView+Add.h"
#import "UIClickView.h"

@implementation BaseCell

- (void)awakeFromNib {
    [super awakeFromNib];
    
    //初始化默认控件
     [self setDefaultView];
    
}
-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{

    self=[super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    if (self) {
        //初始化默认控件
        [self setDefaultView];
        
        [self setUpView];
        
    }
    return self;

}
-(void)setDefaultView{

    //去除选中状态
    self.selectionStyle=UITableViewCellSelectionStyleNone;
    _containerView =[[UIClickView alloc]initWithFrame:self.bounds];
    
    _containerView.selectColor=UIColorHex(f0f0f0);
    _containerView.defaultColor=UIColorHex(fafafa);
    _containerView.showClickEffect=YES;
    self.line=[_containerView addPixLineToBottom];
    
    [self.contentView addSubview:_containerView];
    
    __block typeof(self) cell = self;
    
    [_containerView addTouchBlock:^(UIClickView *view, ClickState state, NSSet *touches, UIEvent *event) {
        
        if (state==ClickStateEnded) {
            NSIndexPath *indepath= [cell currnIndexPath];
            UITableView *tableView=[cell currnTableView];
            
            if ([tableView.delegate respondsToSelector:@selector(tableView:didSelectRowAtIndexPath:)]) {
                [tableView.delegate tableView:tableView didSelectRowAtIndexPath:indepath];
            }
        }
        
        
    }];

}
-(void)setUpView{
    
    

}
-(void)setLayout:(LayoutModel *)layout{

    _layout=layout;
    [self getlayout:_layout];

}
-(void)getlayout:(LayoutModel *)layout{

}
-(void)setLineColor:(UIColor *)lineColor{

    self.line.colors=@[(id)lineColor.CGColor,(id)lineColor.CGColor];
}
-(void)addActionBlock:(CellAction)block{
    self.cellAction=block;

}
-(void)setFrame:(CGRect)frame{
    
    _containerView.frame=CGRectMake(0, 0, frame.size.width, frame.size.height);
    self.line.frame=CGRectMake(0, _containerView.height-sizeFromPixel(1),_containerView.width , CGFloatFromPixel(1));
    
    [super setFrame:frame];

}

- (UITableView*)currnTableView{
    
    static UITableView*tableView=nil;
    
    if(!tableView){
    
    
    for (UIView* next = [self superview]; next; next = next.superview) {
        UIResponder* nextResponder = [next nextResponder];
        if ([nextResponder isKindOfClass:[UITableView class]]) {
            tableView= (UITableView*)nextResponder;
            break;
        }
    }
    }
    return tableView;
}
-(NSIndexPath *)currnIndexPath{
    
    NSIndexPath *indexPath=[[self currnTableView] indexPathForCell:self];
    return indexPath;
}


@end
