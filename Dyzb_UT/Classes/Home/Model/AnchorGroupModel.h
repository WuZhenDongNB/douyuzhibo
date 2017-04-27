//
//  AnchorGroupModel.h
//  Dyzb_UT
//
//  Created by liutao on 17/4/18.
//  Copyright © 2017年 UTOUU. All rights reserved.
//

#import "BaseGameModel.h"
#import "recommendModel.h"
@interface AnchorGroupModel : BaseGameModel
@property (nonatomic, strong) NSMutableArray  *room_list;
@property (nonatomic, strong) NSString  *icon_name;
@property (nonatomic, strong)  NSMutableArray<recommendModel *> *anchors;
@end
