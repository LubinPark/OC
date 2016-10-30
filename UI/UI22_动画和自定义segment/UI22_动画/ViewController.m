//
//  ViewController.m
//  UI22_动画
//
//  Created by 芦彬 on 15/9/29.
//  Copyright (c) 2015年 芦彬. All rights reserved.
//

#import "ViewController.h"
#import "WhatEver.h"
@interface ViewController ()<WhatEverDelegate>


//UIView动画操作的视图
@property (nonatomic, strong)UIView *aView;

@property (nonatomic, strong)UIImageView *aImageView;

@end
#warning 注意UIView 和CALayer的区别和联系

//UIView 负责显示和用户交互
//CALayer 负责图形渲染和布局

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    
    //self.aView = [[UIView alloc]initWithFrame:CGRectMake(0, self.view.frame.size.height - 400, self.view.frame.size.width, 200)];
    //self.aView.backgroundColor = [UIColor greenColor];
    //[self.view addSubview:self.aView];
    
    
    self.aView = [[UIView alloc]initWithFrame:CGRectMake(0, 300, self.view.frame.size.width, 200)];
    self.aView.backgroundColor =[UIColor grayColor];
    [self.view addSubview:self.aView];
    
//    NSArray *array = @[@"正在热播", @"即将上映",@"正在热播", @"即将上映",@"正在热播", @"即将上映",@"正在热播", @"即将上映",@"正在热播", @"即将上映",@"正在热播", @"即将上映",@"正在热播", @"即将上映"];
//    WhatEver *ever = [[WhatEver alloc]initWithFrame:CGRectMake(0, 130, self.view.frame.size.width, 42) buttonTitleArray:array];
//    ever.backgroundColor = [UIColor groupTableViewBackgroundColor];
//    ever.delegate = self;
//    [self.view addSubview:ever];
    
    NSString *string = @"http://amuse.nen.com.cn/imagelist/11/21/9as70n3ir61b.jpg";
    NSURL *url = [NSURL URLWithString:string];
    NSData *data = [NSData dataWithContentsOfURL:url];
    
    UIImage *image = [UIImage imageWithData:data];
    self.aImageView = [[UIImageView alloc]initWithImage:image];
    self.aImageView.frame = CGRectMake(130, 180, 100, 100);
    [self.view addSubview:self.aImageView];
    
    //设置视图4个角的半径
    self.aImageView.layer.cornerRadius = 100 / 2;
    //超出边界范围不渲染
    self.aImageView.layer.masksToBounds = YES;
    //给视图加边框
    self.aImageView.layer.borderWidth = 1;
    //设置边框的颜色
    self.aImageView.layer.borderColor = [[UIColor redColor]CGColor];s
}


-(void)buttonOfWhatEverClick:(UIButton *)sender{
    NSLog(@"按钮的tag 值%ld, 按钮标题 %@", sender.tag, sender.currentTitle );
}


//开始UIview动画
#warning uiview动画可以影响的属性包括:frame, center, bounds, backgroundColor, alpha , transform;

- (IBAction)viewAnimation:(UIButton *)sender {
    
    sender.selected = !sender.isSelected;
    //第一步UIView动画
    //参数说明:1.动画播放时长 2.动画实现部分
    /*
    if (sender.isSelected) {
        [UIView animateWithDuration:2.0 animations:^{
            self.aView.frame = CGRectMake(0, self.view.frame.size.height - 200, self.view.frame.size.width, 200);
        }];
    }else{
        [UIView animateWithDuration:2.0 animations:^{
            self.aView.frame = CGRectMake(0, self.view.frame.size.height - 300, self.view.frame.size.width, 200);
        }];
    }
    */
    
    /*
    //UIView的第二种动画效果实现
    //参数说明 1. 动画播放时长 2,动画实现部分 3.动画完成时
    //动画的延迟操作,通常在动画播放完成之后添加操作.
    [UIView animateWithDuration:2.0 animations:^{
        self.aView.frame = CGRectMake(0, self.view.frame.size.height - 200, self.view.frame.size.width, 200);
    } completion:^(BOOL finished) {
        self.aView.backgroundColor = [UIColor redColor];
    }];
    */
    
    //UIView动画的第三种实现
    //参数说明 1.动画播放时长 2.延时 3.阻尼(播放速度) 4.启动时的抖动幅度 5.抖动类型 6.动画实现部分 7.动画完成时
    /*
    [UIView animateWithDuration:5.0 delay:0.0 usingSpringWithDamping:0.8 initialSpringVelocity:10 options:UIViewAnimationOptionOverrideInheritedCurve animations:^{
        
        self.aView.frame = CGRectMake(80, self.view.frame.size.height - 200, 200, 200);
        self.aView.layer.cornerRadius = 100;
        self.aView.backgroundColor = [UIColor purpleColor];

     } completion:^(BOOL finished) {
        
        [UIView animateWithDuration:5.0 delay:0.0 usingSpringWithDamping:0.6 initialSpringVelocity:5 options:UIViewAnimationOptionOverrideInheritedCurve animations:^{
            self.aView.frame = CGRectMake(0, self.view.frame.size.height - 300, self.view.frame.size.width, 200);
            self.aView.alpha = 0.5;
        } completion:^(BOOL finished) {
        }];
    }];
     */
    /*
    //第四种 动画实现(动画快)
    //开始UIView
    [UIView beginAnimations:@"animation" context:nil];
    
    //进行UIView动画的属性设置
    [UIView setAnimationDuration:2.0];
    [UIView setAnimationDelay:1.0];
    self.aView.frame = CGRectMake(0, self.view.frame.size.height - 200, self.view.frame.size.width, 200);
    
    //结束UIView
    [UIView commitAnimations];
    */
}

//2D仿射效果
- (IBAction)TwoD:(id)sender {
    
    //self.aImageView.transform = CGAffineTransformMakeScale(0.5, 0.5);
    //self.aImageView.transform = CGAffineTransformScale(self.aImageView.transform, 0.9, 0.9);
    //区分2D仿射动画相对于初始和上一次的区别
    //方法中有Make相对于初始状态,没有make关键字的相对于上一次
    
    //M_PI代表是180度 M_PI_2 是90 M_PI_4是45
    //self.aImageView.transform = CGAffineTransformMakeRotation(M_PI / 4);

    //旋转
    //self.aImageView.transform = CGAffineTransformRotate(self.aImageView.transform, M_PI_4);
    
    //偏移
    //self.aImageView.transform = CGAffineTransformTranslate(self.aImageView.transform, 30, 10);
}

- (IBAction)layerDonghua:(id)sender {
    
    //CATransition *transition = [CATransition animation];
    
    //设置动画的时长
    //[transition setDuration:2];
    //设置动画的重复次数
    //[transition setRepeatCount:MAXFLOAT];
    
    //transition.type =  @"cameraIrisHollowOpen";
    //transition.type = kCATransitionPush;
    
    //[self.aImageView.layer addAnimation:transition forKey:@"1"];
    
    //属性动画的两个自雷动画(CABasicAnimation 和 CAKeyFrameAnimation)
    CABasicAnimation *firstBasicAnimation = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
    //动画时长
    [firstBasicAnimation setDuration:10];
    //重复次数
    [firstBasicAnimation setRepeatCount:1];
    //变化成1倍到4倍
    //firstBasicAnimation.fromValue = [NSNumber numberWithFloat:1.0];
    firstBasicAnimation.toValue = [NSNumber numberWithFloat:4.0];
    [self.aImageView.layer addAnimation:firstBasicAnimation forKey:nil];
    
//    CABasicAnimation *second = [CABasicAnimation animationWithKeyPath:@"transform.rotation"];
//    [second setDuration:5];
//    [second setRepeatCount:MAXFLOAT];
//    second.fromValue = [NSNumber numberWithFloat:0];
//    second.toValue = [NSNumber numberWithFloat:M_PI * 2];
//    [self.aImageView.layer addAnimation:second forKey:nil];

    
    //path 的值为路径位置
    CAKeyframeAnimation *firstKeyFrameAnimation = [CAKeyframeAnimation animationWithKeyPath:@"position"];
    
    [firstKeyFrameAnimation setDuration:10];
    [firstKeyFrameAnimation setRepeatCount:MAXFLOAT];

    //创建一个路径，用来记录移动的每一帧（坐标）
    CGMutablePathRef path = CGPathCreateMutable();
    //指定移动的起始点坐标
    CGPathMoveToPoint(path, NULL, self.aImageView.center.x, self.aImageView.center.y);
    //设置移动轨迹 也就是每一帧（坐标）
    //参数1.为移动路径
    //参数2.备用参数，设为NULL
    //参数3.移动的x坐标
    //参数4.移动的y坐标
//    CGPathAddLineToPoint(path, NULL, 100, 100);
//    CGPathAddLineToPoint(path, NULL, 10, 10);
//    CGPathAddLineToPoint(path, NULL, 20, 100);
//    CGPathAddLineToPoint(path, NULL, 140, 200);
//    CGPathAddLineToPoint(path, NULL, 170, 190);

    //给视图指定一条曲线路径 3个点的第一个路径，第二个备用，后6个是3个点 x，y，在这3个练成线的曲线上运动，为什么3个点3点是为了确定曲线而不是折线，这是曲线的方法
    CGPathAddCurveToPoint(path, NULL, 200, 200, 50, 50, 50, 150);
    CGPathAddCurveToPoint(path, NULL, 50, 150, 20, 100, 200, 200);
    CGPathAddCurveToPoint(path, NULL, 10, 60, 200, 180, 30, 100);
    CGPathAddCurveToPoint(path, NULL, 50, 90, 110, 10, self.aImageView.center.x,self.aImageView.center.y );
    //将路径添加到关键帧动画对象中
    [firstKeyFrameAnimation setPath:path];
    //[firstKeyFrameAnimation setDuration:5];
    [self.aImageView.layer addAnimation:firstKeyFrameAnimation forKey:@"keyFrameAnimation备注"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
