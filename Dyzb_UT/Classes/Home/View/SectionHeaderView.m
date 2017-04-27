//
//  SectionHeaderView.m
//  Dyzb_UT
//
//  Created by liutao on 17/4/13.
//  Copyright © 2017年 UTOUU. All rights reserved.
//

#import "SectionHeaderView.h"

@interface SectionHeaderView ()

@property (nonatomic, strong) UILabel  *moreLable;
@property (nonatomic, strong) UIImageView  *moreImageView;
@end
@implementation SectionHeaderView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self configUI];
    }
    return self;
}

- (void)configUI {
    UIView *lineView = [[UIView alloc] init];
    lineView.backgroundColor = RGB(238, 238, 238);
    [self addSubview:lineView];
    [lineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.right.equalTo(self);
        make.height.mas_offset(kH(10));
    }];
    _titleImageView = [[UIImageView alloc] init];
    _titleImageView.contentMode = UIViewContentModeScaleAspectFit;
    _titleImageView.image = [UIImage imageNamed:@"home_header_hot"];
    [self addSubview:_titleImageView];
    [_titleImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self).offset(kW(3.5));
        make.top.equalTo(lineView.mas_bottom).offset(kH(5.5));
        make.size.mas_equalTo(CGSizeMake(kW(20), kH(20)));
    }];

    _titleLabel = [[UILabel alloc] init];
    _titleLabel.textColor = [UIColor blackColor];
    _titleLabel.font = [UIFont systemFontOfSize:kW(14)];
    _titleLabel.text = @"英雄联盟EDG";
    [self addSubview:_titleLabel];
    [_titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_titleImageView.mas_right).offset(kW(2));
        make.centerY.equalTo(_titleImageView);
        make.right.equalTo(self).offset(-kW(150));
    }];
    
    _moreImageView = [[UIImageView alloc] init];
    _moreImageView.contentMode = UIViewContentModeScaleAspectFit;
    _moreImageView.image = [UIImage imageNamed:@"homeMoreIcon"];
    [self addSubview:_moreImageView];
    [_moreImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.right.equalTo(self).offset(-kW(5.5));
        make.centerY.equalTo(_titleLabel);
        make.size.mas_equalTo(CGSizeMake(kW(12), kW(12)));
    }];
    _moreLable  = [[UILabel alloc] init];
    _moreLable.textColor = [UIColor grayColor];
    _moreLable.text = @"更多";
    _moreLable.textAlignment = NSTextAlignmentRight;
    _moreLable.font = [UIFont systemFontOfSize:kW(12)];
    [self addSubview:_moreLable];
    [_moreLable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(_moreImageView.mas_left).offset(-kW(10));
        make.centerY.equalTo(_titleLabel);
        make.left.equalTo(_titleLabel.mas_right).offset(kW(2));
    }];
    
}
@end
