//
//  ThirdViewController.m
//  UILast_消息中心
//
//  Created by 芦彬 on 15/9/30.
//  Copyright (c) 2015年 芦彬. All rights reserved.
//

#import "ThirdViewController.h"
#import "FourthViewController.h"
#import "SecondViewController.h"

@interface ThirdViewController ()<FourViewDelegate>

@end

@implementation ThirdViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor greenColor];
    self.navigationItem.title =@"第3页";

    self.button1 = [[UIButton alloc]initWithFrame:CGRectMake(100, 100, 100, 100)];
    self.button1.backgroundColor = self.color;
    [self.button1 addTarget:self action:@selector(toNextAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.button1];
    
    self.button2 = [[UIButton alloc]initWithFrame:CGRectMake(100, 300, 100, 100)];
    self.button2.backgroundColor = [UIColor colorWithRed:0.500 green:0.094 blue:0.127 alpha:1.000];
    [self.view addSubview:self.button2];
    [self.button2 addTarget:self action:@selector(returnToSencond:) forControlEvents:UIControlEventTouchUpInside];
}

- (void)toNextAction:(UIButton *)button{
    FourthViewController *four = [[FourthViewController alloc]init];
    four.color = self.button1.backgroundColor;
    
    four.delegate = self;
    [self.navigationController pushViewController:four animated:YES];
}

- (void)returnToSencond:(UIButton *)button{
    [self.delegate changeColor:self.button2.backgroundColor];
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)toChangecColor:(UIColor *)color{
    self.button2.backgroundColor = color;
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
