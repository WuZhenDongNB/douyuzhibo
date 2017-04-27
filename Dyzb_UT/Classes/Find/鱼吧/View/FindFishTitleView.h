//
//  FindFishTitleView.h
//  Dyzb_UT
//
//  Created by 孙好运 on 2017/4/17.
//  Copyright © 2017年 UTOUU. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol FindTitleViewDelegate <NSObject>

-(void)TitleButton_Click:(UIButton*)btn;

@end

@interface FindFishTitleView : UIView

@property (nonatomic,strong)NSArray * nameArr;
@property (nonatomic,assign)NSInteger curPage;  //当前页

@property(nonatomic,assign)id <FindTitleViewDelegate>delegate;


@end
