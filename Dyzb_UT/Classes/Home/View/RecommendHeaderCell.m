//
//  RecommendHeaderCell.m
//  Dyzb_UT
//
//  Created by liutao on 17/4/12.
//  Copyright © 2017年 UTOUU. All rights reserved.
//

#import "RecommendHeaderCell.h"

@interface RecommendHeaderCell ()<SDCycleScrollViewDelegate>
@property (nonatomic, strong) SDCycleScrollView  *cycleScrollView;
@property (nonatomic, strong) UIView  *meauView;
@end
@implementation RecommendHeaderCell


+ (instancetype)cellWithTableview:(UITableView *)tableview {

    RecommendHeaderCell *cell = [tableview dequeueReusableCellWithIdentifier:@"recommendHeaderCell"];
    if (!cell) {
        cell = [[RecommendHeaderCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"recommendHeaderCell"];
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

    [self.contentView addSubview:self.cycleScrollView];
    self.meauView = [[UIView alloc] initWithFrame:CGRectMake(0, kH(150.5), SCREEN_WIDTH, kH(65))];
    self.meauView.backgroundColor = [UIColor whiteColor];
    [self.contentView addSubview:self.meauView];
    NSArray *imageArray = @[@"homeNewItem_rankingList",@"homeNewItem_msg",@"homeNewItem_Activity",@"homeNewItem_allLive"];
    NSArray *titleArray = @[@"排行榜",@"消息",@"活动",@"全部直播"];
    for (NSInteger i = 0; i < imageArray.count; i ++) {
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        [btn setImage:[UIImage imageNamed:imageArray[i]] forState:UIControlStateNormal];
        [btn setTitle:titleArray[i] forState:UIControlStateNormal];
        btn.titleEdgeInsets = UIEdgeInsetsMake(0, -btn.imageView.frame.size.width- 20, -btn.imageView.frame.size.height - 40.0/2, 0);
        btn.imageEdgeInsets = UIEdgeInsetsMake(-btn.titleLabel.intrinsicContentSize.height - 20.0/2, - 10, 0, -btn.titleLabel.intrinsicContentSize.width);
        btn.titleLabel.font = [UIFont systemFontOfSize:kW(12)];
        [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [self.meauView addSubview:btn];
        [btn mas_makeConstraints:^(MASConstraintMaker *make) {
           
            make.left.equalTo(self.meauView).offset((kW(93) * i) + kW(15));
            make.top.equalTo(self.meauView).offset(kH(20));
            make.size.mas_equalTo(CGSizeMake(kW(60), kH(44)));
        }];
        
    }

}
- (void)loadDataWithImageUrlstring:(NSArray *)images {

    self.cycleScrollView.imageURLStringsGroup = images;

}
- (SDCycleScrollView *)cycleScrollView {

    return DY_LAZY(_cycleScrollView, ({
    
        SDCycleScrollView *cyclescrollview = [SDCycleScrollView cycleScrollViewWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, kSUBSCREEN_H(150)) shouldInfiniteLoop:YES imageNamesGroup:nil];
        cyclescrollview.delegate = self;
        cyclescrollview.placeholderImage = [UIImage imageNamed:@"dyla_视频封面_placeholder"];
        cyclescrollview.currentPageDotColor = [UIColor orangeColor];
        cyclescrollview.bannerImageViewContentMode = UIViewContentModeScaleToFill;
        cyclescrollview.pageControlStyle = SDCycleScrollViewPageContolStyleAnimated;
        cyclescrollview.pageControlStyle = SDCycleScrollViewPageContolAlimentRight;
        cyclescrollview;
    }));
}
- (void)cycleScrollView:(SDCycleScrollView *)cycleScrollView didSelectItemAtIndex:(NSInteger)index {
    
    if (_BannerBlock) {
        _BannerBlock(index);
    }
    
}
@end
