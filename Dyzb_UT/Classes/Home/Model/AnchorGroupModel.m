//
//  AnchorGroupModel.m
//  Dyzb_UT
//
//  Created by liutao on 17/4/18.
//  Copyright © 2017年 UTOUU. All rights reserved.
//

#import "AnchorGroupModel.h"

@implementation AnchorGroupModel

- (void)setRoom_list:(NSMutableArray *)room_list {

    _room_list = room_list;
    if (room_list.count > 0) {
        for (int i = 0; i < room_list.count; i ++) {
            recommendModel *model = [[recommendModel alloc] initWithDic:room_list[i]];
            [self.anchors addObject:model];
            
        }
    }
}

- (NSMutableArray<recommendModel *> *)anchors {

    if (!_anchors) {
        _anchors = [NSMutableArray array];
    }
    return _anchors;
}
@end
