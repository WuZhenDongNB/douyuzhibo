//
//  BaseViewModel.h
//  Dyzb_UT
//
//  Created by 孙好运 on 2017/4/12.
//  Copyright © 2017年 UTOUU. All rights reserved.
//

#import <Foundation/Foundation.h>

/*!
 *  定义通用ViewModel返回Block
 *  ReturnValueBlock 返回数据
 *  ErrorCodeBlock 返回错误
 *  FailureBlock 失败返回
 *  NetWorkBlock 获取网络的链接状态
 */
//
typedef void (^ReturnValueBlock) (id returnValue);
typedef void (^ErrorCodeBlock) (id errorCode);
typedef void (^FailureBlock)(id failMsg);
typedef void (^NetWorkBlock)(BOOL netConnetState);


@interface BaseViewModel : NSObject

@property (copy, nonatomic) ReturnValueBlock returnBlock;
@property (copy, nonatomic) ErrorCodeBlock errorBlock;
@property (copy, nonatomic) FailureBlock failureBlock;
@property (copy, nonatomic) NetWorkBlock networkBlock;
@property (copy, nonatomic) void(^noNetworkBlock)();
@property (copy, nonatomic) void (^tgtFailureBlock)();

//  获取网络的链接状态
-(void) netWorkStateWithNetConnectBlock:(NetWorkBlock) netConnectBlock WithURlStr:(NSString *) strURl;

//  传入交互的Block块
-(void) setBlockWithReturnBlock:(ReturnValueBlock) returnBlock WithErrorBlock:(ErrorCodeBlock) errorBlock WithFailureBlock:(FailureBlock) failureBlock;

-(void) setBlockWithReturnBlock:(ReturnValueBlock) returnBlock WithErrorBlock:(ErrorCodeBlock) errorBlock WithFailureBlock:(FailureBlock) failureBlock WithNoNetWorkBlock:(void(^)())noNetworkBlock;

@end
