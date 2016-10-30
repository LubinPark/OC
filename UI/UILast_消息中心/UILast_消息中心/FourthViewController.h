//
//  FourthViewController.h
//  UILast_消息中心
//
//  Created by 芦彬 on 15/9/30.
//  Copyright (c) 2015年 芦彬. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol FourViewDelegate <NSObject>

- (void)toChangecColor:(UIColor *)color;

@end

@interface FourthViewController : UIViewController

@property (nonatomic, retain)UIColor *color;

@property (nonatomic, retain)UIButton *button1;

@property (nonatomic, retain)UIButton *button2;

@property (nonatomic, assign)id <FourViewDelegate>delegate;

@end
