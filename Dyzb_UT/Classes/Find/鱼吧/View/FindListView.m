//
//  FindListView.m
//  Dyzb_UT
//
//  Created by 孙好运 on 2017/4/18.
//  Copyright © 2017年 UTOUU. All rights reserved.
//

#import "FindListView.h"

#import "FindListCell.h"


@interface FindListView ()<UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>

@property (nonatomic,strong) UICollectionView *collectionView;

@property (nonatomic,strong) UIView *bottomView;

//最新btn
@property (nonatomic,strong) UIButton *latestButton;
//最热btn
@property (nonatomic,strong) UIButton *hottestButton;

//箭头button
@property (nonatomic,strong) UIButton *iconButton;

@end

@implementation FindListView

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
      //  [self initCollectionView];
        self.backgroundColor = [UIColor whiteColor];
    }
    
    return self;
}

-(void)initCollectionView
{
    
   
    
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc]init];
    layout.minimumLineSpacing = 10;
    
    layout.minimumInteritemSpacing = 10;
    layout.scrollDirection = UICollectionViewScrollDirectionVertical;
    layout.sectionInset = UIEdgeInsetsMake(0, 10, 0,10);
    //图片
    
    
    _collectionView = [[UICollectionView alloc]initWithFrame:CGRectZero collectionViewLayout:layout];
    [_collectionView registerClass:[FindListCell class] forCellWithReuseIdentifier:@"cell"];
    _collectionView.delegate = self;
    _collectionView.dataSource = self;
    _collectionView.backgroundColor = [UIColor whiteColor];
    
    [self addSubview:_collectionView];
    
    [_collectionView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(0);
        make.right.mas_equalTo(0);
        make.top.mas_equalTo(self);
        make.height.mas_equalTo(100);
    }];
    
    _bottomView = [UIView new];
    _bottomView.backgroundColor = [UIColor whiteColor];
    [self addSubview:_bottomView];
    
    [_bottomView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.mas_equalTo(self);
        make.top.mas_equalTo(_collectionView.mas_bottom);
        make.height.mas_equalTo(30);
    }];
    
    _latestButton = [self withTitle:@"最新" withTitleColor:[UIColor grayColor] withTitleSelectColor:[UIColor orangeColor] withFont:13 withTag:@selector(latestClick:)];
    _latestButton.tag = 100;
    _latestButton.layer.borderColor = [UIColor orangeColor].CGColor;
    _latestButton.selected = YES;
    if (_latestButton.selected) {
        [_latestButton setTitleColor:[UIColor orangeColor] forState:UIControlStateSelected];
    }else{
        [_latestButton setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    }
    
    _hottestButton = [self withTitle:@"最热" withTitleColor:[UIColor grayColor] withTitleSelectColor:[UIColor orangeColor] withFont:13 withTag:@selector(hottestClcik:)];
    _hottestButton.tag = 101;
    _hottestButton.layer.borderColor = [UIColor grayColor].CGColor;
    
    _iconButton = [UIButton new];
    [_iconButton setImage:[UIImage imageNamed:@"1"] forState:UIControlStateNormal];
    [_iconButton addTarget:self action:@selector(iconClcik:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:_iconButton];
    
    [_latestButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(10);
        make.centerY.mas_equalTo(_bottomView.mas_centerY);
        make.height.mas_equalTo(25);
        make.width.mas_equalTo(35);
    }];
    
    [_hottestButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(_latestButton.mas_right).offset(10);
        make.centerY.height.width.mas_equalTo(_latestButton);
    }];
    
    [_iconButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(self);
        make.centerY.mas_equalTo(_latestButton);
        make.width.height.mas_equalTo(20);
    }];
    
    UIView *view = [UIView new];
    view.backgroundColor = [UIColor clearColor];
    [self addSubview:view];
    
    [view mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.mas_equalTo(self);
        make.top.mas_equalTo(_iconButton.mas_bottom);
        make.bottom.mas_equalTo(self);
    }];
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapAction:)];
    
    [view addGestureRecognizer:tap];
    
}

-(void)tapAction:(UITapGestureRecognizer *)tap{
    
    _cancelBlock(_currentPage,_buttonTag);
}

-(void)iconClcik:(UIButton *)sender{
    
    _cancelBlock(_currentPage,_buttonTag);
}

-(void)latestClick:(UIButton *)sender{
    sender.selected = YES;
    _hottestButton.selected = NO;
    
//    sender.layer.borderColor = sender.selected ? [UIColor orangeColor].CGColor:[UIColor grayColor].CGColor;
//    _latestButton.layer.borderColor = _latestButton.selected ? [UIColor orangeColor].CGColor : [UIColor grayColor].CGColor;
    if (!sender.selected) {
        sender.layer.borderColor = [UIColor grayColor].CGColor;
        _hottestButton.layer.borderColor = [UIColor orangeColor].CGColor;
        
    }
    else{
        sender.layer.borderColor = [UIColor orangeColor].CGColor;
        _hottestButton.layer.borderColor = [UIColor grayColor].CGColor;
    }
    _cancelBlock(_currentPage,sender.tag);
    
}

-(void)hottestClcik:(UIButton *)sender{
    sender.selected = YES;
    _latestButton.selected = NO;
    if (sender.selected) {
        sender.layer.borderColor = [UIColor orangeColor].CGColor;
        _latestButton.layer.borderColor = [UIColor grayColor].CGColor;
    }
    else {
        sender.layer.borderColor = [UIColor grayColor].CGColor;
        _latestButton.layer.borderColor = [UIColor orangeColor].CGColor;
    }
    _cancelBlock(_currentPage,sender.tag);
    
}

-(void)setButtonTag:(NSInteger)buttonTag{
    
    _buttonTag = buttonTag;
    
    if (_buttonTag == 100) {
        _hottestButton.layer.borderColor = [UIColor grayColor].CGColor;
        _latestButton.layer.borderColor = [UIColor orangeColor].CGColor;
        _latestButton.selected = YES;
        _hottestButton.selected = NO;
    }
    else
    {
        _hottestButton.layer.borderColor = [UIColor orangeColor].CGColor;
        _latestButton.layer.borderColor = [UIColor grayColor].CGColor;
        _hottestButton.selected = YES;
        _latestButton.selected = NO;
    }
    
    
}

- (UIButton *)withTitle:(NSString *)title withTitleColor:(UIColor *)color withTitleSelectColor:(UIColor *)titleSelectColor withFont:(CGFloat)font withTag:(SEL)method{
    
    UIButton *btn = [UIButton new];
    [btn setTitle:title forState:UIControlStateNormal];
    [btn setTitleColor:color forState:UIControlStateNormal];
//    [btn setImage:[UIImage imageNamed:imageStr] forState:UIControlStateNormal];
    [btn setTitleColor:titleSelectColor forState:UIControlStateSelected];
    btn.titleLabel.font = [UIFont systemFontOfSize:font];
    [btn addTarget:self action:method forControlEvents:UIControlEventTouchUpInside];
    
    btn.layer.cornerRadius = 10;
    //将多余的部分切掉
    btn.layer.masksToBounds = YES;
    btn.layer.borderWidth = 1.0f;
    
    [self addSubview:btn];
    
    return btn;
    
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return self.titleArr.count;
}

-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 1;
}


-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    
        
    CGSize size = [self getSizeWithText:self.titleArr[indexPath.row]];
    
    return size;
    
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    FindListCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];

//    for (UIView *view in cell.contentView.subviews) {
//        if ([view isKindOfClass:[FindListCell class]]) {
//            [view removeFromSuperview];
//        }
//}
    cell.textLabel.text = self.titleArr[indexPath.item];
    
    if (indexPath.row == _currentPage) {
        cell.textLabel.textColor = [UIColor orangeColor];
        cell.textLabel.layer.borderColor = [UIColor orangeColor].CGColor;
    }
    else
    {
        cell.textLabel.textColor = [UIColor grayColor];
        cell.textLabel.layer.borderColor = [UIColor grayColor].CGColor;
    }
    


    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    
    FindListCell *cell = (FindListCell *)[collectionView cellForItemAtIndexPath:indexPath];
    cell.textLabel.textColor = [UIColor orangeColor];
    cell.textLabel.layer.borderColor = [UIColor orangeColor].CGColor;
    _cancelBlock(indexPath.item,_buttonTag);
}

- (void)setTitleArr:(NSArray *)titleArr{
    _titleArr = titleArr;
    [self initCollectionView];
    [self.collectionView reloadData];
    [self setNeedsDisplay];
    [self layoutIfNeeded];
    
}

/**
 *   获取字符宽度
 */
- (CGSize)getSizeWithText:(NSString*)text{
    NSMutableParagraphStyle* style = [[NSMutableParagraphStyle alloc] init];
    style.lineBreakMode = NSLineBreakByCharWrapping;
    CGSize size = [text boundingRectWithSize:CGSizeMake(CGFLOAT_MAX, 24) options: NSStringDrawingUsesLineFragmentOrigin   attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:14.0f],NSParagraphStyleAttributeName:style} context:nil].size;
    return CGSizeMake(size.width, 24);
}

@end
