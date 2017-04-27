//
//  FindCollectionViewCell.m
//  Dyzb_UT
//
//  Created by 孙好运 on 2017/4/13.
//  Copyright © 2017年 UTOUU. All rights reserved.
//

#import "FindCollectionViewCell.h"

#import "Masonry.h"

@implementation FindCollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame{
    
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        [self creatUI];
    }
    return self;
    
}

-(void)creatUI{
    _imageView = [UIImageView new];
//    _imageView.backgroundColor = [UIColor redColor];
    _imageView.layer.cornerRadius=20;// 将图层的边框设置为圆角
    _imageView.layer.masksToBounds=YES;
    
    [self.contentView addSubview:_imageView];
    
    _titleLabel = [UILabel new];
    
    [self.contentView addSubview:_titleLabel];
    
    [_imageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(10);
        make.centerX.mas_equalTo(self.contentView);
        make.height.width.mas_equalTo(40);
    }];
    
    [_titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(_imageView.mas_bottom).offset(10);
        make.centerX.mas_equalTo(_imageView);
    }];
    
}

@end
