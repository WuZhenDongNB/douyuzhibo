//
//  DYdataUrls.m
//  Dyzb_UT
//
//  Created by liutao on 17/4/14.
//  Copyright © 2017年 UTOUU. All rights reserved.
//

#import "DYdataUrls.h"
#import <UIKit/UIKit.h>
@implementation DYdataUrls

//主页列表部分
NSString *const  URL_home_List = @"http://capi.douyucdn.cn/api/homeCate/getCateList";


//主页推荐部分
NSString *const URL_Home_Banner = @"http://www.douyutv.com/api/v1/slide/6";
NSString *const URL_Home_Hot = @"http://capi.douyucdn.cn/api/v1/getbigDataRoom";
NSString *const URL_Home_Face = @"http://capi.douyucdn.cn/api/v1/getVerticalRoom";
NSString *const URL_Home_Game = @"http://capi.douyucdn.cn/api/v1/getHotCate";
//主页手游部分
NSString *const  URL_home_HandsGameDetail = @"http://capi.douyucdn.cn/api/homeCate/getHotRoom?client_sys=ios&identification=3e760da75be261a588c74c4830632360";

//主页娱乐部分
NSString *const URL_Home_Amuse_Detail = @"http://capi.douyucdn.cn/api/v1/getHotRoom/2";
//主页游戏部分
NSString *const URL_Home_Game_Detail = @"http://capi.douyucdn.cn/api/homeCate/getHotRoom?client_sys=ios&identification=ba08216f13dd1742157412386eee1225";

//主页趣玩部分
NSString *const URL_Home_Funny_Detail = @"http://capi.douyucdn.cn/api/homeCate/getHotRoom?client_sys=ios&identification=393b245e8046605f6f881d415949494c";


@end
