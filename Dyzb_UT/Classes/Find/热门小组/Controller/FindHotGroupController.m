//
//  FindHotGroupController.m
//  Dyzb_UT
//
//  Created by 孙好运 on 2017/4/20.
//  Copyright © 2017年 UTOUU. All rights reserved.
//

#import "FindHotGroupController.h"

#import "FindHotGroupCell.h"

@interface FindHotGroupController ()<UITableViewDataSource,UITableViewDelegate>

@property (nonatomic,strong) UITableView *tableView;

@property (nonatomic,strong) NSArray *imageArr;
@property (nonatomic,strong) NSArray *titleArr;

@end

@implementation FindHotGroupController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.view.backgroundColor = [UIColor whiteColor];
    
    self.navigationItem.title = @"热门小组";
    
    
    _imageArr = @[@"0",@"2",@"3",@"4"];
    _titleArr = @[@"Whtie55开",@"蛋糕",@"二条",@"云中凤凰"];
    
    [self creatTableView];
}

-(void)creatTableView{
    
    _tableView = [[UITableView alloc]initWithFrame:self.view.frame];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    
    UIView *view = [[UIView alloc]init];
    _tableView.tableFooterView = view;
    [self.view addSubview:_tableView];
}

#pragma tableView的代理

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _titleArr.count;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 100;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    FindHotGroupCell *cell = [_tableView dequeueReusableCellWithIdentifier:@"cell"];
    
    if (!cell) {
        
        cell = [[FindHotGroupCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.headerImageView.image = [UIImage imageNamed:_imageArr[indexPath.row]];
    cell.nameLabel.text = _titleArr[indexPath.row];
    
    return cell;
}


@end
