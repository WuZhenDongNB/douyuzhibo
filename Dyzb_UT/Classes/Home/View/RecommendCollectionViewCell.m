//
//  RecommendCollectionViewCell.m
//  Dyzb_UT
//
//  Created by liutao on 17/4/13.
//  Copyright © 2017年 UTOUU. All rights reserved.
//

#import "RecommendCollectionViewCell.h"

@interface RecommendCollectionViewCell()

@property (nonatomic, strong) UIImageView  *recommendImageView;
@property (nonatomic, strong) UILabel  *nameLable;
@property (nonatomic, strong) UILabel  *contentLable;
@property (nonatomic, strong) UILabel  *onlineLable;
@property (nonatomic, strong) UIImageView  *imageUser;
@property (nonatomic, strong) UIImageView  *onlineImageView;
@end
@implementation RecommendCollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self configUI];
    }
    return self;
}
+ (instancetype)collectionViewCellWithCollectionView:(UICollectionView *)collectionview index:(NSIndexPath *)index {

    RecommendCollectionViewCell *cell = [collectionview dequeueReusableCellWithReuseIdentifier:@"recommendCollection" forIndexPath:index];
    return cell;
}



- (void)configUI {
    _recommendImageView = [[UIImageView alloc] init];
    _recommendImageView.contentMode = UIViewContentModeScaleAspectFill;
    _recommendImageView.image = [UIImage imageNamed:@"dyla_视频封面_placeholder"];
    _recommendImageView.layer.cornerRadius = 5;
    _recommendImageView.layer.masksToBounds = YES;
    [self.contentView addSubview:_recommendImageView];
    [_recommendImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.and.left.right.equalTo(self.contentView);
        make.bottom.equalTo(self.contentView).offset(-kH(20));
    }];
    
    UIView *bgView = [[UIView alloc] init];
    bgView.backgroundColor = [UIColor colorWithWhite:0.2 alpha:0.0];
    
    [self.contentView addSubview:bgView];
    [bgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self.contentView).offset(-kH(20));
        make.left.and.right.equalTo(self.contentView).offset(0);
    }];
    _imageUser = [[UIImageView alloc] init];
    _imageUser.image = [UIImage imageNamed:@"home_live_player_normal"];
    _imageUser.contentMode = UIViewContentModeScaleAspectFit;
    [bgView addSubview:_imageUser];
    [_imageUser mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.and.left.and.bottom.equalTo(bgView).offset(0);
        make.width.mas_offset(kW(15));
    }];
    _onlineImageView = [[UIImageView alloc] init];
    _onlineImageView.image = [UIImage imageNamed:@"home_live_player_normal"];
    _onlineImageView.contentMode = UIViewContentModeScaleAspectFit;
    [self.contentView addSubview:_onlineImageView];
    
    [_onlineImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.contentView).offset(kH(5));
        make.right.equalTo(self.contentView).offset(-kW(40));
        make.size.mas_equalTo(CGSizeMake(kW(15), kH(15)));
    }];
    
    _contentLable = [[UILabel alloc] init];
    _contentLable.font = [UIFont systemFontOfSize:kW(13)];
    _contentLable.textColor = [UIColor blackColor];
    _contentLable.text = @"一定上王者啊";
    [self.contentView addSubview:_contentLable];
    [_contentLable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_recommendImageView.mas_bottom).offset(0);
        make.left.and.right.bottom.equalTo(self.contentView).offset(0);
    }];
    
    _onlineLable = [[UILabel alloc] init];
    _onlineLable.text = @"5万";
    _onlineLable.font = [UIFont systemFontOfSize:kW(10)];
    _onlineLable.textColor = [UIColor whiteColor];
    [self.contentView addSubview:_onlineLable];
    [_onlineLable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(_onlineImageView);
        make.left.equalTo(_onlineImageView.mas_right).offset(0);
        make.right.equalTo(self.contentView).offset(0);
        make.height.mas_offset(kH(15));
    }];
    _nameLable = [[UILabel alloc] init];
    _nameLable.text = @"5万";
    _nameLable.font = [UIFont systemFontOfSize:kW(10)];
    _nameLable.textColor = [UIColor whiteColor];
    
    [bgView addSubview:_nameLable];
   [_nameLable mas_makeConstraints:^(MASConstraintMaker *make) {
       make.left.equalTo(_imageUser.mas_right).offset(0);
       make.top.and.bottom.equalTo(bgView).offset(0);
   }];
    
}

- (void)setRecommedModel:(recommendModel *)recommedModel {


    _recommedModel = recommedModel;
    [self.recommendImageView sd_setImageWithURL:[NSURL URLWithString:recommedModel.vertical_src] placeholderImage:[UIImage imageNamed:@"dyla_视频封面_placeholder"]];
    self.onlineLable.text = [NSString stringWithFormat:@"%ld",recommedModel.online];
    self.nameLable.text = recommedModel.nickname;
    self.contentLable.text = recommedModel.room_name;

}
- (void)layoutSubviews {

    [super layoutSubviews];
    
   

}
@end
