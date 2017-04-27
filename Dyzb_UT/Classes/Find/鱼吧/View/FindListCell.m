//
//  FindListCell.m
//  Dyzb_UT
//
//  Created by 孙好运 on 2017/4/18.
//  Copyright © 2017年 UTOUU. All rights reserved.
//

#import "FindListCell.h"

@implementation FindListCell

- (instancetype)initWithFrame:(CGRect)frame{
    
    self = [super initWithFrame:frame];
    
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        [self initView];
    }
    return self;
}

-(void)initView{
    
    _textLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, self.contentView.frame.size.width, 20)];
    _textLabel.font = [UIFont systemFontOfSize:14];
    _textLabel.layer.cornerRadius = 2;
    _textLabel.layer.borderWidth = 1;
    _textLabel.layer.masksToBounds = YES;
    _textLabel.layer.borderColor = [UIColor grayColor].CGColor;
//    _textLabel.textColor = [UIColor grayColor];
    [self.contentView addSubview:_textLabel];
}

@end
