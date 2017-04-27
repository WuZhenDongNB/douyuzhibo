//
//  FindHotGroupCell.m
//  Dyzb_UT
//
//  Created by 孙好运 on 2017/4/20.
//  Copyright © 2017年 UTOUU. All rights reserved.
//

#import "FindHotGroupCell.h"

@implementation FindHotGroupCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self initView];
    }
    return self;
}

-(void)initView{
    
    _headerImageView = [UIImageView new];
    _headerImageView.image = [UIImage imageNamed:@"3"];
    [self.contentView addSubview:_headerImageView];
    
    _nameLabel = [UILabel new];
    _nameLabel.text = @"White55开";
    _nameLabel.font = [UIFont systemFontOfSize:15];
    _nameLabel.textColor = [UIColor blackColor];
    [self.contentView addSubview:_nameLabel];
    
    _titleLabel = [UILabel new];
    _titleLabel.font = [UIFont systemFontOfSize:13];
    _titleLabel.text = @"White55开的鱼吧";
    _titleLabel.textColor = [UIColor grayColor];
    [self.contentView addSubview:_titleLabel];
    
    _focusCountLabel = [UILabel new];
    _focusCountLabel.text = @"关注人数：666";
    _focusCountLabel.textColor = [UIColor grayColor];
    _focusCountLabel.font = [UIFont systemFontOfSize:13];
    [self.contentView addSubview:_focusCountLabel];
    
    [self makeConstraints];
    
}

-(void)makeConstraints{
    [_headerImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(10);
        make.top.mas_equalTo(10);
        make.bottom.mas_equalTo(-10);
        make.width.mas_equalTo(_headerImageView.mas_height);
    }];
    
    [_nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(_headerImageView);
        make.left.mas_equalTo(_headerImageView.mas_right).offset(5);
    }];
    
    [_focusCountLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.mas_equalTo(_headerImageView);
        make.left.mas_equalTo(_nameLabel);
    }];
    
    [_titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(_nameLabel);
        make.bottom.mas_equalTo(_focusCountLabel.mas_top).offset(-5);
    }];
}

@end
