//
//  PlayerViewControllerViewController.h
//  Dyzb_UT
//
//  Created by Mr. Wu on 17/4/13.
//  Copyright © 2017年 UTOUU. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PlayerViewControllerViewController : UIViewController
@property(nonatomic,strong)NSString *playurl;

@property(nonatomic,strong)NSString *imageUrl;
/** 直播 */
@property (nonatomic, strong) NSArray *lives;
/** 当前的index */
@property (nonatomic, assign) NSUInteger currentIndex;

@property (nonatomic, weak) UIViewController *parentVc;

@end
