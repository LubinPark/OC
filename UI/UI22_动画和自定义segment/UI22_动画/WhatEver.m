//
//  WhatEver.m
//  UI22_动画
//
//  Created by cuixin on 15/9/29.
//  Copyright © 2015年 芦彬. All rights reserved.
//

#import "WhatEver.h"
//按钮高度
#define kButtonHeigth 30

//按钮宽度
#define kButtonWidth 160

//按钮间距
#define kSpacing 20

//按钮标题颜色
#define kBtnTitleColor [UIColor redColor]

//按钮未选中的颜色
#define kBtnTitleUnselectedColor [UIColor blackColor]

@interface WhatEver ()

//按钮的标识条
@property(nonatomic, strong)UIView *lineView;

@end


@implementation WhatEver

-(instancetype)initWithFrame:(CGRect)frame buttonTitleArray:(NSArray *)array{
    self = [super initWithFrame:frame];
    if (self) {
        self.btnTitleArray = [NSArray arrayWithArray:array];
    }
    return self;
}

//当数组传进来值的时候，创建视图
-(void)setBtnTitleArray:(NSArray *)btnTitleArray{
    
    if (_btnTitleArray != btnTitleArray) {
        _btnTitleArray = btnTitleArray;
    }
    
    UIScrollView *btnScrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(5, 5, self.frame.size.width, self.frame.size.height - 2)];
    //设置btnScrollView的contentSize
    btnScrollView.contentSize = CGSizeMake((kButtonWidth + kSpacing) * _btnTitleArray.count, 0);
    for (int i = 0; i < _btnTitleArray.count; i++) {
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        btn.backgroundColor = [UIColor whiteColor];
        btn.frame = CGRectMake(10 + (kButtonWidth + kSpacing) * i  , 0, kButtonWidth, kButtonHeigth);
        btn.tag = i + 1000;
        [btn setTitle:_btnTitleArray[i] forState:UIControlStateNormal];
        
        if (i == 0) {
            //btn.backgroundColor = [UIColor orangeColor];
            [btn setTitleColor:kBtnTitleColor forState:UIControlStateNormal];
        }else{
            [btn setTitleColor:kBtnTitleUnselectedColor forState:UIControlStateNormal];
            //btn.backgroundColor = [UIColor yellowColor];
        }
        
        [btn addTarget:self action:@selector(btnAction:) forControlEvents:UIControlEventTouchUpInside];
        [btnScrollView addSubview:btn];
    }
    
    self.lineView = [[UIView alloc]initWithFrame:CGRectMake(10,  kButtonHeigth + 3, kButtonWidth, 2)];
    self.lineView.backgroundColor = kBtnTitleColor;
    
    [btnScrollView addSubview:self.lineView];
    
    btnScrollView.tag = 100;
    btnScrollView.showsHorizontalScrollIndicator = NO;
    [self addSubview:btnScrollView];
    
}

-(void)btnAction:(UIButton *)sender{
    for (UIButton *btn in [self viewWithTag:100].subviews) {
        if ([btn isKindOfClass:[UIButton class]]) {
            if (btn.tag == sender.tag) {
                [btn setTitleColor:kBtnTitleColor forState:UIControlStateNormal];
            }else{
                [btn setTitleColor:kBtnTitleUnselectedColor forState:UIControlStateNormal];
            }
        }else{
            NSLog(@"%@", btn);
        }
    }
    
    //滑到中间
    UIScrollView *scrollView = (UIScrollView *)[self viewWithTag:100];
    scrollView.contentOffset = CGPointMake(sender.frame.origin.x - self.frame.size.width/2 + kButtonWidth/2, 0);
    
    [UIView animateWithDuration:0.3 animations:^{
        self.lineView.frame = CGRectMake(sender.frame.origin.x, self.lineView.frame.origin.y, kButtonWidth, 2);
    }];
    
    //指定代理执行的时刻 ，返回当前选中的按钮
    [self.delegate buttonOfWhatEverClick:sender];
}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
