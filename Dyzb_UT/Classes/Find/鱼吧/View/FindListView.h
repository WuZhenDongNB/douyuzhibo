//
//  FindListView.h
//  Dyzb_UT
//
//  Created by 孙好运 on 2017/4/18.
//  Copyright © 2017年 UTOUU. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FindListView : UIView

@property (strong , nonatomic) void(^cancelBlock)(NSInteger currentPage,NSInteger buttonTag);

//显示的数组
@property (nonatomic ,strong) NSArray *titleArr;

//记录上次点击
@property (nonatomic ,assign) NSInteger currentPage;

//记录btn的tag
@property (nonatomic , assign) NSInteger buttonTag;

@end
