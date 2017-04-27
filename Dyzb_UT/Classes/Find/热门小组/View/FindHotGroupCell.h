//
//  FindHotGroupCell.h
//  Dyzb_UT
//
//  Created by 孙好运 on 2017/4/20.
//  Copyright © 2017年 UTOUU. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FindHotGroupCell : UITableViewCell

//头像图标
@property (nonatomic,strong) UIImageView *headerImageView;
//名字
@property (nonatomic,strong) UILabel    *nameLabel;
//标题
@property (nonatomic,strong) UILabel   *titleLabel;
//关注人数
@property (nonatomic,strong) UILabel   *focusCountLabel;

@end
