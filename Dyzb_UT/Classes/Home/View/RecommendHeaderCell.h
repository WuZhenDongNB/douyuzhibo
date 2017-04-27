//
//  RecommendHeaderCell.h
//  Dyzb_UT
//
//  Created by liutao on 17/4/12.
//  Copyright © 2017年 UTOUU. All rights reserved.
//

#import "BaseTableViewCell.h"

typedef void(^cycleBlock)(NSInteger index);
@interface RecommendHeaderCell : BaseTableViewCell

+ (instancetype)cellWithTableview:(UITableView *)tableview;
- (void)loadDataWithImageUrlstring:(NSArray *)images;
@property (nonatomic, copy) cycleBlock  BannerBlock;
@end
