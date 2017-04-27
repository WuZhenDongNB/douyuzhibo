//
//  PubuliuCollectionViewCell.m
//  Dyzb_UT
//
//  Created by Mr. Wu on 17/4/12.
//  Copyright © 2017年 UTOUU. All rights reserved.
//

#import "PubuliuCollectionViewCell.h"
#import <Masonry.h>

#import <UIImageView+WebCache.h>

@implementation PubuliuCollectionViewCell

-(instancetype)initWithFrame:(CGRect)frame{
    
    
    if (self = [super initWithFrame:frame]) {
        [self createUI];
    }
    
    return self;
    
}
-(void)createUI{
    self.headImageView = [[UIImageView alloc]init];
    [self.contentView addSubview:self.headImageView];
    self.headImageView.layer.cornerRadius = 20;
    self.headImageView.layer.masksToBounds  = YES;
    [self.headImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.contentView.mas_left).offset(0);
        
        make.top.mas_equalTo(self.contentView.mas_top).offset(2);
        
        make.width.mas_equalTo(@40);
        
        make.height.mas_equalTo(@40);
    }];
    self.nameLabel =[[UILabel alloc]init];
    self.nameLabel.textColor = [UIColor purpleColor];
    self.nameLabel.font = [UIFont systemFontOfSize:16];
    
    [self.contentView addSubview:self.nameLabel];
    [self.nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.headImageView.mas_right).offset(5);
        make.centerY.mas_equalTo(self.headImageView.mas_centerY);
        make.right.mas_equalTo(self.contentView.mas_right);
        
       // make.top.mas_equalTo(self.contentView.mas_top).offset(2);
        make.height.mas_equalTo(20);
        
    }];
  
    self.numLabel =[[UILabel alloc]init];
    self.numLabel.font = [UIFont systemFontOfSize:14];
    
    self.numLabel.textColor =  [UIColor purpleColor];
    //  self.numLabel.textAlignment = UITextAlignmentRight;
    
    [self.contentView addSubview:self.numLabel];
    
    [self.numLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.headImageView.mas_bottom).offset(2);
        
        make.left.mas_equalTo(self.contentView.mas_left).offset(5);
        
        make.height.mas_equalTo(@20);
        
        
    }];

    
    self.locationBtn =[UIButton buttonWithType:UIButtonTypeSystem];
    self.locationBtn.titleLabel.font = [UIFont systemFontOfSize:13];
    [self.contentView addSubview:self.locationBtn];
    
    [self.locationBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.right.mas_equalTo(self.contentView.mas_right).offset(5);
        make.centerY.mas_equalTo(self.numLabel.mas_centerY);
        //  make.top.mas_equalTo(self.headImageView.mas_bottom).offset(0);
        
        make.width.mas_equalTo(@50);
        
        make.height.mas_equalTo(@20);
        
        
    }];
    

    
    self.bigPicView =[[UIImageView alloc]init];
    
    [self.contentView addSubview:self.bigPicView];
    
    [self.bigPicView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        
        make.right.mas_equalTo(self.contentView.mas_right).offset(0);
        
        make.top.mas_equalTo(self.numLabel.mas_bottom).offset(2);
        
        make.left.mas_equalTo(self.contentView.mas_left).offset(0);
        
        make.bottom.mas_equalTo(self.contentView.mas_bottom).offset(0);
        
        
    }];
    
    
    
    
    
}
-(void)configWithModel:(CommentModel *)model
{
        
    [self.headImageView sd_setImageWithURL:[NSURL URLWithString:model.smallpic] placeholderImage:[UIImage imageNamed:@"placeholder_head"] options:SDWebImageRefreshCached completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
        //        image = [UIImage  circleImage:image borderColor:[UIColor redColor] borderWidth:1];
        self.headImageView.image = image;
    }];
    
    self.nameLabel.text = model.myname;
    // 如果没有地址, 给个默认的地址
    if (!model.gps.length) {
        model.gps = @"喵星";
    }
    [self.locationBtn setTitle:model.gps forState:UIControlStateNormal];
    [self.bigPicView sd_setImageWithURL:[NSURL URLWithString:model.bigpic] placeholderImage:[UIImage imageNamed:@"profile_user_414x414"]];
    //    self.startView.image  = live.starImage;
    //    self.startView.hidden = !live.starlevel;
    
    // 设置当前观众数量
    NSString *fullChaoyang = [NSString stringWithFormat:@"%ld人在看", model.allnum];
    NSRange range = [fullChaoyang rangeOfString:[NSString stringWithFormat:@"%ld", model.allnum]];
    NSMutableAttributedString *attr = [[NSMutableAttributedString alloc] initWithString:fullChaoyang];
    [attr addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:17] range: range];
    //    [attr addAttribute:NSForegroundColorAttributeName value:KeyColor range:range];
    self.numLabel.attributedText = attr;
    
    
    
}

@end



@implementation singerCollectionViewCell
-(instancetype)initWithFrame:(CGRect)frame{
    
    
    if (self = [super initWithFrame:frame]) {
        [self createUI];
    }
    
    return self;
    
}
-(void)createUI{
    
    self.headImageView =[[UIImageView alloc]init];
    
    [self.contentView addSubview:self.headImageView];
    self.headImageView.layer.cornerRadius = 20;
    self.headImageView.layer.masksToBounds  = YES;

    [self.headImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.mas_equalTo(self.contentView).offset(10);
        
        make.top.mas_equalTo(self.contentView).offset(5);
        
        make.width.mas_equalTo(@50);
        
        make.height.mas_equalTo(@50);
        
        
    }];
    
    
    self.nameLabel =[[UILabel alloc]init];
    self.nameLabel.textColor = [UIColor purpleColor];
    [self.contentView addSubview:self.nameLabel];
    
    [self.nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.mas_equalTo(self.headImageView.mas_right).offset(5);
        
        make.top.mas_equalTo(self.contentView).offset(5);
        
       // make.width.mas_equalTo(@200);
        
        make.height.mas_equalTo(@20);
        
        
    }];
    
    
    self.numLabel =[[UILabel alloc]init];
    
    self.numLabel.textAlignment = UITextAlignmentRight;
     self.numLabel.textColor = [UIColor purpleColor];
    [self.contentView addSubview:self.numLabel];
    
    [self.numLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.right.mas_equalTo(self.contentView).offset(-10);
        
        make.top.mas_equalTo(self.contentView).offset(10);
        
        make.width.mas_equalTo(@150);
        
        make.height.mas_equalTo(@30);
        
        
    }];
    
    self.bigPicView =[[UIImageView alloc]init];
    
    [self.contentView addSubview:self.bigPicView];
    
    [self.bigPicView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.mas_equalTo(self.contentView).offset(0);
        
        make.top.mas_equalTo(self.headImageView.mas_bottom).offset(5);
        
        make.right.mas_equalTo(self.contentView).offset(0);
        make.bottom.mas_equalTo(self.contentView.mas_bottom);
        
       
        
        
    }];
    
    
    self.locationBtn =[UIButton buttonWithType:UIButtonTypeSystem];
    
    [self.contentView addSubview:self.locationBtn];
    
    [self.locationBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.mas_equalTo(self.headImageView.mas_right).offset(5);
        
        make.top.mas_equalTo(self.nameLabel.mas_bottom).offset(5);
        
        make.width.mas_equalTo(@50);
        
        make.height.mas_equalTo(@20);
        
        
    }];
    
    
}

-(void)configWithModel:(CommentModel *)model
{
    
    [self.headImageView sd_setImageWithURL:[NSURL URLWithString:model.smallpic] placeholderImage:[UIImage imageNamed:@"placeholder_head"] options:SDWebImageRefreshCached completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
        //        image = [UIImage  circleImage:image borderColor:[UIColor redColor] borderWidth:1];
        self.headImageView.image = image;
    }];
    
    self.nameLabel.text = model.myname;
    // 如果没有地址, 给个默认的地址
    if (!model.gps.length) {
        model.gps = @"喵星";
    }
    [self.locationBtn setTitle:model.gps forState:UIControlStateNormal];
    [self.bigPicView sd_setImageWithURL:[NSURL URLWithString:model.bigpic] placeholderImage:[UIImage imageNamed:@"profile_user_414x414"]];
    //    self.startView.image  = live.starImage;
    //    self.startView.hidden = !live.starlevel;
    
    // 设置当前观众数量
    NSString *fullChaoyang = [NSString stringWithFormat:@"%ld人在看", model.allnum];
    NSRange range = [fullChaoyang rangeOfString:[NSString stringWithFormat:@"%ld", model.allnum]];
    NSMutableAttributedString *attr = [[NSMutableAttributedString alloc] initWithString:fullChaoyang];
    [attr addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:17] range: range];
    //    [attr addAttribute:NSForegroundColorAttributeName value:KeyColor range:range];
    self.numLabel.attributedText = attr;
    
    
    
}




@end

