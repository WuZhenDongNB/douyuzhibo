//
//  FindFishController.m
//  Dyzb_UT
//
//  Created by 孙好运 on 2017/4/17.
//  Copyright © 2017年 UTOUU. All rights reserved.
//

#import "FindFishController.h"

#import "FindFishTitleView.h"

#import "FindFishCell.h"

#import "FindVideoView.h"

#define Height_TitleView   30


@interface FindFishController ()<UICollectionViewDelegate,UICollectionViewDataSource,FindTitleViewDelegate>

@property (nonatomic,strong) FindFishTitleView *titleView;

//二级视频  View
@property (nonatomic,strong) FindVideoView *videoView;

@property(nonatomic,strong)UICollectionView *collectionView;

//标题的名字
@property (nonatomic,strong) NSArray *itemArr;

//二级标题名字
@property (nonatomic,strong) NSArray *videoArr;

@end

@implementation FindFishController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationItem.title = @"鱼吧";
    self.edgesForExtendedLayout = UIRectEdgeNone;
    _itemArr = [NSArray arrayWithObjects:@"精选",@"我的小组",@"主播动态",@"英雄联盟",@"DOTA2",@"客厅游戏",@"王者荣耀",@"户外",@"娱乐综合",nil];
    _videoArr = [NSArray arrayWithObjects:@"全部",@"英雄联盟",@"游戏赛事",@"主机游戏",@"炉石传说",@"DOTA2",@"守望先锋",@"魔兽世界",@"热门网游",@"独立游戏",@"格斗游戏",@"怀旧游戏",nil ];
    
    //创建标题
    [self initTitleView];
    //创建二级标题
    [self initVideoView];
    
    
    [self initCollectionView];
    
}

-(void)initVideoView{
    
    self.videoView = [[FindVideoView alloc]initWithFrame:CGRectMake(0, Height_TitleView, SCREEN_WIDTH, Height_TitleView)];
    self.videoView.nameArr = self.videoArr;
    [self.view addSubview:_videoView];
}

-(void)initTitleView{
    
    self.titleView = [[FindFishTitleView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, Height_TitleView)];
    self.titleView.nameArr = self.itemArr;
    self.titleView.delegate = self;
    [self.view addSubview:_titleView];
    
}

-(void)initCollectionView{
    
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    layout.itemSize = CGSizeMake(SCREEN_WIDTH, SCREEN_HEIGHT-64-2*Height_TitleView);
    layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    layout.minimumLineSpacing = 0.0f;
    layout.sectionInset = UIEdgeInsetsMake(0, 0, 0, 0);
    _collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 2*Height_TitleView, SCREEN_WIDTH, SCREEN_HEIGHT-2*Height_TitleView-64) collectionViewLayout:layout];
    
    _collectionView.backgroundColor = [UIColor clearColor];
    _collectionView.dataSource = self;
    _collectionView.delegate = self;
    _collectionView.pagingEnabled = YES;
    _collectionView.bounces = NO;
    _collectionView.showsHorizontalScrollIndicator = NO;
    
    [_collectionView registerClass:[FindFishCell class] forCellWithReuseIdentifier:@"cell"];
    
    [self.view addSubview:_collectionView];
    
    
}

-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 1;
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return self.itemArr.count;
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    FindFishCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
//    cell.backgroundColor = [UIColor colorWithRed:arc4random_uniform(255)/255.0 green:arc4random_uniform(255)/255.0 blue:arc4random_uniform(255)/255.0 alpha:1];
//    
//    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(100, 100, 100, 100)];
//    label.backgroundColor = [UIColor whiteColor];
//    label.text = [NSString stringWithFormat:@"%ld",indexPath.row];
    
//    [cell addSubview:label];

    if (!cell) {
        cell = [[FindFishCell alloc]init];
    }
    return cell;
}

//结束减速
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    if ([scrollView isKindOfClass:[UICollectionView class]]){
        NSInteger row=(scrollView.contentOffset.x+SCREEN_WIDTH/2.0)/SCREEN_WIDTH;
        self.titleView.curPage = row;
        
    }
}

/*
 * 点击Title的代理方法
 */
-(void)TitleButton_Click:(UIButton *)btn{
    
    NSIndexPath *path  = [NSIndexPath indexPathForRow:btn.tag inSection:0];
    [self.collectionView scrollToItemAtIndexPath:path atScrollPosition:  UICollectionViewScrollPositionLeft  animated:YES];
    
}


@end
