//
//  BaseGameModel.m
//  Dyzb_UT
//
//  Created by liutao on 17/4/18.
//  Copyright © 2017年 UTOUU. All rights reserved.
//

#import "BaseGameModel.h"

@implementation BaseGameModel

- (void)setValue:(id)value forUndefinedKey:(NSString *)key {
    
    
}
- (instancetype)initWithDic:(NSDictionary *)dic {
    self = [super init];
    if (self) {
        
        [self setValuesForKeysWithDictionary:dic];
    }
    return self;
}

@end
