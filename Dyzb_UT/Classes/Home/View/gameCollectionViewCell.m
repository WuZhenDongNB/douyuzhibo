//
//  gameCollectionViewCell.m
//  Dyzb_UT
//
//  Created by liutao on 17/4/13.
//  Copyright © 2017年 UTOUU. All rights reserved.
//

#import "gameCollectionViewCell.h"

@interface gameCollectionViewCell ()

@end
@implementation gameCollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self configUI];
    }
    return self;
}
- (void)configUI {

    _projectImageView = [[UIImageView alloc] init];
    _projectImageView.image = [UIImage imageNamed:@"discovery_gamePlaceholder"];
    _projectImageView.layer.cornerRadius = kW(20);
    _projectImageView.layer.masksToBounds = YES;
    [self.contentView addSubview:_projectImageView];
    [_projectImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.contentView).offset(0);
        make.centerX.equalTo(self.contentView);
        make.size.mas_equalTo(CGSizeMake(kW(40), kW(40)));
    }];

    _projectLable = [[UILabel alloc] init];
    _projectLable.text = @" 英雄联盟";
    _projectLable.font = [UIFont systemFontOfSize:kW(13)];
    _projectLable.textAlignment = NSTextAlignmentCenter;
    _projectLable.textColor = [UIColor blackColor];
    [self.contentView addSubview:_projectLable];
    [_projectLable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_projectImageView.mas_bottom).offset(kH(10));
        make.left.and.right.and.bottom.equalTo(self.contentView).offset(0);
    }];
}
+ (instancetype)collectionViewCellWithCollectionView:(UICollectionView *)collectionview index:(NSIndexPath *)index {
    
    gameCollectionViewCell *cell = [collectionview dequeueReusableCellWithReuseIdentifier:@"gameCollectioncell" forIndexPath:index];
    return cell;
}
@end
