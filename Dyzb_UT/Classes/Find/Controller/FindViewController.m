//
//  FindViewController.m
//  Dyzb_UT
//
//  Created by liutao on 17/4/11.
//  Copyright © 2017年 UTOUU. All rights reserved.
//

#import "FindViewController.h"

#import "BaseItemCellModel.h"
#import "FindCellModel.h"
#import "FindViewModel.h"
#import "FindTableViewCell.h"

#import "FinddYnamicCell.h"

#import "Masonry.h"

@interface FindViewController ()<UITableViewDataSource,UITableViewDelegate>

@property (nonatomic,strong) UITableView *tableView;

@property (nonatomic,strong) NSArray *items;

//前两组的文字数组
@property (nonatomic,strong) NSArray *titleArr;
//图片数组
@property (nonatomic,strong) NSArray *imageArr;

@end

@implementation FindViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
     self.navigationItem.title = @"发现";
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.edgesForExtendedLayout = UIRectEdgeNone;
    
    _titleArr = @[@"鱼吧",@"热门视频",@"排行榜",@"热门小组"];
    _imageArr = @[@"0",@"2",@"3",@"4"];
    
    [self creatUI];
    
//    [self getData];
}

-(void)creatUI{
    
    _tableView = [[UITableView alloc]initWithFrame:self.view.frame style:UITableViewStylePlain];
    _tableView.dataSource = self;
    _tableView.delegate = self;
    _tableView.separatorStyle = UITableViewCellEditingStyleNone;
    UIView *view = [[UIView alloc]init];
    _tableView.tableFooterView = view;
    [self.view addSubview:_tableView];
    
}

-(void)getData{
    
    FindViewModel *data = [FindViewModel new];
    
    data.returnBlock = ^(NSArray *arr){
        _items = arr;
    };
    [data getDataSource];
    
    [_tableView reloadData];
}

#pragma tableView delegate dataSource

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    
    return  1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 3;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
    
    if (indexPath.row == 0)
    {
        FindTableViewCell *cell = [_tableView dequeueReusableCellWithIdentifier:@"cell"];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        
        if (!cell) {
            
            cell = [[FindTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
        }
        
        cell.titleArr = _titleArr;
        cell.imageArr = _imageArr;
        cell.isShow = NO;
        return cell;
    }
    else if (indexPath.row == 1)
    {
        FindTableViewCell *cell = [_tableView dequeueReusableCellWithIdentifier:@"cell"];
        if (!cell) {
            
            cell = [[FindTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
        }
        
        cell = [[FindTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
//        cell.titleStr = @"游戏中心";
        cell.titleArr = _titleArr;
        cell.imageArr = _imageArr;
        cell.isShow = YES;
        return cell;
    }else{
        
        FinddYnamicCell *cell = [_tableView dequeueReusableCellWithIdentifier:@"cell"];
        if (!cell) {
            
            cell = [[FinddYnamicCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
        }
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        
        return cell;
    }
    
    
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row == 0) {
        return 120;
    }else if (indexPath.row == 1)
    {
        return 150;
    }
    return 350;
}

@end
