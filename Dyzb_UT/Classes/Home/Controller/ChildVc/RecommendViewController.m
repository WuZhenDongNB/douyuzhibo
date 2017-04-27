//
//  RecommendViewController.m
//  Dyzb_UT
//
//  Created by liutao on 17/4/12.
//  Copyright © 2017年 UTOUU. All rights reserved.
//

#import "RecommendViewController.h"
#import "RecommendHeaderCell.h"
#import "RecommendTableViewCell.h"
#import "SectionHeaderView.h"
#import "recommendModel.h"
#import "recommenBannerModel.h"
#import "AnchorGroupModel.h"
#import "PlayerViewController.h"
@interface RecommendViewController ()<UITableViewDelegate,UITableViewDataSource,RecommendTableViewCellDelegate>
@property (nonatomic, strong) UITableView  *homeTableView;
@property (nonatomic, strong) recommendModel  *recommentHotModel;
@property (nonatomic, strong) NSArray  *dataArray;
@property (nonatomic, strong) NSMutableArray  *listArray;
@property (nonatomic, strong) NSMutableArray  *hotDataArray;
@property (nonatomic, strong) NSMutableArray  *faceDataArray;
@property (nonatomic, strong) NSMutableArray  *gameDataArray;
@property (nonatomic, strong) AnchorGroupModel  *bigDataGroup;
@property (nonatomic, strong) AnchorGroupModel  *prettyGroup;
@property (nonatomic, strong) NSMutableArray<AnchorGroupModel *>  *anchorsGroups;

@end

@implementation RecommendViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    _dataArray = [NSArray array];
    _listArray = [NSMutableArray array];
    _hotDataArray = [NSMutableArray array];
    _anchorsGroups = [NSMutableArray array];
    _faceDataArray = [NSMutableArray array];
    _gameDataArray = [NSMutableArray array];
    [self initializeDataSource];
    [self initializeUserInterFace];
    
}

- (void) initializeDataSource{

    dispatch_group_t group = dispatch_group_create();
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    //请求轮播
    dispatch_group_enter(group);
    NSDictionary *parameters = @{@"version":@"2.480"};
    [DyHttpTool get:URL_Home_Banner params:parameters success:^(id responseObj) {
        
//        NSLog(@"Banner%@",[self dictionaryToJson:responseObj]);
        self.dataArray = [recommenBannerModel mj_objectArrayWithKeyValuesArray:responseObj[@"data"]];
        for (recommenBannerModel *model in self.dataArray) {
            [self.listArray addObject:model.pic_url];
        }
        dispatch_group_leave(group);
        
    } failure:^(NSError *error) {
        
        dispatch_group_leave(group);
    }];

    NSString *timeStr = [NSString stringWithFormat:@"%f", (double)[[NSDate date] timeIntervalSince1970]];
    NSLog(@"%@",timeStr);
    // 请求推荐
    dispatch_group_enter(group);
    NSDictionary *parame = @{@"time":timeStr};
    [DyHttpTool get:URL_Home_Hot params:parame success:^(id responseObj) {
       
        NSArray *dataArray = responseObj[@"data"];
        if (dataArray.count > 0) {
            self.bigDataGroup.tag_name = @"热门";
            self.bigDataGroup.icon_name = @"home_header_hot";
            self.bigDataGroup.icon_url = @"home_header_hot";
            for (int i = 0; i < dataArray.count; i ++) {
                recommendModel *model = [[recommendModel alloc]initWithDic:dataArray[i]];
                [self.bigDataGroup.anchors addObject:model];
            }
        }
        
       dispatch_group_leave(group);
    } failure:^(NSError *error) {
        dispatch_group_leave(group);
    }];
    
    // 请求颜值
    dispatch_group_enter(group);
    NSDictionary *param = @{@"limit":@"4",@"offset":@"0",@"time":timeStr};
    [DyHttpTool get:URL_Home_Face params:param success:^(id responseObj) {
        NSArray *dataArray = responseObj[@"data"];
        if (dataArray.count > 0) {
            self.prettyGroup.tag_name = @"颜值";
            self.prettyGroup.icon_name = @"home_header_phone";
            self.prettyGroup.icon_url = @"home_header_phone";
            for (int i = 0 ; i < dataArray.count;  i ++) {
                recommendModel *model = [[recommendModel alloc] initWithDic:dataArray[i]];
                [self.prettyGroup.anchors addObject:model];
            }
        }
        
//         NSLog(@"颜值数据%@",[self dictionaryToJson:responseObj]);
        dispatch_group_leave(group);
    } failure:^(NSError *error) {
        dispatch_group_leave(group);
    }];
    
    //请求2-12部分游戏数据
    dispatch_group_enter(group);
    [DyHttpTool get:URL_Home_Game params:param success:^(id responseObj) {
        NSArray *dataArray = responseObj[@"data"];
        if (dataArray.count > 0) {
            for (int i = 0; i < dataArray.count; i ++) {
                AnchorGroupModel *group = [[AnchorGroupModel alloc] initWithDic:dataArray[i]];
                [self.anchorsGroups addObject:group];
            }
        }
//        NSLog(@"游戏数据%@",[self dictionaryToJson:responseObj]);
        dispatch_group_leave(group);
    } failure:^(NSError *error) {
        
        dispatch_group_leave(group);
    }];
    
    dispatch_group_notify(group, queue, ^{
       
        dispatch_async(dispatch_get_main_queue(), ^{
            [self.anchorsGroups insertObject:self.prettyGroup atIndex:0];
            [self.anchorsGroups insertObject:self.bigDataGroup atIndex:0];
            [self.homeTableView reloadData];
        });
    });

   }
- (NSString*)dictionaryToJson:(NSDictionary *)dic

{
    
    NSError *parseError = nil;
    
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:dic options:NSJSONWritingPrettyPrinted error:&parseError];
    
    return [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
    
}
- (void) initializeUserInterFace{

    [self.view addSubview:self.homeTableView];

}
- (UITableView *)homeTableView {
    
    if (!_homeTableView) {
        UITableView *tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT - self.tabBarController.tabBar.frame.size.height-108) style:UITableViewStyleGrouped];
        tableView.delegate = self;
        tableView.dataSource = self;
        tableView.backgroundColor = [UIColor whiteColor];
        _homeTableView = tableView;
        tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    }
    return _homeTableView;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.anchorsGroups.count + 1;

}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {

    if (indexPath.section == 0) {
        RecommendHeaderCell *cell = [RecommendHeaderCell cellWithTableview:tableView];
        [cell loadDataWithImageUrlstring:self.listArray];
        cell.BannerBlock = ^(NSInteger index){
        
            // 根据index去取数据
        };
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell;
    }else {
    
        RecommendTableViewCell *cell = [RecommendTableViewCell cellWithTableview:tableView];
        if (indexPath.section == 1) {
            cell.setionType = SectionHeaderStyleHot;

        }else {
            cell.setionType = SectionHeaderStyleOther;
        }
        cell.anchor = self.anchorsGroups[indexPath.section - 1];
        cell.delegate = self;
        return cell;
    }
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0) {
        return kH(215.5);
    }else if(indexPath.section == 1){
        return RECOMMEND_CELL_HEIGHT * 2 + kH(10) ;
    
    } else {
        return RECOMMEND_CELL_HEIGHT;
    }
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    if (section == 0) {
        return 0.01;
    }else {
    return kH(44);
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return 1;
}
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    if (section == 0) {
        return nil;
    }else {
        SectionHeaderView *header = [[SectionHeaderView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, kH(44))];
        // 添加手势
        header.titleLabel.text = self.anchorsGroups[section-1].tag_name;
        [header.titleImageView sd_setImageWithURL:[NSURL URLWithString:self.anchorsGroups[section -1].icon_url] placeholderImage:[UIImage imageNamed:@"home_header_hot"]];
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(sectionHeaderViewTapped:)];
        header.tag = section - 1;
        [header addGestureRecognizer:tap];
        return header;
    }
}
#pragma mark - 手势点击处理

- (void)sectionHeaderViewTapped:(UIGestureRecognizer *)tap
{
    NSLog(@"%s %ld", __FUNCTION__, tap.view.tag);
    NSLog(@"点击到更多页面%ld",tap.view.tag);
}
#pragma mark - recommendcell /delegate
- (void)recommendTableViewCell:(RecommendTableViewCell *)cell didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
//处理cell的点击事件
    PlayerViewController *player = [[PlayerViewController alloc] init];
    player.roomModel = self.anchorsGroups[indexPath.section].anchors[indexPath.item];
    [self presentViewController:player animated:YES completion:nil];

}
- (AnchorGroupModel *)bigDataGroup {
    if (!_bigDataGroup) {
        _bigDataGroup = [[AnchorGroupModel alloc] init];
    }
    return _bigDataGroup;
}
- (AnchorGroupModel *)prettyGroup {
    if (!_prettyGroup) {
        _prettyGroup = [[AnchorGroupModel alloc] init];
    }
    return _prettyGroup;
}
- (NSMutableArray *)anchorsGroups {
    if (!_anchorsGroups) {
        _anchorsGroups  = [NSMutableArray array];
    }
    return _anchorsGroups;
}
@end
