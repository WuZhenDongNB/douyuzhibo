//
//  FindView.m
//  Dyzb_UT
//
//  Created by 孙好运 on 2017/4/12.
//  Copyright © 2017年 UTOUU. All rights reserved.
//

#import "FindView.h"

@implementation FindView

-(id) init
{
    self = [super init];
    if (self)
    {
        self.userInteractionEnabled = YES;
//        [self initalControls];
    }
    return self;
}

-(void)initalControls{
    
    UIView *view = [[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 100)];
//    NSArray *imageArr = @[@"",@"",@"",@""];
    NSArray *titleArr = @[@"鱼吧",@"热门视频",@"排行榜",@"热门小组"];
    
    CGFloat width = SCREEN_WIDTH / titleArr.count;
    
    for (int i=0; i<titleArr.count; i++) {
        UIButton *btn = [[UIButton alloc]init];
        btn.frame = CGRectMake(10+width, 3,width, 30);
        btn.backgroundColor = [UIColor redColor];
        [btn setTitle:titleArr[i] forState:UIControlStateNormal];
        
        [view addSubview:btn];
    }
    
}

- (void)setTitleStr:(NSString *)titleStr{
    
    _titleStr = titleStr;
    
    [self initalControls];
}

@end
