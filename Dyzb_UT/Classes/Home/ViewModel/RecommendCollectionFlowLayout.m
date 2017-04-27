//
//  RecommendCollectionFlowLayout.m
//  Dyzb_UT
//
//  Created by liutao on 17/4/13.
//  Copyright © 2017年 UTOUU. All rights reserved.
//

#import "RecommendCollectionFlowLayout.h"

@implementation RecommendCollectionFlowLayout
- (instancetype)init
{
    if (self = [super init]) {
        self.itemSize = CGSizeMake(RECOMMEND_ITEM_WIDTH,RECOMMEND_ITEM_HEIGHT);
        self.minimumLineSpacing = 10;
        self.minimumInteritemSpacing = 10;
        self.sectionInset = UIEdgeInsetsMake(0, 10, 0, 10);
    }
    return self;
}
@end
