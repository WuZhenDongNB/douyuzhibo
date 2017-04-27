//
//  FindVideoView.m
//  Dyzb_UT
//
//  Created by 孙好运 on 2017/4/18.
//  Copyright © 2017年 UTOUU. All rights reserved.
//

#import "FindVideoView.h"

#import "FindFishController.h"

#import "FindListView.h"

#import "FindFishTitleView.h"

#define BTNHEIGHT    27

#define Height_TitleView   30

@interface FindVideoView ()<UIScrollViewDelegate>

@property (nonatomic,strong)UIScrollView * scrollView;

@property (nonatomic,strong)NSMutableArray * btnArr; //titleBtn数组

@property (nonatomic,strong) UIButton *iconButton;

@property (nonatomic,assign) NSInteger current;

@property (nonatomic,assign) NSInteger buttonTag;

@end

@implementation FindVideoView

-(instancetype)initWithFrame:(CGRect)frame{
    
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        [self setUpView];
        self.current = 0;
        self.buttonTag = 100;
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
    
    _iconButton = [[UIButton alloc]init];
    _iconButton.backgroundColor = [UIColor whiteColor];
    [_iconButton setImage:[UIImage imageNamed:@"1"] forState:UIControlStateNormal];
    [_iconButton addTarget:self action:@selector(iconClick:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:_iconButton];
    
    [_iconButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self);
        make.right.mas_equalTo(self);
        make.width.mas_equalTo(30);
        make.height.mas_equalTo(self);
    }];
    
    
    _btnArr = [NSMutableArray new];
    
    for (int i = 0; i < self.nameArr.count; i ++) {
        UIButton * button = [UIButton buttonWithType:UIButtonTypeCustom];
        button.tag = i;
        
        button.titleLabel.font = [UIFont systemFontOfSize:12];
        [button setTitle:self.nameArr[i] forState:UIControlStateNormal];
        [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        button.titleLabel.textAlignment = NSTextAlignmentCenter;
        [button setTitleColor:[UIColor orangeColor] forState:UIControlStateSelected];
        [button addTarget:self action:@selector(titleBtnTouch:) forControlEvents:UIControlEventTouchUpInside];
        [self.scrollView addSubview:button];
        [_btnArr addObject:button];
    }
    [self layoutSubview];
    
}

-(void)iconClick:(UIButton *)sender{
    
    FindListView *view = [[FindListView alloc]initWithFrame:CGRectMake(0, 30 , SCREEN_WIDTH,SCREEN_HEIGHT - 30)];
    
    view.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.5];
    
    view.currentPage = _current;
    view.titleArr = self.nameArr;
    FindFishController *vc  = (FindFishController *)self.nextResponder.nextResponder;
    
//    FindFishTitleView *titleView = [FindFishTitleView new];
//    titleView.tag = 888;
//    [[vc.navigationController.view viewWithTag:888] removeFromSuperview];
    
    view.tag = 808080;
    view.buttonTag = _buttonTag;
    view.cancelBlock = ^(NSInteger currentPage,NSInteger buttonTag){
        _current = currentPage;
        _buttonTag = buttonTag;
        UIButton *btn = self.btnArr[currentPage];
        [self titleBtnTouch:btn];
        
        [[vc.navigationController.view viewWithTag:808080] removeFromSuperview];
    };
    [vc.view addSubview:view];
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
        btn.frame = CGRectMake(btnWidth , 0, size.width, BTNHEIGHT);
        btnWidth = btnWidth + size.width + 10;
        
        
        btn.layer.cornerRadius = 10;
        //将多余的部分切掉
        btn.layer.masksToBounds = YES;
        btn.layer.borderWidth = 1.0f;
        
        if (i==0) {
            btn.selected = YES;
            btn.layer.borderColor = [UIColor orangeColor].CGColor;
        }
    }
    _scrollView.contentSize = CGSizeMake(btnWidth, 30);
    
    
}

-(void)titleBtnTouch:(UIButton *)button{
    

    NSInteger tagValue = button.tag;
    for (UIButton * btn in self.btnArr) {
        if (btn.tag != tagValue) {
            btn.selected = NO;
            
        }else{
            btn.selected = YES;
            
        }
        
        if (btn.selected == YES ) {
            btn.layer.borderColor = [UIColor orangeColor].CGColor;
        }
        else{
            btn.layer.borderColor = [UIColor grayColor].CGColor;
        }
        
    }
    [self buttonMoveToButton:button];

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
