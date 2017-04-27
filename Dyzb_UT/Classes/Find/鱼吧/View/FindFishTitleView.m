//
//  FindFishTitleView.m
//  Dyzb_UT
//
//  Created by 孙好运 on 2017/4/17.
//  Copyright © 2017年 UTOUU. All rights reserved.
//

#import "FindFishTitleView.h"

#define BTNHEIGHT    27

@interface FindFishTitleView()<UIScrollViewDelegate>

//{
//    CGSize   size;
//}

@property (nonatomic,strong)UIScrollView * scrollView;
@property (nonatomic,strong)NSMutableArray * btnArr; //titleBtn数组

@property (nonatomic,strong)UIView *  bottomLineView; //底部指示view
//@property (nonatomic,assign)CGFloat   scrContentOffsetWidth;

@end

@implementation FindFishTitleView

-(instancetype)initWithFrame:(CGRect)frame{
    
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
//        [self setUpView];
    }
    return self;
}

-(void)setUpView{
    
//    self.nameArr = [NSArray arrayWithObjects:@"精选",@"我的小组",@"主播动态",@"英雄联盟",@"DOTA2",@"客厅游戏",@"王者荣耀",@"户外",@"娱乐综合",nil];
    
    _scrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height)];
    _scrollView.contentSize = CGSizeMake(self.frame.size.width+1200, 30);
    _scrollView.showsHorizontalScrollIndicator = NO;
    _scrollView.showsVerticalScrollIndicator = NO;
    _scrollView.delegate = self;
//    _scrollView.backgroundColor = [UIColor redColor];
    _scrollView.scrollEnabled = YES;
    [self addSubview:_scrollView];
    
    _btnArr = [NSMutableArray new];
    
    for (int i = 0; i < self.nameArr.count; i ++) {
        UIButton * button = [UIButton buttonWithType:UIButtonTypeCustom];
        button.tag = i;
        button.titleLabel.font = [UIFont systemFontOfSize:12];
        
        
//        button.layer.cornerRadius = 5;
//        //将多余的部分切掉
//        button.layer.masksToBounds = YES;
//        
//        button.layer.borderWidth = 1.0f;
//        button.layer.borderColor = [UIColor redColor].CGColor;
        
        [button setTitle:self.nameArr[i] forState:UIControlStateNormal];
        [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        button.titleLabel.textAlignment = NSTextAlignmentCenter;
        [button setTitleColor:[UIColor orangeColor] forState:UIControlStateSelected];
        [button addTarget:self action:@selector(titleBtnTouch:) forControlEvents:UIControlEventTouchUpInside];
        [self.scrollView addSubview:button];
        [_btnArr addObject:button];
    }
    
    UIView * bottomLineView = [[UIView alloc]init];
    self.bottomLineView = bottomLineView;
    bottomLineView.backgroundColor = [UIColor orangeColor];
    [self.scrollView addSubview:bottomLineView];
    [self layoutSubview];
    
}

-(void)setNameArr:(NSArray *)nameArr{
    
    _nameArr = nameArr;
    [self setUpView];
}

-(void)layoutSubview{
    
    _scrollView.scrollEnabled = YES;
//     CGFloat buttonWidth = self.frame.size.width / self.nameArr.count;
    
    CGFloat btnWidth = 0;
    
    for (int i=0; i<self.btnArr.count; i++) {
        UIButton *btn = self.btnArr[i];
        CGSize size = [self getSizeWithText:btn.titleLabel.text];
        btn.frame = CGRectMake(btnWidth, 0, size.width, BTNHEIGHT);
        btnWidth = btnWidth + size.width;
        if (i==0) {
            btn.selected = YES;
            
            [_bottomLineView mas_remakeConstraints:^(MASConstraintMaker *make) {
                make.centerX.mas_equalTo(btn.mas_centerX);
                make.top.mas_equalTo(btn.mas_bottom).offset(0);
                make.width.mas_equalTo(size.width/2.0);
                make.height.mas_equalTo(@(2));
            }];
        }
    }
    _scrollView.contentSize = CGSizeMake(btnWidth, 30);
    
    
}

-(void)setCurPage:(NSInteger)curPage{
    _curPage = curPage;
    UIButton *sender = self.btnArr[_curPage];
    [self titleBtnTouch:sender];
    
}


-(void)titleBtnTouch:(UIButton *)button{
    
    NSInteger tagValue = button.tag;
    for (UIButton * btn in self.btnArr) {
        if (btn.tag != tagValue) {
            btn.selected = NO;
        }else{
            btn.selected = YES;
        }
    }
    CGSize size = [self getSizeWithText:button.titleLabel.text];
    //设置指示条位置
    [UIView animateWithDuration:0.5 animations:^{
        [self.bottomLineView mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.centerX.mas_equalTo(button.mas_centerX);
            make.top.mas_equalTo(button.mas_bottom).offset(0);
            make.width.mas_equalTo(size.width/2.0);
            make.height.mas_equalTo(@(2));
        }];
    }];
    
    [self buttonMoveToButton:button];
    
    if ([self.delegate respondsToSelector:@selector(TitleButton_Click:)]) {
        [self.delegate TitleButton_Click:button];
    }
}

- (void)buttonMoveToButton:(UIButton *)sender{
    //偏移量在屏幕一半以上 和 最大偏移量减一半屏幕 中 时
    if (sender.frame.origin.x + sender.frame.size.width / 2 > self.frame.size.width / 2.0 && sender.frame.origin.x  <= self.scrollView.contentSize.width - self.frame.size.width / 2.0)
    {
        [self.scrollView setContentOffset:CGPointMake((sender.frame.origin.x + sender.frame.size.width / 2) - self.frame.size.width / 2.0, 0) animated:YES];
    }
    
    //偏移量 大于 最大偏移量减一半屏幕时
    else if (sender.frame.origin.x > self.scrollView.contentSize.width - self.frame.size.width / 2.0)
    {
        
        [self.scrollView setContentOffset:CGPointMake(self.scrollView.contentSize.width - self.frame.size.width + 20, 0) animated:YES];
    }
    
    //偏移量在屏幕一半以下
    else
    {
        [self.scrollView setContentOffset:CGPointZero animated:YES];
    }
    
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
