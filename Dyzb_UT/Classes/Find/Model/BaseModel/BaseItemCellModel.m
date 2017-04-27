//
//  BaseItemCellModel.m
//  Dyzb_UT
//
//  Created by 孙好运 on 2017/4/12.
//  Copyright © 2017年 UTOUU. All rights reserved.
//

#import "BaseItemCellModel.h"

@implementation BaseItemCellModel

-(instancetype) init
{
    self = [super init];
    if(self)
    {
        self.reuseIdentifier = [[NSUUID UUID] UUIDString];
    }
    return self;
}

@end


@implementation BaseCellModel

@end


@implementation BaseItemModel


@end

@implementation BaseSectionModel

-(instancetype) init
{
    self = [super init];
    if(self)
    {
        self.reuseIdentifier = [[NSUUID UUID] UUIDString];
    }
    return self;
}

-(NSMutableArray *) items
{
    if (!_items)
    {
        _items = [NSMutableArray array];
    }
    return _items;
}
@end

@implementation BaseCellSectionModel


@end

@implementation BaseItemSectionModel


@end

