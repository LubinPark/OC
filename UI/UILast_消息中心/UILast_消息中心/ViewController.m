//
//  ViewController.m
//  UILast_消息中心
//
//  Created by 芦彬 on 15/9/30.
//  Copyright (c) 2015年 芦彬. All rights reserved.
//

#import "ViewController.h"
#import "SecondViewController.h"
#import "Single.h"

@interface ViewController ()<SecondViewDelegate>

@end

@implementation ViewController

//- (void)dealloc{
//    //在不使用的时候一定要移除消息中心
//    [[NSNotificationCenter defaultCenter]removeObserver:self forKeyPath:@"九层妖塔"];
//    [super dealloc];
//}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    Single *single = [[Single alloc]init];
    self.view.backgroundColor = [UIColor colorWithRed:0.517 green:0.575 blue:0.600 alpha:1.000];
    self.navigationItem.title =@"第1页";
    
    //第一步:注册消息中心(约定暗号)
    //参数说明: 1.接收消息的对象 2.接收到消息后执行的方法 3.消息的标识 4.接收的对象
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(receiveNotification:) name:@"九层妖塔" object:nil];
    
    self.button1 = [[UIButton alloc]initWithFrame:CGRectMake(100, 100, 100, 100)];
    self.button1.backgroundColor = [UIColor redColor];
    [self.button1 addTarget:self action:@selector(toNextAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.button1];
    
    self.button2 = [[UIButton alloc]initWithFrame:CGRectMake(100, 300, 100, 100)];
    self.button2.backgroundColor = [UIColor purpleColor];
    [self.view addSubview:self.button2];
}

- (void)viewWillDisappear:(BOOL)animated{
    Single *single = [[Single alloc]init];
    if (single.color != nil) {
        self.view.backgroundColor = single.color;
    }
}

//第四步:接收到消息的执行方法:方法带参数,参数需要是NSNotification
//参数中包含接收到的3个属性,name(消息标识),object(发送消息对象),userInfo(消息携带的字典(字典内包含了消息传递的内容信息))
- (void)receiveNotification:(NSNotification *)notification{
    NSLog(@"%@, %@, %@", notification.name,notification.object,notification.userInfo);
    self.view.backgroundColor = notification.userInfo[@"color"];
}

- (void)toNextAction:(UIButton *)button{
    SecondViewController *second = [[SecondViewController alloc]init];
    second.color = self.view.backgroundColor;
    second.delegate = self;
    [self.navigationController pushViewController:second animated:YES];
}

- (void)changeColor:(UIColor *)color{
    self.button2.backgroundColor = color;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
