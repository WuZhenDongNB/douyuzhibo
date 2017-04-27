
//
//  FindViewModel.m
//  Dyzb_UT
//
//  Created by 孙好运 on 2017/4/12.
//  Copyright © 2017年 UTOUU. All rights reserved.
//

#import "FindViewModel.h"
#import "BaseItemCellModel.h"
#import "FindCellModel.h"

#import "FindView.h"

@implementation FindViewModel

-(FindView *) initalPersonalCenterView:(NSDictionary *)dic
{
    FindView *view = [FindView new];
    for (NSString *key in [dic allKeys])
    {
        id value = [dic objectForKey:key];
        [view setValue:value forKey:key];
    }
    return view;
}

-(FindCellModel *) initalPersonalCenterCellModel:(id)view Height:(CGFloat)height Method:(NSString *)methodStr
{
    FindCellModel *cellModel = [FindCellModel new];
    cellModel.view = view;
    cellModel.height = height;
    cellModel.methodStr = methodStr;
    cellModel.selectionStyle = UITableViewCellSelectionStyleNone;
    cellModel.className = @"FindTableViewCell";
    return cellModel;
}

//- (void)getDataSource{
//    
//    BaseSectionModel *fristSection = [BaseSectionModel new];
//    
//    NSArray *titleArr = @[@"鱼吧",@"热门视频",@"排行榜",@"热门小组"];
//    
//    NSDictionary *fristDic = @{@"titleStr":@"a"
//                               };
//    
//    
//    FindCellModel *cellModel = [self initalPersonalCenterCellModel:[self initalPersonalCenterView:fristDic] Height:100 Method:nil];
//    
//    [fristSection.items addObject:cellModel];
//    
//    NSArray *arr = @[fristSection];
//    
//    self.returnBlock(arr);
//}

@end
