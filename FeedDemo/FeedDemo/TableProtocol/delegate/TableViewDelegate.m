//
//  TableViewDelegate.m
//  TableView
//
//  Created by 杨涛 on 2017/3/17.
//  Copyright © 2017年 杨涛. All rights reserved.
//

#import "TableViewDelegate.h"

#import "BaseCell.h"
#import "LayoutModel.h"



@implementation TableViewDelegate
{

    SecionNumBlock secionNumBlock;
    RowNumForSecionBlock rowNumForSecionBlock;
    RowHeightBlock rowHeightBlock;
    HeaderFooterHeightBlock headerHeightBlock;
    HeaderFooterHeightBlock footerHeightBlock;
    WillDisplayCellBlock willDisplayCellBlock;
    CellForRowBlock cellForRowBlock;
    TableViewAction rowClickAction;
    TableViewAction cellClickAction;
    HeaderFooterViewBlock headerViewBlock;
    HeaderFooterViewBlock footerViewBlock;
    
    UITableView *_tableView;
    id dataSource;

}
-(id)initWithTableView:(UITableView *)tableView{
    
    self = [super init];
    
    if (self) {
        _tableView=tableView;
        _tableView.delegate=self;
        _tableView.dataSource=self;
    }

    return self;

}
-(void)setData:(id)data{
    dataSource=data;

}
-(id)getData{

    return dataSource;
}
-(void)setNumberOfSections:(SecionNumBlock)block{

    secionNumBlock=block;
}
-(void)setNumberOfRows:(RowNumForSecionBlock)block{
    rowNumForSecionBlock=block;


}

-(void)setHeightForHeader:(HeaderFooterHeightBlock)block{
    
    headerHeightBlock=block;

}
-(void)setViewForHeader:(HeaderFooterViewBlock)block{
    headerViewBlock=block;
}
-(void)setHeightForFooter:(HeaderFooterHeightBlock)block{
    
    footerHeightBlock=block;

}
-(void)setViewForFooter:(HeaderFooterViewBlock)block{
    
    footerViewBlock=block;

}
-(void)setHeightForRow:(RowHeightBlock)block{
    rowHeightBlock=block;
}
-(void)setWillDisplayCell:(WillDisplayCellBlock)block{
    willDisplayCellBlock=block;
}
-(void)setCellForRow:(CellForRowBlock)block{
    
    cellForRowBlock=block;
    
}
-(void)addSelectRowAction:(TableViewAction)action{

    rowClickAction=action;
}
-(void)addCellClickAction:(TableViewAction)action{
    cellClickAction=action;

}
#pragma mark delegate datasource
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    
    if (secionNumBlock) return secionNumBlock(dataSource);
    //下面的自定义
    return [self secionNum];
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    if (rowNumForSecionBlock) return rowNumForSecionBlock(dataSource,section);
    // 下面的自定义
    return [self rowNum:section];
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{

    if (headerHeightBlock) return headerHeightBlock(dataSource,section);
    return CGFLOAT_MIN;
}
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{

    if(headerViewBlock) return headerViewBlock(dataSource,section);
    return nil;
}
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{

    if (footerHeightBlock) return footerHeightBlock(dataSource,section);
    return CGFLOAT_MIN;
}
-(UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    
    if(footerViewBlock) return footerViewBlock(dataSource,section);
    return nil;

}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{

    if(rowHeightBlock)return rowHeightBlock(dataSource,indexPath);
    
    NSMutableArray *array =[self arrForSecion:indexPath.section];
    
    LayoutModel *layout =array[indexPath.row];
    
    return layout.cellHeight;
    
    
    return UITableViewAutomaticDimension;
}
-(void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if(willDisplayCellBlock) willDisplayCellBlock(dataSource,cell,indexPath);

}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{

    if (cellForRowBlock) return cellForRowBlock(tableView,dataSource,indexPath);
   
    //下面的自定义
    
    NSMutableArray *array =[self arrForSecion:indexPath.section];
    
    LayoutModel *layout =array[indexPath.row];
    
    BaseCell *cell =[tableView dequeueReusableCellWithIdentifier:layout.reuseIdentifier];
    
    
    
    cell.layout=layout;
    [cell addActionBlock:^(id action) {
        
        if (cellClickAction) cellClickAction(tableView,dataSource,indexPath,action);
        
    }];
    return cell;
    
    

}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (rowClickAction)  rowClickAction(tableView,dataSource,indexPath,nil);
    
    
}
-(NSInteger )secionNum{
    
    if ([dataSource isKindOfClass:[NSDictionary class]]) {
        
        NSMutableDictionary *dic=dataSource;
        
        return [dic allKeys].count;
    }
    
    if ([dataSource isKindOfClass:[NSArray class]]) {
        
        
        return  1;
    }
    
    return 1;
}
-(NSInteger )rowNum:(NSInteger)secion{
    
    if ([dataSource isKindOfClass:[NSDictionary class]]) {
        
        NSMutableDictionary *dic=dataSource;
        NSMutableArray *array=dic[[NSString stringWithFormat:@"%ld",(long)secion]];
        return array.count;
    }
    
    if ([dataSource isKindOfClass:[NSArray class]]) {
        
        
        NSMutableArray *array=dataSource;
        return array.count;
    }

    return 0;
}
-(NSMutableArray *)arrForSecion:(NSInteger )secion{

    if ([dataSource isKindOfClass:[NSDictionary class]]) {
        
        NSMutableDictionary *dic=dataSource;
        NSMutableArray *array=dic[[NSString stringWithFormat:@"%ld", (long)secion]];
        return array;
    }
    
    if ([dataSource isKindOfClass:[NSArray class]]) {
        
        
        NSMutableArray *array=dataSource;
        return array;
    }
    
    return nil;

}

@end






