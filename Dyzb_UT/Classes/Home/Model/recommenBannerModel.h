//
//  recommenBannerModel.h
//  Dyzb_UT
//
//  Created by liutao on 17/4/14.
//  Copyright © 2017年 UTOUU. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "recommendModel.h"
@interface recommenBannerModel : NSObject
@property (nonatomic, strong) NSString  *title;
@property (nonatomic, strong) NSString  *pic_url;
@property (nonatomic, strong) recommendModel  *room;
@end
