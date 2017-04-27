//
//  BaseItemCellModel.h
//  Dyzb_UT
//
//  Created by 孙好运 on 2017/4/12.
//  Copyright © 2017年 UTOUU. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface BaseItemCellModel : NSObject

@property (nonatomic , strong) NSString *className;

@property (nonatomic , strong) NSString *reuseIdentifier;

@property (nonatomic , strong) NSString *methodStr;

@property (nonatomic , strong) id obj;

@end


@interface BaseCellModel : BaseItemCellModel

@property (strong , nonatomic) UIView *view;

@property (nonatomic , assign) CGFloat height;

@property (nonatomic , assign) UITableViewCellSelectionStyle selectionStyle;

@end

@interface BaseItemModel : BaseItemCellModel

@property (nonatomic , assign) CGSize size;

@end

#pragma BaseSectionModel

@interface BaseSectionModel : NSObject

@property (strong , nonatomic) NSMutableArray *items;

@property (nonatomic,strong) NSString *reuseIdentifier;

@end

@interface BaseCellSectionModel : BaseSectionModel

@property (nonatomic,strong) UIView *view;

@property (assign , nonatomic) CGFloat heardHeight;

@property (assign , nonatomic) CGFloat footHeight;

@end

@interface BaseItemSectionModel : BaseSectionModel

@property (assign , nonatomic) CGSize heardSize;

@property (assign , nonatomic) CGSize footSize;

@property (nonatomic,strong) NSString *className;

@property (nonatomic , assign) UIEdgeInsets edageSize;

@end


