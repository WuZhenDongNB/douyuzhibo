//
//  FindVedioCell.m
//  Dyzb_UT
//
//  Created by 孙好运 on 2017/4/19.
//  Copyright © 2017年 UTOUU. All rights reserved.
//

#import "FindVedioCell.h"

@implementation FindVedioCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        self.backgroundColor = [UIColor whiteColor];
        
        [self initView];
    }
    return self;
    
}

-(void)initView{
    _vedioImageView = [UIImageView new];
    _vedioImageView.image = [UIImage imageNamed:@"cover"];
    _vedioImageView.layer.masksToBounds = YES;
    _vedioImageView.layer.cornerRadius = 5;
    [self addSubview:_vedioImageView];
    
    _titleLabel = [UILabel new];
    _titleLabel.text = @"王者大神带你飞";
    _titleLabel.font = [UIFont systemFontOfSize:15];
    _titleLabel.numberOfLines = 0;
    [self addSubview:_titleLabel];
    
    _headerImageView = [UIImageView new];
    _headerImageView.image = [UIImage imageNamed:@"headerIcon"];
    [self addSubview:_headerImageView];
    
    _nameLabel = [UILabel new];
    _nameLabel.text = @"蛋糕";
    _nameLabel.font = [UIFont systemFontOfSize:13];
    _nameLabel.textColor = [UIColor grayColor];
    [self addSubview:_nameLabel];
    
    _vedioIconImageView = [UIImageView new];
    _vedioIconImageView.image = [UIImage imageNamed:@"play"];
    
    [self addSubview:_vedioIconImageView];
    
    _playCountLabel = [UILabel new];
    _playCountLabel.text = @"1000";
    _playCountLabel.font = [UIFont systemFontOfSize:13];
    _playCountLabel.textColor = [UIColor grayColor];
    [self addSubview:_playCountLabel];
    
    [self makeConstraints];
}

-(void)makeConstraints{
    
    [_vedioImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(10);
        make.top.mas_equalTo(5);
        make.bottom.mas_equalTo(-5);
        make.width.mas_equalTo(100);
    }];
    
    [_titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(_vedioImageView.mas_right).offset(10);
        make.top.mas_equalTo(_vedioImageView.mas_top).offset(5);
        
    }];
    
    [_vedioIconImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(_titleLabel);
        make.bottom.mas_equalTo(_vedioImageView);
        make.width.height.mas_equalTo(15);
    }];
    
    [_playCountLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(_vedioIconImageView.mas_right).offset(10);
        make.bottom.mas_equalTo(_vedioIconImageView);
    }];
    
    [_headerImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(_vedioIconImageView);
        make.bottom.mas_equalTo(_vedioIconImageView.mas_top).offset(-5);
        make.width.height.mas_equalTo(_vedioIconImageView);
    }];
    
    [_nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(_headerImageView.mas_right).offset(10);
        make.bottom.mas_equalTo(_headerImageView);
    }];
}


@end
