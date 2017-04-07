//
//  UITableView+Protocol.m
//  TableView
//
//  Created by 杨涛 on 2017/3/17.
//  Copyright © 2017年 杨涛. All rights reserved.
//

#import "UITableView+Protocol.h"
#import "TableViewDelegate.h"
#import <objc/runtime.h>
static void * protocol=@"protocol";

@implementation UITableView (Protocol)

-(void)registerClass:(NSString *)className identifier:(NSString *)identifier{
    
    [self registerClass:NSClassFromString(className) forCellReuseIdentifier:identifier];
}
-(void)registerNib:(NSString *)NibName identifier:(NSString *)identifier{
    [self registerNib:[UINib nibWithNibName:NibName bundle:[NSBundle bundleForClass:NSClassFromString(NibName)]] forCellReuseIdentifier:identifier];
}

-(TableViewDelegate *)protocol{
    return objc_getAssociatedObject(self, protocol);
}
-(void)setUpTableView{
    
    if (![self protocol]) {
        
        TableViewDelegate *delegate =[[TableViewDelegate alloc]initWithTableView:self];
        
        objc_setAssociatedObject(self, protocol, delegate, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    }
    
}
-(void)setData:(id)data{
    
    if (![self protocol]) {
        [self setUpTableView];
    }
    
    [[self protocol] setData:data];
}
-(id)getData{

    if (![self protocol])return nil;
    
    return [[self protocol] getData];
    

}
-(void)setNumberOfSections:(SecionNumBlock)block{
    if (![self protocol]) {
        [self setUpTableView];
    }
    [[self protocol] setNumberOfSections:block];
    
    
}
-(void)setNumberOfRows:(RowNumForSecionBlock)block{
    if (![self protocol]) {
        [self setUpTableView];
    }
    [[self protocol] setNumberOfRows:block];
}

-(void)setHeightForRow:(RowHeightBlock)block{
    if (![self protocol]) {
        [self setUpTableView];
    }
    
    [[self protocol] setHeightForRow:block];
}
-(void)setHeightForHeader:(HeaderFooterHeightBlock)block{
    if (![self protocol]) {
        [self setUpTableView];
    }
    
    [[self protocol] setHeightForFooter:block];
}
-(void)setViewForHeader:(HeaderFooterViewBlock)block{
    if (![self protocol]) {
        [self setUpTableView];
    }
    [[self protocol] setViewForHeader:block];
    
}
-(void)setHeightForFooter:(HeaderFooterHeightBlock)block{
    if (![self protocol]) {
        [self setUpTableView];
    }
    
    [[self protocol] setHeightForFooter:block];
}
-(void)setViewForFooter:(HeaderFooterViewBlock)block{
    if (![self protocol]) {
        [self setUpTableView];
    }
    
    [[self protocol] setViewForFooter:block];
    
}
-(void)setWillDisplayCell:(WillDisplayCellBlock)block{
    if (![self protocol]) {
        [self setUpTableView];
    }
    [[self protocol] setWillDisplayCell:block];
}
-(void)setCellForRow:(CellForRowBlock)block{
    if (![self protocol]) {
        [self setUpTableView];
    }
    [[self protocol] setCellForRow:block];
}
-(void)addSelectRowAction:(TableViewAction)action{
    if (![self protocol]) {
        [self setUpTableView];
    }
    
    [[self protocol] addSelectRowAction:action];
    
}
-(void)addCellClickAction:(TableViewAction)action{
    if (![self protocol]) {
        [self setUpTableView];
    }
    
    [[self protocol] addCellClickAction:action];
    
}
@end
