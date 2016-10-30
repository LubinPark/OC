//
//  FirstCollectionViewCell.h
//  UI20_UICollectionView
//
//  Created by 芦彬 on 15/9/24.
//  Copyright (c) 2015年 芦彬. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FirstCollectionViewCell : UICollectionViewCell

/**
 *  图片地址
 */
@property(nonatomic, copy)NSString *pictureURL;
/**
 *  当前分区和单元标识
 */
@property(nonatomic,copy)NSString *currentSection;


@end
