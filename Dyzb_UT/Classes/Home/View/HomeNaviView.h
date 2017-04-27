//
//  HomeNaviView.h
//  Dyzb_UT
//
//  Created by liutao on 17/4/12.
//  Copyright © 2017年 UTOUU. All rights reserved.
//

#import "BaseView.h"
@class HomeNaviView;
@protocol HomeNaviViewDelegate <NSObject>

- (void)leftImageViewBtnWith:(HomeNaviView *)homeNaviView;
- (void)titleViewLeftViewBtnWith:(HomeNaviView *)homeNaviView;
- (void)QrcodeBtnWith:(HomeNaviView *)homeNaviView;
- (void)gameBtnWith:(HomeNaviView *)homeNaviView;
- (void)lockBtnWith:(HomeNaviView *)homeNaviView;
@end
@interface HomeNaviView : BaseView
@property (nonatomic, weak)  id<HomeNaviViewDelegate>  delegate;
@end
