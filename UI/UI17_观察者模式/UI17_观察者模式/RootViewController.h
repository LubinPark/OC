//
//  RootViewController.h
//  UI17_观察者模式
//
//  Created by 芦彬 on 15/9/21.
//  Copyright (c) 2015年 芦彬. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Person.h"
@interface RootViewController : UIViewController

@property (nonatomic ,retain) Person *person;

@property (nonatomic, retain) UITextField *textField;

@property (nonatomic, retain) UIButton *button;

@end
