//
//  Dyzb_define.h
//  Dyzb_UT
//
//  Created by liutao on 17/4/11.
//  Copyright © 2017年 UTOUU. All rights reserved.
//

#ifndef Dyzb_define_h
#define Dyzb_define_h


/*
 控制台输出日志
 */
#ifndef __OPTIMIZE__
# define NSLog(...) NSLog(__VA_ARGS__)
#else
# define NSLog(...)
#endif

// 根据屏幕大小修正固定值 (Flexible Numerical)
#define SCREEN_WIDTH [UIScreen mainScreen].bounds.size.width
#define SCREEN_HEIGHT [UIScreen mainScreen].bounds.size.height

#define kSUBSCREEN_W(width) (((width)/375.0) * SCREEN_WIDTH)
#define kSUBSCREEN_H(height) (((height)/667.0) * SCREEN_HEIGHT)

#define kW(width) (kSUBSCREEN_W(width))
#define kH(height) (kSUBSCREEN_H(height))

/**
 *  生成随机色
 */
#define RANDOM_COLOR RGB(arc4random_uniform(256.0),arc4random_uniform(256.0),arc4random_uniform(256.0))

//RGB
#define RGBA(r, g, b, a)    [UIColor colorWithRed:r/255.0f green:g/255.0f blue:b/255.0f alpha:a]
#define RGB(r, g, b)     RGBA(r, g, b, 1.0f)
/////////////////////////////////////////////////
// 懒加载
#define DY_LAZY(object, assignment) (object = object ?: assignment)

// contentView 里面item的尺寸
// 视频item宽度
#define RECOMMEND_ITEM_WIDTH ((SCREEN_WIDTH - 3 * 10) * 0.5)
// 视频item高度
#define RECOMMEND_ITEM_HEIGHT (RECOMMEND_ITEM_WIDTH / 16 * 9 + 20)
// 栏目item宽度
#define COLUMN_ITEM_WIDTH ((SCREEN_WIDTH - 10 * 4) / 3)
// 栏目item高度
#define COLUMN_ITEM_HEIGHT (COLUMN_ITEM_WIDTH / 3 * 4 + 20)
// 推荐tableView行高
#define RECOMMEND_CELL_HEIGHT (RECOMMEND_ITEM_HEIGHT * 2 + 10)
#endif /* Dyzb_define_h */
