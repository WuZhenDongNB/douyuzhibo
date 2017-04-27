//
//  FindTableViewCell.m
//  Dyzb_UT
//
//  Created by 孙好运 on 2017/4/12.
//  Copyright © 2017年 UTOUU. All rights reserved.
//

#import "FindTableViewCell.h"

#import "FindCollectionViewCell.h"
#import "Masonry.h"


//鱼吧
#import "FindFishController.h"

#import "FindViewController.h"

//热门分组
#import "FindHotGroupController.h"

@interface FindTableViewCell()<UICollectionViewDelegate,UICollectionViewDataSource>

@property (nonatomic,strong) UICollectionView *collectionView;


@end


@implementation FindTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        [self creatUI];
        self.backgroundColor = [UIColor whiteColor];
    }
    return self;
    
}

- (void)creatUI{
    
    
    _iconImageView = [UIImageView new];
    _iconImageView.image = [UIImage imageNamed:@"5"];
//    _iconImageView.hidden = !_isShow;
    [self.contentView addSubview:_iconImageView];
    
    _titleLabel = [UILabel new];
//    _titleLabel.hidden = !_isShow;
    _titleLabel.font = [UIFont systemFontOfSize:13.0];
    _titleLabel.text = @"游戏中心";
    [self.contentView addSubview:_titleLabel];
    
    _moreButton = [UIButton new];
    [_moreButton setImage:[UIImage imageNamed:@"1.png"] forState:UIControlStateNormal];
    [_moreButton setTitle:[NSString stringWithFormat:@"更多"] forState:UIControlStateNormal];
    [_moreButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    _moreButton.titleLabel.font = [UIFont systemFontOfSize:12.0];
    _moreButton.semanticContentAttribute = UISemanticContentAttributeForceRightToLeft;
//    [_moreButton setTitleEdgeInsets:UIEdgeInsetsMake(0, 0, 0, 50)];
//    [_moreButton setImageEdgeInsets:UIEdgeInsetsMake(0, 80, 0, 0)];
    
    [_moreButton addTarget:self action:@selector(moreButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    
//    _moreButton.hidden = !_isShow;
    [self.contentView addSubview:_moreButton];
    
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc]init];
    layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    layout.itemSize = CGSizeMake(SCREEN_WIDTH/4 -10, SCREEN_WIDTH/4 -10);
    
    _collectionView = [[UICollectionView alloc]initWithFrame:CGRectZero collectionViewLayout:layout];
    _collectionView.delegate = self;
    _collectionView.dataSource = self;
    _collectionView.backgroundColor = [UIColor whiteColor];
    [_collectionView registerClass:[FindCollectionViewCell class] forCellWithReuseIdentifier:@"cellID"];
    
    [self.contentView addSubview:_collectionView];
    
    //一条灰色的线
    UIView *view = [UIView new];
    view.backgroundColor = [UIColor grayColor];
    [self.contentView addSubview:view];
    
    [_iconImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(10);
        make.top.mas_equalTo(5);
        make.height.mas_equalTo(30);
        make.width.mas_equalTo(20);
    }];
    
    [_titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(_iconImageView.mas_right).offset(5);
        make.top.mas_equalTo(_iconImageView);
        make.height.mas_equalTo(30);
        
    }];
    
    [_moreButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(-10);
        make.top.mas_equalTo(_iconImageView);
    }];
    
    [_collectionView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(_titleLabel.mas_bottom).offset(5);
        make.left.right.mas_equalTo(self.contentView);
        make.height.mas_equalTo(80);
    }];
    
    [view mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(_collectionView.mas_bottom).offset(5);
        make.left.right.mas_equalTo(self.contentView);
        make.height.mas_equalTo(10);
    }];
    
}

-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    
    return 1;
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    
    return _titleArr.count;
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    FindCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cellID" forIndexPath:indexPath];
    
    
    
    for (UIView *view in cell.contentView.subviews) {
        if ([view isKindOfClass:[FindCollectionViewCell class]]) {
            [view removeFromSuperview];
        }
    }
    cell.imageView.image = [UIImage imageNamed:_imageArr[indexPath.row]];
    cell.titleLabel.text = _titleArr[indexPath.row];
    
    return cell;
}

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    
    NSLog(@"点击了%ld",indexPath.row);
    
    FindFishController *VC = [[FindFishController alloc]init];
    
    FindViewController *findViewController =  (FindViewController *)self.nextResponder.nextResponder.nextResponder.nextResponder;
    
    if (indexPath.row == 3) {
        
        FindHotGroupController *vc = [[FindHotGroupController alloc]init];
        
        [findViewController.navigationController pushViewController:vc animated:YES];
        
        return;
    }
    
    [findViewController.navigationController pushViewController:VC animated:YES];
    
}

- (void)setIsShow:(BOOL)isShow{
    
    _isShow = isShow;
    //是否隐藏
    _iconImageView.hidden = !_isShow;
    _titleLabel.hidden = !_isShow;
    _moreButton.hidden = !_isShow;
    
    if (!_isShow)
    {
        [_titleLabel mas_updateConstraints:^(MASConstraintMaker *make) {
            make.height.mas_equalTo(0);
        }];
    }
    else
    {
        [_titleLabel mas_updateConstraints:^(MASConstraintMaker *make) {
            make.height.mas_equalTo(30);
        }];
        
    }
}


//更多点击事件
-(void)moreButtonClick:(UIButton *)sender{
    
    NSLog(@"更多点击事件");
}

@end
