//
//  RecommendTableViewCell.h
//  Dyzb_UT
//
//  Created by liutao on 17/4/13.
//  Copyright © 2017年 UTOUU. All rights reserved.
//

#import "BaseTableViewCell.h"
#import "recommendModel.h"
#import "AnchorGroupModel.h"
typedef enum : NSUInteger {
    SectionHeaderStyleHot = 0,
    SectionHeaderStyleOther,
} SectionHeaderType;

@class RecommendTableViewCell;

@protocol RecommendTableViewCellDelegate <NSObject>

@optional
- (void)recommendTableViewCell:(RecommendTableViewCell *)cell didSelectItemAtIndexPath:(NSIndexPath *)indexPath;

@end
@interface RecommendTableViewCell : BaseTableViewCell
@property (nonatomic, weak) id<RecommendTableViewCellDelegate> delegate;
@property (nonatomic, assign) SectionHeaderType  setionType;
@property (nonatomic, strong) AnchorGroupModel *anchor;
+ (instancetype)cellWithTableview:(UITableView *)tableview;
- (void)initDataWithModel:(NSMutableArray *)model;
@end
