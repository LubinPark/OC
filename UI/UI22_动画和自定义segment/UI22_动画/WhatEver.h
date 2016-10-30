//
//  WhatEver.h
//  UI22_动画
//
//  Created by cuixin on 15/9/29.
//  Copyright © 2015年 芦彬. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol WhatEverDelegate <NSObject>

-(void)buttonOfWhatEverClick:(UIButton *)sender;

@end

@interface WhatEver : UIView

/**
 *  按钮标题数组
 */
@property(nonatomic, strong)NSArray *btnTitleArray;

/**
 *  按钮标题颜色以及标识线背景颜色
 */
@property(nonatomic, strong)UIColor *tintColor;


-(instancetype)initWithFrame:(CGRect)frame buttonTitleArray:(NSArray *)array;


@property(nonatomic, assign)id <WhatEverDelegate>delegate;

@end
