//
//  FinddYnamicCell.m
//  Dyzb_UT
//
//  Created by 孙好运 on 2017/4/13.
//  Copyright © 2017年 UTOUU. All rights reserved.
//

#import "FinddYnamicCell.h"

#import "FindYnamicCollectionCell.h"

#import "Masonry.h"

@interface FinddYnamicCell()<UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>

@end

@implementation FinddYnamicCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {

        _imageArr = @[@"0",@"2",@"3",@"4"];
        
        [self creatUI];
//        self.backgroundColor = [UIColor grayColor];
    }
    return self;
}

-(void)creatUI{
    //头像
    _headImageView = [UIImageView new];
    _headImageView.layer.masksToBounds = YES;
    _headImageView.layer.cornerRadius = 20;
//    _headImageView.backgroundColor = [UIColor redColor];
    _headImageView.image = [UIImage imageNamed:@"0"];
    [self.contentView addSubview:_headImageView];
    
    //昵称
    _nameLabel = [UILabel new];
    _nameLabel.text = @"Miss";
//    _nameLabel.layer.borderWidth = 1.0f;
//    _nameLabel.layer.borderColor = [UIColor redColor].CGColor;
    [self.contentView addSubview:_nameLabel];
    
    //性别图标
    _sexImageView = [UIImageView new];
//    _sexImageView.hidden = YES;
    _sexImageView.backgroundColor = [UIColor yellowColor];
    [self.contentView addSubview:_sexImageView];
    
    //时间和阅读量
    _timeAndReadingLabel = [UILabel new];
    _timeAndReadingLabel.text = @"20分钟前   100人阅读";
    _timeAndReadingLabel.font = [UIFont systemFontOfSize:10];
    [self.contentView addSubview:_timeAndReadingLabel];
    
    //发表的状态
    _stateLabel = [UILabel new];
    _stateLabel.text = @"其实你知道的烦恼会解决烦恼";
    _stateLabel.font = [UIFont systemFontOfSize:12];
   // _stateLabel.numberOfLines = 0;
    [self.contentView addSubview:_stateLabel];

    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc]init];
    layout.scrollDirection = UICollectionViewScrollDirectionVertical;
    //图片
    _collectionView = [[UICollectionView alloc]initWithFrame:CGRectZero collectionViewLayout:layout];
    _collectionView.delegate = self;
    _collectionView.dataSource = self;
    _collectionView.backgroundColor = [UIColor whiteColor];
    
    [_collectionView registerClass:[FindYnamicCollectionCell class] forCellWithReuseIdentifier:@"cell"];
    [self.contentView addSubview:_collectionView];
    
    //名字 点击
//    _liveNameButton = [UIButton new];
//    [_liveNameButton setTitle:@"Miss" forState:UIControlStateNormal];
//    [_liveNameButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    _liveNameButton =[self withTitle:@"Miss" withImageStr:nil withTitleColor:[UIColor blackColor] withFont:13 withTag:@selector(liveClcik:)];
    [self.contentView addSubview:_liveNameButton];
    
    //关注
//    _focusButton = [UIButton new];
//    [_focusButton setTitle:@"关注" forState:UIControlStateNormal];
//    [_focusButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    _focusButton = [self withTitle:@"关注" withImageStr:nil withTitleColor:[UIColor orangeColor] withFont:12 withTag:@selector(focusClcik:)];
    [self.contentView addSubview:_focusButton];
    
    //分享
//    _shareButton = [UIButton new];
//    [_shareButton setTitle:@"分享" forState:UIControlStateNormal];
//    [_shareButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    _shareButton = [self withTitle:@"分享" withImageStr:nil withTitleColor:[UIColor blackColor] withFont:12 withTag:@selector(sharClick:)];
    [self.contentView addSubview:_shareButton];
    
    //评论
    _commentsButton = [self withTitle:@"评论" withImageStr:nil withTitleColor:[UIColor blackColor] withFont:12 withTag:@selector(commentsClick:)];
    [self.contentView addSubview:_commentsButton];
    
    //点赞
//    _praiseButton = [UIButton new];
//    [_praiseButton setTitle:@"点赞" forState:UIControlStateNormal];
//    [_praiseButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
//    [_praiseButton addTarget:self action:@selector(click1) forControlEvents:UIControlEventTouchUpInside];
    
    _praiseButton = [self withTitle:@"点赞" withImageStr:nil withTitleColor:[UIColor blackColor] withFont:12 withTag:@selector(praiseClick:)];
    [self.contentView addSubview:_praiseButton];
    
    [self initalConstrolsConstraints];
}

- (UIButton *)withTitle:(NSString *)title withImageStr:(NSString *)imageStr withTitleColor:(UIColor *)color withFont:(CGFloat)font withTag:(SEL)method{
    
    UIButton *btn = [UIButton new];
    [btn setTitle:title forState:UIControlStateNormal];
    [btn setTitleColor:color forState:UIControlStateNormal];
    [btn setImage:[UIImage imageNamed:imageStr] forState:UIControlStateNormal];
    btn.titleLabel.font = [UIFont systemFontOfSize:font];
    [btn addTarget:self action:method forControlEvents:UIControlEventTouchUpInside];
    
    return btn;
    
}

//名字点击事件
-(void)liveClcik:(UIButton *)sender{
    
    NSLog(@"名字点击");
}

//关注点击事件
-(void)focusClcik:(UIButton *)sender{
    
    NSLog(@"关注");
}

//分享点击事件
-(void)sharClick:(UIButton *)sender{
    NSLog(@"分享");
}

//评论点击事件
-(void)commentsClick:(UIButton *)sender{
    NSLog(@"评论");
}
//点赞点击事件
-(void)praiseClick:(UIButton *)sender{
    NSLog(@"点赞");
}

- (void)initalConstrolsConstraints{
    [_headImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(5);
        make.left.mas_equalTo(10);
        make.height.width.mas_equalTo(40);
    }];
    
    [_nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(_headImageView.mas_right).offset(5);
        make.top.mas_equalTo(10);
        
    }];
    
    [_sexImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(_nameLabel.mas_right).offset(5);
        make.top.mas_equalTo(_nameLabel);
        make.height.width.mas_equalTo(20);
        
    }];
    
    [_timeAndReadingLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(_nameLabel);
        make.top.mas_equalTo(_nameLabel.mas_bottom).offset(5);
        
    }];
    
    [_focusButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(-10);
        make.top.mas_equalTo(10);
    }];
    
    [_stateLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.contentView).offset(10);
        make.top.mas_equalTo(_headImageView.mas_bottom).offset(5);
    }];
    
    [_collectionView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.contentView).offset(10);
        make.right.mas_equalTo(self.contentView).offset(-10);
        make.top.mas_equalTo(_stateLabel.mas_bottom).offset(5);
        make.height.mas_equalTo(100);
    }];
    
    [_liveNameButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(10);
        make.top.mas_equalTo(_collectionView.mas_bottom).offset(5);
    }];
    
    CGFloat width = SCREEN_WIDTH / 3;
    
    [_shareButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.contentView);
        make.top.mas_equalTo(_liveNameButton.mas_bottom).offset(10);
        make.width.mas_equalTo(width);
    }];
//
    [_commentsButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.width.mas_equalTo(_shareButton);
        make.left.mas_equalTo(_shareButton.mas_right);
    }];
//
    [_praiseButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(_commentsButton.mas_right);
        make.top.width.mas_equalTo(_shareButton);
    }];
}

#pragma collectionView 代理

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return _imageArr.count;
}

-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 1;
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    FindYnamicCollectionCell *cell = [_collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
    cell.imageView.image = [UIImage imageNamed:_imageArr[indexPath.row]];
    
    return cell;
    
}

-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    return CGSizeMake(80, 80);
}


@end
