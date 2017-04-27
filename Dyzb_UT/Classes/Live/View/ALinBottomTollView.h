//
//  ALinBottomTollView.h
//  Dyzb_UT
//
//  Created by Mr. Wu on 17/4/13.
//  Copyright © 2017年 UTOUU. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSUInteger, LiveToolType) {
    LiveToolTypePublicTalk,
    LiveToolTypePrivateTalk,
    LiveToolTypeGift,
    LiveToolTypeRank,
    LiveToolTypeShare,
    LiveToolTypeClose
};

@interface ALinBottomTollView : UIView
/** 点击工具栏  */
@property(nonatomic, copy)void (^clickToolBlock)(LiveToolType type);

@end
