//
//  FinddYnamicCell.h
//  Dyzb_UT
//
//  Created by 孙好运 on 2017/4/13.
//  Copyright © 2017年 UTOUU. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FinddYnamicCell : UITableViewCell

//头像
@property (nonatomic,strong) UIImageView *headImageView;
//名字
@property (nonatomic,strong) UILabel *nameLabel;
//性别图标
@property (nonatomic,strong) UIImageView *sexImageView;
//时间和阅读量
@property (nonatomic,strong) UILabel *timeAndReadingLabel;
//状态
@property (nonatomic,strong) UILabel *stateLabel;
//图片显示
@property (nonatomic,strong) UICollectionView *collectionView;
//标签
@property (nonatomic,strong) UIButton *liveNameButton;
//关注
@property (nonatomic,strong) UIButton *focusButton;

//分享
@property (nonatomic,strong) UIButton *shareButton;
//评论
@property (nonatomic,strong) UIButton *commentsButton;
//点赞
@property (nonatomic,strong) UIButton *praiseButton;

//状态图片数组
@property (nonatomic,strong) NSArray *imageArr;


@end
