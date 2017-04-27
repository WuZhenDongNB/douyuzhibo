//
//  RecommendTableViewCell.m
//  Dyzb_UT
//
//  Created by liutao on 17/4/13.
//  Copyright © 2017年 UTOUU. All rights reserved.
//

#import "RecommendTableViewCell.h"
#import "RecommendCollectionFlowLayout.h"
#import "RecommendCollectionViewCell.h"
static BOOL isReused = NO;

@interface RecommendTableViewCell () <UICollectionViewDataSource, UICollectionViewDelegate>
@property (nonatomic, weak) UICollectionView *recommendCollectionView;
@property (nonatomic, strong) NSMutableArray  *model;
@end

@implementation RecommendTableViewCell

+ (instancetype)cellWithTableview:(UITableView *)tableview {

    RecommendTableViewCell *cell = [tableview dequeueReusableCellWithIdentifier:@"recommendCell"];
    isReused = YES;
    if (!cell) {
        cell = [[RecommendTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"recommendCell"];
        isReused = NO;
    }
    return cell;
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {

    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self configUI];
    }
    return self;
}
- (void)configUI {
    
    self.contentView.backgroundColor = [UIColor whiteColor];
    [self setupCollectionView];

}

- (void)layoutSubviews {
    [super layoutSubviews];
    self.recommendCollectionView.frame = CGRectMake(0, 0, SCREEN_WIDTH, self.setionType == SectionHeaderStyleHot ? RECOMMEND_CELL_HEIGHT * 2 + kH(10):RECOMMEND_CELL_HEIGHT);

}
#pragma mark - lazy load
- (void)setupCollectionView
{
    UICollectionView *collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, RECOMMEND_CELL_HEIGHT)collectionViewLayout:[[RecommendCollectionFlowLayout alloc] init]];
    self.recommendCollectionView = collectionView;
    [self.contentView addSubview:collectionView];
    collectionView.backgroundColor = [UIColor whiteColor];
    collectionView.dataSource = self;
    collectionView.delegate = self;
    
    [self.contentView addSubview:collectionView];
    [collectionView registerClass:[RecommendCollectionViewCell class] forCellWithReuseIdentifier:@"recommendCollection"];
}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.setionType == SectionHeaderStyleHot?8:4;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    RecommendCollectionViewCell *cell = [RecommendCollectionViewCell collectionViewCellWithCollectionView:collectionView index:indexPath];
    if (indexPath.item < self.anchor.anchors.count) {
        
        cell.recommedModel = self.anchor.anchors[indexPath.item];
    }
    return cell;
}

- (void)initDataWithModel:(NSMutableArray *)model {

    self.model = model;
    if (isReused) {
        [self.recommendCollectionView reloadData];
    }

}
- (void)setAnchor:(AnchorGroupModel *)anchor {
    _anchor = anchor;
    if (isReused) {
        [self.recommendCollectionView reloadData];
    }

}
#pragma mark - collectionView 代理

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    if ([self.delegate respondsToSelector:@selector(recommendTableViewCell:didSelectItemAtIndexPath:)]) {
        [self.delegate recommendTableViewCell:self didSelectItemAtIndexPath:indexPath];
    }
}

@end
