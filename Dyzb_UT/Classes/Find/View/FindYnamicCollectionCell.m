
//
//  FindYnamicCollectionCell.m
//  Dyzb_UT
//
//  Created by 孙好运 on 2017/4/14.
//  Copyright © 2017年 UTOUU. All rights reserved.
//

#import "FindYnamicCollectionCell.h"
#import "Masonry.h"

@implementation FindYnamicCollectionCell

- (instancetype)initWithFrame:(CGRect)frame{
    
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor redColor];
        [self creatUI];
    }
    return self;
}

-(void)creatUI{
    
    _imageView =[UIImageView new];
    
    [self.contentView addSubview:_imageView];
    
    [_imageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(self);
    }];
    
}



@end
