//
//  CustomLayout.h
//  Dyzb_UT
//
//  Created by Mr. Wu on 17/4/12.
//  Copyright © 2017年 UTOUU. All rights reserved.
//

#import <UIKit/UIKit.h>


@class CustomLayout;

@protocol WaterflowLayoutDelegate <NSObject>

@optional
//得到每张图片布局的高度
- (CGFloat)waterflowLayout:(CustomLayout *)waterflowLayout heightForWidth:(CGFloat)width atIndexPath:(NSIndexPath *)indexPath;

//collection 辅助视图的高度（类似于tableView的headerView）
- (CGFloat)waterflowLayout:(CustomLayout *)waterflowLayout heightForHeaderViewSection:(NSInteger)section;

@end

@interface CustomLayout : UICollectionViewFlowLayout

//@property (nonatomic, assign) UIEdgeInsets sectionInset;
/** 每一列之间的间距 */
@property (nonatomic, assign) CGFloat columnMargin;
/** 每一行之间的间距 */
@property (nonatomic, assign) CGFloat rowMargin;
/** 显示多少列 */
@property (nonatomic, assign) NSInteger columnsCount;

@property (nonatomic, weak) id<WaterflowLayoutDelegate>delegate;

@end
