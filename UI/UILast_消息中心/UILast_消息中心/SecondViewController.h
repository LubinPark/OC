//
//  SecondViewController.h
//  UILast_消息中心
//
//  Created by 芦彬 on 15/9/30.
//  Copyright (c) 2015年 芦彬. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol SecondViewDelegate <NSObject>

- (void)changeColor:(UIColor *)color;

@end

@interface SecondViewController : UIViewController

@property (nonatomic, retain)UIButton *button1;

@property (nonatomic, retain)UIButton *button2;

@property (nonatomic, retain)UIColor *color;

@property (nonatomic, assign)id<SecondViewDelegate>delegate;

@end
