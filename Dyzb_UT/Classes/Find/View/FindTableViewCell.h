//
//  FindTableViewCell.h
//  Dyzb_UT
//
//  Created by 孙好运 on 2017/4/12.
//  Copyright © 2017年 UTOUU. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FindTableViewCell : UITableViewCell

@property (nonatomic,strong) UIImageView *iconImageView;
@property (nonatomic,strong) UILabel     *titleLabel;

@property (nonatomic,strong) UIButton    *moreButton;

@property (nonatomic,strong) NSArray *imageArr;
@property (nonatomic,strong) NSArray *titleArr;

//是否显示游戏中心 更多按钮
@property (nonatomic,assign) BOOL isShow;

@end
