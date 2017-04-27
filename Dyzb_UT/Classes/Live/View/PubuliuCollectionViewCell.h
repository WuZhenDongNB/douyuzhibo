//
//  PubuliuCollectionViewCell.h
//  Dyzb_UT
//
//  Created by Mr. Wu on 17/4/12.
//  Copyright © 2017年 UTOUU. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CommentModel.h"

@interface PubuliuCollectionViewCell : UICollectionViewCell
@property (strong, nonatomic)  UIImageView *headImageView;
@property (strong, nonatomic)  UIButton    *locationBtn;
@property (strong, nonatomic)  UILabel     *nameLabel;
//@property (strong, nonatomic)  UIImageView *startView;
@property (strong, nonatomic)  UILabel     *numLabel;
@property (strong, nonatomic)  UIImageView *bigPicView;

-(void)configWithModel:(CommentModel *)model;
@end


@interface singerCollectionViewCell : UICollectionViewCell
@property (strong, nonatomic)  UIImageView *headImageView;
@property (strong, nonatomic)  UIButton    *locationBtn;
@property (strong, nonatomic)  UILabel     *nameLabel;
//@property (strong, nonatomic)  UIImageView *startView;
@property (strong, nonatomic)  UILabel     *numLabel;
@property (strong, nonatomic)  UIImageView *bigPicView;

-(void)configWithModel:(CommentModel *)model;

@end
