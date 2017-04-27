//
//  gameCollectionViewCell.h
//  Dyzb_UT
//
//  Created by liutao on 17/4/13.
//  Copyright © 2017年 UTOUU. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface gameCollectionViewCell : UICollectionViewCell
@property (nonatomic, strong) UIImageView  *projectImageView;
@property (nonatomic, strong) UILabel  *projectLable;
+ (instancetype)collectionViewCellWithCollectionView:(UICollectionView *)collectionview index:(NSIndexPath *)index;
@end
