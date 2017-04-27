//
//  BaseTableView.m
//  Dyzb_UT
//
//  Created by liutao on 17/4/11.
//  Copyright © 2017年 UTOUU. All rights reserved.
//

#import "BaseTableView.h"

@implementation BaseTableView
- (void)dealloc{
    NSLog(@"************释放类%@*********",[NSString stringWithUTF8String:object_getClassName(self)]);
    
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
