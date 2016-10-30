//
//  FourthViewController.m
//  UILast_消息中心
//
//  Created by 芦彬 on 15/9/30.
//  Copyright (c) 2015年 芦彬. All rights reserved.
//

#import "FourthViewController.h"
#import "ViewController.h"
#import "Single.h"

@interface FourthViewController ()

@end

@implementation FourthViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor colorWithRed:0.907 green:1.000 blue:0.758 alpha:1.000];
    //self.view.backgroundColor = self.color;
    self.navigationItem.title =@"第4页";
    
    self.button1 = [[UIButton alloc]initWithFrame:CGRectMake(100, 100, 100, 100)];
    self.button1.backgroundColor = self.color;
    [self.button1 addTarget:self action:@selector(returnToFirst:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.button1];
}

- (void)returnTothird:(UIButton *)button{
    [self.delegate toChangecColor:self.view.backgroundColor];
    [self.navigationController popViewControllerAnimated:YES];
}

-(void)ToChangeColor:(UIColor *)color{
     self.view.backgroundColor = color;
}

-(void)returnToFirst:(UIButton *)button{
    Single *single = [Single shareSingle];
    single.color = self.view.backgroundColor;
    //[self.navigationController popToRootViewControllerAnimated:YES];
    
    
    //第二步:创建字典(保存消息内容)
    NSDictionary *dic = @{@"color":button.backgroundColor};

    //第三步: 发送消息(广播)
    //参数说明 1.消息标识 2.发送消息的对象 3.携带消息的内容(字典)
    [[NSNotificationCenter defaultCenter]postNotificationName:@"九层妖塔" object:self userInfo:dic];
    [self.navigationController popToRootViewControllerAnimated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
