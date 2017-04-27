//
//  DyHttpTool.m
//  Dyzb_UT
//
//  Created by liutao on 17/4/12.
//  Copyright © 2017年 UTOUU. All rights reserved.
//

#import "DyHttpTool.h"
#import "AFNetworking.h"
@implementation DyHttpTool

+ (void)get:(NSString *)url params:(NSDictionary *)params success:(void (^)(id))success failure:(void (^)(NSError *))failure
{
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.requestSerializer.timeoutInterval = 15;
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json",
                                                         @"text/html",
                                                         @"image/jpeg",
                                                         @"image/png",
                                                         @"application/octet-stream",
                                                         @"text/json",
                                                         @"text/plain",
                                                         nil];

    [manager GET:url parameters:params progress:^(NSProgress * _Nonnull uploadProgress) {
        
    }success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
       
        NSLog(@"json%@",[responseObject class]);
        if (success) {
            success(responseObject);
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        if (failure) {
            failure(error);
        }
    }];
   
}

+(void)post:(NSString *)url params:(NSDictionary *)params paratwo:(NSDictionary *)paratwo success:(void (^)(id))success failure:(void (^)(NSError *))failure {
   
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.requestSerializer.timeoutInterval = 15;
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json",
                                                         @"text/html",
                                                         @"image/jpeg",
                                                         @"image/png",
                                                         @"application/octet-stream",
                                                         @"text/json",
                                                         @"text/plain",
                                                         nil];
    [manager.requestSerializer setValue:@"pcclient" forHTTPHeaderField:@"aid"];
    [manager.requestSerializer setValue:paratwo[@"auth"] forHTTPHeaderField:@"auth"];
     [manager.requestSerializer setValue:paratwo[@"time"] forHTTPHeaderField:@"time"];
    
    [manager POST:url parameters:params progress:^(NSProgress * _Nonnull uploadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        if (success) {
            success(responseObject);
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        if (failure) {
            failure(error);
        }
    }];
}
@end
