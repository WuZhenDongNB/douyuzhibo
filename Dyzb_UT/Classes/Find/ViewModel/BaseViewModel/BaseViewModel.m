//
//  BaseViewModel.m
//  Dyzb_UT
//
//  Created by 孙好运 on 2017/4/12.
//  Copyright © 2017年 UTOUU. All rights reserved.
//

#import "BaseViewModel.h"


@implementation BaseViewModel

#pragma 获取网络可到达状态
-(void) netWorkStateWithNetConnectBlock: (NetWorkBlock) netConnectBlock WithURlStr: (NSString *) strURl;
{
//    _networkBlock = netConnectBlock;
//    switch ([AFHTTPSessionManager manager].reachabilityManager.networkReachabilityStatus)
//    {
//        case AFNetworkReachabilityStatusReachableViaWWAN:
//        case AFNetworkReachabilityStatusReachableViaWiFi:
//            _networkBlock(YES);
//            break;
//        case AFNetworkReachabilityStatusNotReachable:
//            _networkBlock(NO);
//            break;
//        default:
//            _networkBlock(NO);
//    }
}


#pragma 接收穿过来的block

-(void) setBlockWithReturnBlock: (ReturnValueBlock) returnBlock
                 WithErrorBlock: (ErrorCodeBlock) errorBlock
               WithFailureBlock: (FailureBlock) failureBlock
{
    _returnBlock = returnBlock;
    _errorBlock = errorBlock;
    _failureBlock = failureBlock;
}

-(void) setBlockWithReturnBlock: (ReturnValueBlock) returnBlock
                 WithErrorBlock: (ErrorCodeBlock) errorBlock
               WithFailureBlock: (FailureBlock) failureBlock
             WithNoNetWorkBlock:(void (^)())noNetworkBlock
{
    _returnBlock = returnBlock;
    _errorBlock = errorBlock;
    _failureBlock = failureBlock;
    _noNetworkBlock = noNetworkBlock;
}

@end
