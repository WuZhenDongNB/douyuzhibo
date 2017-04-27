//
//  HomeNaviView.m
//  Dyzb_UT
//
//  Created by liutao on 17/4/12.
//  Copyright © 2017年 UTOUU. All rights reserved.
//

#import "HomeNaviView.h"

@interface HomeNaviView ()

@end
@implementation HomeNaviView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self configUI];
    }
    return self;
}

- (void)configUI {

    UIButton *leftImageViewBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [leftImageViewBtn setImage:[UIImage imageNamed:@"home_logo"] forState:UIControlStateNormal];
    leftImageViewBtn.tag = 1002;

    [leftImageViewBtn addTarget:self action:@selector(action_RespondsToBtn:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:leftImageViewBtn];
    [leftImageViewBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self).offset(kH(25));
        make.left.equalTo(self).offset(kW(1));
        make.size.mas_equalTo(CGSizeMake(kW(85), kH(35)));
    }];

    UIView *titleView = [[UIView alloc] init];
    titleView.backgroundColor = [UIColor whiteColor];
    titleView.layer.cornerRadius = 5;
    titleView.layer.masksToBounds = YES;
    [self addSubview:titleView];
    [titleView mas_makeConstraints:^(MASConstraintMaker *make) {
       
        make.left.equalTo(leftImageViewBtn.mas_right).offset(kW(1));
        make.top.equalTo(self).offset(kH(25));
        make.bottom.equalTo(self).offset(-kH(10));
        make.width.mas_equalTo(kW(200));
    }];
    
    UIButton *titleViewLeftViewBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [titleViewLeftViewBtn setImage:[UIImage imageNamed:@"home_newSeacrhcon"] forState:UIControlStateNormal];
    titleViewLeftViewBtn.tag = 1003;
    [titleViewLeftViewBtn addTarget:self action:@selector(action_RespondsToBtn:) forControlEvents:UIControlEventTouchUpInside];
    [titleView addSubview:titleViewLeftViewBtn];
    [titleViewLeftViewBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(titleView).offset(kW(1));
        make.top.equalTo(titleView).offset(kH(5));
        make.size.mas_equalTo(CGSizeMake(kW(100), kW(20)));
        
    }];
    titleViewLeftViewBtn.imageEdgeInsets = UIEdgeInsetsMake(1, -10, 2, 10);
    [titleViewLeftViewBtn setTitle:@" skt" forState:UIControlStateNormal];
    [titleViewLeftViewBtn setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    
    UIView *lineView = [[UIView alloc] init];
    lineView.backgroundColor = [UIColor grayColor];
    [titleView addSubview:lineView];
    [lineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(titleViewLeftViewBtn);
        make.size.mas_equalTo(CGSizeMake(kW(0.5), kH(15)));
        make.right.equalTo(titleView).offset(-kW(30));
        
    }];
    
    UIButton *QrcodeBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [QrcodeBtn setImage:[UIImage imageNamed:@"home_newSaoicon"] forState:UIControlStateNormal];
    QrcodeBtn.tag = 1004;
     [QrcodeBtn addTarget:self action:@selector(action_RespondsToBtn:) forControlEvents:UIControlEventTouchUpInside];
    [titleView addSubview:QrcodeBtn];
    [QrcodeBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(lineView.mas_right).offset(kW(5));
        make.centerY.equalTo(lineView);
        make.size.mas_equalTo(CGSizeMake(kW(20), kW(20)));
    }];
    
    UIButton *gameBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [gameBtn setImage:[UIImage imageNamed:@"home_newGameicon"] forState:UIControlStateNormal];
    gameBtn.tag = 1005;
     [gameBtn addTarget:self action:@selector(action_RespondsToBtn:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:gameBtn];
    [gameBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(titleView.mas_right).offset(kW(10));
        make.centerY.equalTo(titleView);
        make.size.mas_equalTo(CGSizeMake(kW(30), kH(20)));
        
    }];
    
    UIButton *lockBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    lockBtn.tag = 1006;
     [lockBtn setImage:[UIImage imageNamed:@"home_click"] forState:UIControlStateNormal];
     [lockBtn addTarget:self action:@selector(action_RespondsToBtn:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:lockBtn];
    [lockBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(gameBtn.mas_right).offset(kW(5));
        make.centerY.equalTo(titleView);
        make.size.mas_equalTo(CGSizeMake(kW(30), kH(27)));
    }];
    
}

- (void)action_RespondsToBtn:(UIButton *)sender {

    switch (sender.tag) {
        case 1002:
        {
            if (_delegate && [_delegate respondsToSelector:@selector(leftImageViewBtnWith:)]) {
                [_delegate leftImageViewBtnWith:self];
            }
        
        }
            break;
        case 1003:
        {
            if (_delegate && [_delegate respondsToSelector:@selector(titleViewLeftViewBtnWith:)]) {
                [_delegate titleViewLeftViewBtnWith:self];
            }
        
        }
            break;
        case 1004:
        {
            if (_delegate && [_delegate respondsToSelector:@selector(QrcodeBtnWith:)]) {
                [_delegate QrcodeBtnWith:self];
            }
        
        }
            break;
        case 1005:
        {
            if (_delegate && [_delegate respondsToSelector:@selector(gameBtnWith:)]) {
                [_delegate gameBtnWith:self];
            }
        }
            break;
        case 1006:
        {
            if (_delegate && [_delegate respondsToSelector:@selector(lockBtnWith:)]) {
                [_delegate lockBtnWith:self];
            }
        }
            break;
        default:
            break;
    }

}
@end
