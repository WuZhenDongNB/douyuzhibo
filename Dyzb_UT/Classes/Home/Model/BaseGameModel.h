//
//  BaseGameModel.h
//  Dyzb_UT
//
//  Created by liutao on 17/4/18.
//  Copyright © 2017年 UTOUU. All rights reserved.
//

#import "BaseModel.h"

@interface BaseGameModel : BaseModel

@property (nonatomic, strong) NSString  *tag_name;
@property (nonatomic, strong) NSString  *icon_url;
- (instancetype)initWithDic:(NSDictionary *)dic;
@end
