//
//  ViewController.m
//  FeedDemo
//
//  Created by 杨涛 on 2017/3/6.
//  Copyright © 2017年 杨涛. All rights reserved.
//

#import "ViewController.h"

#import "UITableView+Protocol.h"
#import "Feedlayout.h"
#import "FeedModel.h"


static  NSString *CellName=@"FeedCell";



@interface ViewController ()
{
    UITableView *_tableView;
    NSMutableArray *dataArr;
    
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    [self initTableView];
    
    [self initData];
    

}


-(void)initTableView{
    
    UITableView *tableView=[[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStylePlain];
    tableView.separatorStyle=UITableViewCellSeparatorStyleNone;
    _tableView=tableView;
    
    
    [self.view addSubview:_tableView];

    [_tableView registerClass:CellName identifier:CellName];
    
    
    [_tableView addSelectRowAction:^(UITableView *tableView, id data, NSIndexPath *indexPath, id action) {
      
        
        
        
        
    }];
    
 
    
    
}
-(void)initData{
    
    dataArr=[NSMutableArray array];
    
    NSString *plistPath = [[NSBundle mainBundle] pathForResource:@"data" ofType:@"plist"];
    NSMutableArray *dataList = [[NSMutableArray alloc] initWithContentsOfFile:plistPath];
    
    [dataList addObjectsFromArray:dataList];
    [dataList addObjectsFromArray:dataList];
    
    for (NSDictionary *dic in dataList) {
        
        FeedModel *feed =[FeedModel new];
        
        feed.userName=dic[@"houseName"];
        feed.avtar=dic[@"hotelLogo"];
        feed.content=dic[@"text"];
        feed.imageArr=dic[@"imgs"];
        feed.time=dic[@"address"];
        
        Feedlayout  *layout=[[Feedlayout alloc] initWithModel:feed identifier:CellName];
        
        [dataArr addObject:layout];
        
    }
    
    [_tableView setData:dataArr];
    [_tableView reloadData];
    
}

@end
