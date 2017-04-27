//
//  recommendModel.h
//  Dyzb_UT
//
//  Created by liutao on 17/4/14.
//  Copyright © 2017年 UTOUU. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface recommendModel : NSObject

@property (nonatomic, assign) NSInteger  room_id;
@property (nonatomic, strong) NSString  *vertical_src;
@property (nonatomic, assign) NSInteger  *isVertical;
@property (nonatomic, strong) NSString  *room_name;
@property (nonatomic, strong) NSString  *nickname;
@property (nonatomic, assign) NSInteger  online;
@property (nonatomic, strong) NSString  *anchor_city;

- (instancetype)initWithDic:(NSDictionary *)dic;
@end
