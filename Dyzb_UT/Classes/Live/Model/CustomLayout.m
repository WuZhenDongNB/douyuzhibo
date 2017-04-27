//
//  CustomLayout.m
//  Dyzb_UT
//
//  Created by Mr. Wu on 17/4/12.
//  Copyright © 2017年 UTOUU. All rights reserved.
//

#import "CustomLayout.h"

@interface CustomLayout ()

/** 这个字典用来存储每一列最大的Y值(每一列的高度) */
@property (nonatomic, strong) NSMutableDictionary *maxYDict;
/** 存放所有的布局属性 */
@property (nonatomic, strong) NSMutableArray *attrsArray;

@end

@implementation CustomLayout
#pragma mark - 懒加载
- (NSMutableDictionary *)maxYDict
{
    if (!_maxYDict) {
        self.maxYDict = [[NSMutableDictionary alloc] init];
    }
    return _maxYDict;
}

- (NSMutableArray *)attrsArray
{
    if (!_attrsArray) {
        self.attrsArray = [[NSMutableArray alloc] init];
    }
    return _attrsArray;
}

- (id)init
{
    if(self = [super init]){
        //默认
        self.columnMargin = 10;
        self.rowMargin = 10;
        self.sectionInset = UIEdgeInsetsMake(10, 10, 10, 10);
        self.columnsCount = 1;
    }
    return self;
}

//布局跟新
- (BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)newBounds
{
    NSLog(@"布局跟新");
    return NO;
}

//每次布局之前的准备
- (void)prepareLayout
{
    NSLog(@"每次布局之前的准备");
    [super prepareLayout];
    // 清空最大的Y值
    for (int i= 0; i < self.columnsCount; i++) {
        NSString *column = [NSString stringWithFormat:@"%d", i];
        self.maxYDict[column] = @(self.sectionInset.top);
    }
    [self.attrsArray removeAllObjects];
    //    // 计算每组有多少个cell
    //    NSInteger count = [self.collectionView numberOfItemsInSection:0];
    //    // 计算所有cell的属性
    //    for (int i = 0; i < count; i ++) {
    //        UICollectionViewLayoutAttributes * attrs = [self layoutAttributesForItemAtIndexPath:[NSIndexPath indexPathForItem:i inSection:0]];
    //        [self.attrsArray addObject:attrs];
    //    }
    
    //修改 ++ 新增辅助视图（可以添加headerView） + 可以含有自定义cell
    //新增headerView
    if ([self.collectionView.dataSource respondsToSelector:@selector(collectionView:viewForSupplementaryElementOfKind:atIndexPath:)]) {//如果调用的辅助视图（证明有headerView）
        //headerView的布局属性
        UICollectionViewLayoutAttributes * headerAttrs = [self.collectionView layoutAttributesForSupplementaryElementOfKind:UICollectionElementKindSectionHeader atIndexPath:[NSIndexPath indexPathForItem:0 inSection:0]];
        
        //将其布局属性加入到属性数组中
        [self.attrsArray addObject:headerAttrs];
        
        //初始化y轴坐标
        CGFloat headerViewHeight = self.sectionInset.top + headerAttrs.size.height;
        //遍历得到每一个列对应的y轴坐标
        for (int i = 0; i < self.columnsCount; i ++) {
            [self.maxYDict setObject:[NSNumber numberWithFloat:headerViewHeight] forKey:[@(i) stringValue]];
        }
    }
    
    //直接从界面中获取(保证封装的通用性)
    if([self.collectionView.dataSource respondsToSelector:@selector(collectionView:numberOfItemsInSection:)]){
        //获取每一组的个数
        NSInteger count = [self.collectionView numberOfItemsInSection:0];
        for (int i= 0; i < count; i ++) {
            UICollectionViewLayoutAttributes * atts = [self layoutAttributesForItemAtIndexPath:[NSIndexPath indexPathForItem:i inSection:0]];
            [self.attrsArray addObject:atts];
        }
    }
}

//返回所有的尺寸
- (CGSize)collectionViewContentSize
{
    NSLog(@"返回所有的尺寸");
    __block NSString * maxColum = @"0";
    [self.maxYDict enumerateKeysAndObjectsUsingBlock:^(NSString  *column, NSNumber * maxY, BOOL * _Nonnull stop) {
        if ([maxY floatValue] > [self.maxYDict[maxColum] floatValue]) {
            maxColum = column;
        }
    }];
    
    return CGSizeMake(0, [self.maxYDict[maxColum] floatValue] + self.sectionInset.bottom);
}


/**
 *  返回indexPath这个位置Item的布局属性
 */
- (UICollectionViewLayoutAttributes *)layoutAttributesForItemAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"返回indexPath这个位置Item的布局属性");
    // 假设最短的那一列的第0列
    __block NSString *minColumn = @"0";
    // 找出最短的那一列
    [self.maxYDict enumerateKeysAndObjectsUsingBlock:^(NSString *column, NSNumber *maxY, BOOL *stop) {
        if ([maxY floatValue] < [self.maxYDict[minColumn] floatValue]) {
            minColumn = column;
        }
    }];
    
    // 计算尺寸
    CGFloat width = (self.collectionView.frame.size.width - self.sectionInset.left - self.sectionInset.right - (self.columnsCount - 1) * self.columnMargin)/self.columnsCount;
    //这个方法本来需要判断一下在实现的，但是他是必须实现的，只有实现了才能够进行布局的
    CGFloat height = [self.delegate waterflowLayout:self heightForWidth:width atIndexPath:indexPath];
    //设置最出高度
    if(height == 0){
        height = 40;
    }
    
    // 计算位置
    CGFloat x = self.sectionInset.left + (width + self.columnMargin) * [minColumn intValue];
    CGFloat y = [self.maxYDict[minColumn] floatValue] + self.rowMargin;
    
    // 更新这一列的最大Y值
    self.maxYDict[minColumn] = @(y + height);
    
    // 创建属性
    UICollectionViewLayoutAttributes *attrs = [UICollectionViewLayoutAttributes layoutAttributesForCellWithIndexPath:indexPath];
    attrs.frame = CGRectMake(x, y, width, height);
    return attrs;
}


//
- (nullable UICollectionViewLayoutAttributes *)layoutAttributesForSupplementaryViewOfKind:(NSString *)elementKind atIndexPath:(NSIndexPath *)indexPath
{
    UICollectionViewLayoutAttributes * headerAttbute = [UICollectionViewLayoutAttributes layoutAttributesForSupplementaryViewOfKind:elementKind withIndexPath:indexPath];
    //得到headerView的高度
    CGFloat height = [self.delegate waterflowLayout:self heightForHeaderViewSection:indexPath.section];
    //设置headerView的布局属性
    
    //坐标
    CGFloat x = self.sectionInset.left;
    CGFloat y = self.sectionInset.top;
    //wideth
    CGFloat width = self.collectionView.frame.size.width - self.sectionInset.left - self.sectionInset.right;
    
    headerAttbute.frame = CGRectMake(x, y, width, height);
    
    return headerAttbute;
}

/**
 *  返回rect范围内的布局属性
 */
- (NSArray *)layoutAttributesForElementsInRect:(CGRect)rect
{
    NSLog(@"返回rect范围内的布局属性");
    return self.attrsArray;
}



@end
