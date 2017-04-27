//
//  FindVedioCell.h
//  Dyzb_UT
//
//  Created by 孙好运 on 2017/4/19.
//  Copyright © 2017年 UTOUU. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FindVedioCell : UITableViewCell

//视频图片
@property (nonatomic,strong) UIImageView *vedioImageView;
//标题
@property (nonatomic,strong) UILabel   *titleLabel;
//头像图标
@property (nonatomic,strong) UIImageView *headerImageView;
//名字
@property (nonatomic,strong) UILabel    *nameLabel;
//视频图标
@property (nonatomic,strong) UIImageView *vedioIconImageView;
//播放次数
@property (nonatomic,strong) UILabel *playCountLabel;


@end
