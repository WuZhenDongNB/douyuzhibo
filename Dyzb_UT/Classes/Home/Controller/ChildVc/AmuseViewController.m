//
//  AmuseViewController.m
//  Dyzb_UT
//
//  Created by liutao on 17/4/12.
//  Copyright © 2017年 UTOUU. All rights reserved.
//

#import "AmuseViewController.h"
#import "RecommendTableViewCell.h"
#import "GameHeaderCell.h"
#import "SectionHeaderView.h"
#import "AnchorGroupModel.h"
@interface AmuseViewController ()<UITableViewDelegate,UITableViewDataSource,GameHeaderCellDelefgate,RecommendTableViewCellDelegate>
@property (nonatomic, strong) UITableView  *gameTableView;
@property (nonatomic, strong) NSMutableArray<AnchorGroupModel *>  *anchorsGroups;
@end

@implementation AmuseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self initializeDataSource];
    [self initializeUserInterFace];
}

- (void) initializeDataSource {
    // 娱乐的数据请求
    [DyHttpTool get:URL_Home_Amuse_Detail params:nil success:^(id responseObj) {
        NSArray *dataArray = responseObj[@"data"];
        if (dataArray.count > 0) {
            for (int i = 0; i < dataArray.count; i ++) {
                AnchorGroupModel *group = [[AnchorGroupModel alloc] initWithDic:dataArray[i]];
                [self.anchorsGroups addObject:group];
            }
            [self.gameTableView reloadData];
        }
    } failure:^(NSError *error) {
        
    }];
}
- (void) initializeUserInterFace {
    
    [self.view addSubview:self.gameTableView];
}
- (UITableView *)gameTableView {
    
    if (!_gameTableView) {
        UITableView *tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT - self.tabBarController.tabBar.frame.size.height-108) style:UITableViewStyleGrouped];
        tableView.delegate = self;
        tableView.dataSource = self;
        tableView.backgroundColor = [UIColor whiteColor];
        _gameTableView = tableView;
        tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    }
    return _gameTableView;
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.anchorsGroups.count + 1;
    
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (indexPath.section == 0) {
        GameHeaderCell *cell = [GameHeaderCell cellWithTableview:tableView];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        cell.anchors = self.anchorsGroups.mutableCopy;
        return cell;
    }else {
        
        RecommendTableViewCell *cell = [RecommendTableViewCell cellWithTableview:tableView];
         cell.setionType = SectionHeaderStyleOther;
        cell.anchor = self.anchorsGroups[indexPath.section - 1];
        cell.delegate = self;
        return cell;
    }
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0) {
        return kH(200);
    }else {
        return RECOMMEND_CELL_HEIGHT;
        
    }
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    if (section == 0) {
        return 1;
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
        header.titleLabel.text = self.anchorsGroups[section-1].tag_name;
        [header.titleImageView sd_setImageWithURL:[NSURL URLWithString:self.anchorsGroups[section -1].icon_url] placeholderImage:[UIImage imageNamed:@"home_header_hot"]];
        // 添加手势
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(sectionHeaderViewTapped:)];
        header.tag = section - 1;
        [header addGestureRecognizer:tap];
        return header;
    }
}
- (NSMutableArray *)anchorsGroups {
    if (!_anchorsGroups) {
        _anchorsGroups  = [NSMutableArray array];
    }
    return _anchorsGroups;
}
#pragma mark - 手势点击处理

- (void)sectionHeaderViewTapped:(UIGestureRecognizer *)tap
{
    NSLog(@"%s %ld", __FUNCTION__, tap.view.tag);
    NSLog(@"点击到更多页面%ld",tap.view.tag);
}

- (void)recommendTableViewCell:(RecommendTableViewCell *)cell didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    
}
- (void)gameHeaderCell:(GameHeaderCell *)gameHeaderCell didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    
    
}


@end
