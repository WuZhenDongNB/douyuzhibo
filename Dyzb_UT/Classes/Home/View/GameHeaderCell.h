//
//  GameHeaderCell.h
//  Dyzb_UT
//
//  Created by liutao on 17/4/13.
//  Copyright © 2017年 UTOUU. All rights reserved.
//

#import "BaseTableViewCell.h"
#import "AnchorGroupModel.h"
@class GameHeaderCell;
@protocol GameHeaderCellDelefgate <NSObject>

- (void)gameHeaderCell:(GameHeaderCell *)gameHeaderCell didSelectItemAtIndexPath:(NSIndexPath *)indexPath;

@end

@interface GameHeaderCell : BaseTableViewCell
@property (nonatomic, assign) id<GameHeaderCellDelefgate>  delegate;
@property (nonatomic, strong) NSMutableArray <AnchorGroupModel *> *anchors;
+(instancetype)cellWithTableview:(UITableView *)tableview;
@end
