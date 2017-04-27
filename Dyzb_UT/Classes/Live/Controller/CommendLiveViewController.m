//
//  CommendLiveViewController.m
//  MyShow
//
//  Created by Apple on 11/4/1`7.
//  Copyright © 2016年 wuzhendong. All rights reserved.
//

#import "CommendLiveViewController.h"
#import "PubuliuCollectionViewCell.h"
#import "CustomLayout.h"
#import "CommentModel.h"
#import "BANetManager.h"
#import "MoveDragButton.h"
#import "DongDonRefreshHeader.h"
#import "PlayerViewControllerViewController.h"
#define WIDTH [UIScreen mainScreen].bounds.size.width


//#import "PlayerViewController.h"
@interface CommendLiveViewController ()<UICollectionViewDelegate,UICollectionViewDataSource,WaterflowLayoutDelegate>
{
    
    NSMutableArray  *_TableViewdataArray;
    
    NSInteger _offset;
  
    BOOL _isPulling;

    
}

@property(nonatomic,strong)UICollectionView *liveColletionView;
@property(nonatomic,strong)MoveDragButton  * changeShowTypeBtn;
@property(nonatomic,assign)BOOL singer;
@property(nonatomic,strong)UIButton *backToTopBtn;
@property (nonatomic, strong) BAURLSessionTask  *tasks;

@end


static NSString *ID = @"ViewCell";

static NSString *singeId = @"cell";

@implementation CommendLiveViewController
-(void)viewWillAppear:(BOOL)animated{
    
    [super viewWillAppear:animated];
    
//    self.tabBarController.tabBar.hidden =YES;
    

}
-(UIButton *)backToTopBtn{
    if (!_backToTopBtn) {
        CGRect rect = self.view.frame;

        _backToTopBtn=[[UIButton alloc]initWithFrame:CGRectMake(WIDTH-50,rect.size.height-60, 30,30)];
        _backToTopBtn.hidden = YES;
        _backToTopBtn.backgroundColor=[UIColor clearColor];
        [_backToTopBtn setBackgroundImage:[UIImage imageNamed:@"Group Copy 2"] forState:(UIControlStateNormal)];
        [_backToTopBtn addTarget:self action:@selector(backToTopBtnTouch) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:_backToTopBtn];
    }return _backToTopBtn;
    
}
-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
    CGFloat height = [UIScreen mainScreen].bounds.size.height/2;
    
    if (scrollView.contentOffset.y>height) {
        self.backToTopBtn.hidden = NO;
    }else{
        
        self.backToTopBtn.hidden = YES;
        
    }
    
    
}
-(void)backToTopBtnTouch{
    
    NSIndexPath *path = [NSIndexPath indexPathForItem:0 inSection:0];
    
    [self.liveColletionView scrollToItemAtIndexPath:path atScrollPosition:UICollectionViewScrollPositionTop    animated:YES];
    
    
}
-(MoveDragButton *)changeShowTypeBtn{
   
    if (!_changeShowTypeBtn) {
        _changeShowTypeBtn = [[MoveDragButton  alloc]initWithFrame:CGRectMake(WIDTH-50, 10, 30, 30)];
        
        _changeShowTypeBtn.selected = YES;
        [_changeShowTypeBtn setDragEnable:YES];
        [_changeShowTypeBtn setAdsorbEnable:YES];
        
        [_changeShowTypeBtn addTarget:self action:@selector(changeShowType:) forControlEvents:UIControlEventTouchUpInside];
        [_changeShowTypeBtn setBackgroundImage:[UIImage imageNamed:@"商品列表样式1"] forState:UIControlStateNormal];
        [_changeShowTypeBtn setBackgroundImage:[UIImage imageNamed:@"商品列表样式2"] forState:UIControlStateSelected];
    }
    return _changeShowTypeBtn;
    
}
-(void)changeShowType:(UIButton*)sender{
    self.singer = sender.selected;
    sender.selected = !sender.selected;
    if (_singer) {
        [self createSinger];
    }else{
        [self createDouble];
        
    }
    
    
}
-(void)createSinger{
    
     NSArray *array = [_liveColletionView indexPathsForVisibleItems];
    NSIndexPath *path = array[0];
    
    CGRect rect = self.view.frame;
    rect.size.height = self.view.frame.size.height -(49+64);
     UICollectionViewFlowLayout *laout = [[UICollectionViewFlowLayout alloc]init];
    laout.scrollDirection = UICollectionViewScrollDirectionVertical;
    laout.minimumLineSpacing = 10.0;//行间距(最小值)
    laout.minimumInteritemSpacing = 0;//item间距(最小值)
    laout.itemSize = CGSizeMake(WIDTH, 350);//item的大小
     self.liveColletionView.collectionViewLayout = laout;

    [self.liveColletionView reloadData];
    [self.liveColletionView layoutIfNeeded];
    [self.liveColletionView setNeedsDisplay];
   
    
    [self.liveColletionView scrollToItemAtIndexPath:path atScrollPosition:UICollectionViewScrollPositionTop    animated:YES];
    
}
-(void)createDouble{
    NSArray *array = [_liveColletionView indexPathsForVisibleItems];
    NSIndexPath *path = array[0];
    CustomLayout * layout = [[CustomLayout alloc] init];
    layout.columnMargin = 5;
    layout.columnsCount = 2;
    layout.rowMargin = 5;
    layout.sectionInset = UIEdgeInsetsMake(5, 5, 5, 5);
    layout.delegate = self;
    
    CGRect rect = self.view.frame;
    
    rect.size.height = self.view.frame.size.height -(49+64);
    [self.liveColletionView  registerClass:[PubuliuCollectionViewCell class] forCellWithReuseIdentifier:ID];
    self.liveColletionView.collectionViewLayout = layout;
    
    [self.liveColletionView reloadData];
    [self.liveColletionView layoutIfNeeded];
    [self.liveColletionView setNeedsDisplay];
  [self.liveColletionView scrollToItemAtIndexPath:path atScrollPosition:UICollectionViewScrollPositionTop   animated:YES];
    
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    _TableViewdataArray =[[NSMutableArray alloc]init];
    self.singer = NO;
    _offset = 1;
    [self CreatUI];
    [self.view addSubview:self.changeShowTypeBtn];
    [self.view bringSubviewToFront:self.changeShowTypeBtn];
    [self CreatData];
    [self CreatRefresh];
}

-(void)CreatRefresh{
       _liveColletionView.mj_header = [DongDonRefreshHeader headerWithRefreshingBlock:^{
        
        _offset = 1;
           [_TableViewdataArray removeAllObjects];
        [self CreatData];
        
    }];
    
    
    _liveColletionView.mj_footer = [MJRefreshAutoNormalFooter footerWithRefreshingBlock:^{
        
        _offset++;
        
        [self CreatData];

    }];
}

-(void)endRefresh{
    [_liveColletionView.mj_header endRefreshing];
    [_liveColletionView.mj_footer endRefreshing];
}

-(void)CreatUI{
  CustomLayout * layout = [[CustomLayout alloc] init];
    layout.columnMargin = 5;
    layout.columnsCount = 2;
    layout.rowMargin = 5;
    layout.sectionInset = UIEdgeInsetsMake(5, 5, 5, 5);
    layout.delegate = self;
    
    CGRect rect = self.view.frame;
    
    rect.size.height = self.view.frame.size.height -(49+64);
    
    //
    self.liveColletionView= [[UICollectionView alloc] initWithFrame:rect collectionViewLayout:layout];
    [self.view addSubview:self.liveColletionView];
    
    [self.liveColletionView  registerClass:[PubuliuCollectionViewCell class] forCellWithReuseIdentifier:ID];
     [self.liveColletionView  registerClass:[singerCollectionViewCell class] forCellWithReuseIdentifier:singeId ];
   
    self.liveColletionView.dataSource = self;
    self.liveColletionView.delegate = self;
    [self.view addSubview:self.liveColletionView];
    
    self.liveColletionView.backgroundColor = [UIColor whiteColor];

}


- (CGFloat)waterflowLayout:(CustomLayout*)waterflowLayout heightForWidth:(CGFloat)width atIndexPath:(NSIndexPath *)indexPath
{

      int y =300 +  (arc4random() % 80);
    return y;
    
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
   
    return _TableViewdataArray.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    
     CommentModel *model = _TableViewdataArray[indexPath.row];
    

    if (_singer) {
        singerCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:singeId forIndexPath:indexPath];
                 [cell configWithModel:model];
        cell.backgroundColor = [UIColor whiteColor];
        return cell;
        
    }
    else{
        PubuliuCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:ID forIndexPath:indexPath];
                 [cell configWithModel:model];
        
        return cell;
        
    }

    
}

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    
    CommentModel *model = _TableViewdataArray[indexPath.row];
    
       PlayerViewControllerViewController *player = [[PlayerViewControllerViewController alloc] init];
    
        player.playurl = model.flv;
    
        player.imageUrl = model.bigpic;
    
        player.lives = _TableViewdataArray;
    
        player.currentIndex = indexPath.row-1;
    
        [self presentViewController:player animated:YES completion:nil];

    }

//- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
//    
//     CommentModel *model = _TableViewdataArray[indexPath.row];
//    
//    PlayerViewController *player = [[PlayerViewController alloc] init];
//    
//    player.playurl = model.flv;
//    
//    player.imageUrl = model.bigpic;
//    
//    player.lives = _TableViewdataArray;
//    
//    player.currentIndex = indexPath.row-1;
//    
//    [self presentViewController:player animated:YES completion:nil];
//    
//    
//    
//}
//
//
-(void)CreatData{
    
    self.tasks = [BANetManager ba_requestWithType:BAHttpRequestTypeGet withUrlString:[NSString stringWithFormat:@"http://live.9158.com/Fans/GetHotLive?page=%ld",_offset ] withParameters:nil withSuccessBlock:^(id response) {
        
    [self endRefresh];
   
        if (response&&([[response objectForKey:@"code"] integerValue]==100)) {
            
            NSDictionary *datadic =[response objectForKey:@"data"];
            
            NSArray *array = [datadic objectForKey:@"list"];
            
            for (NSDictionary *dic in array) {
                
                CommentModel *model = [[CommentModel alloc]init];
                
                [model setValuesForKeysWithDictionary:dic];
                
                [_TableViewdataArray addObject:model];
                
                [_liveColletionView reloadData];
                
            }
            }
        return;
    } withFailureBlock:^(NSError *error) {
        [self endRefresh];
    } progress:^(int64_t bytesProgress, int64_t totalBytesProgress) {
        
    }];



}

@end
