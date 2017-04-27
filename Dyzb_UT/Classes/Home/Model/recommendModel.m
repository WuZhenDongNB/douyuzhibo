//
//  recommendModel.m
//  Dyzb_UT
//
//  Created by liutao on 17/4/14.
//  Copyright © 2017年 UTOUU. All rights reserved.
//

#import "recommendModel.h"

@implementation recommendModel

- (instancetype)initWithDic:(NSDictionary *)dic {
    self = [super init];
    if (self) {
        
        [self setValuesForKeysWithDictionary:dic];
    }
    return self;
}
- (void)setValue:(id)value forUndefinedKey:(NSString *)key {


}
@end
