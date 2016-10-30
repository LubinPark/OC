//
//  SecondViewController.m
//  UILast_消息中心
//
//  Created by 芦彬 on 15/9/30.
//  Copyright (c) 2015年 芦彬. All rights reserved.
//

#import "SecondViewController.h"
#import "ThirdViewController.h"

@interface SecondViewController ()<ThirdViewDegelate>

@end

@implementation SecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor brownColor];
    self.navigationItem.title =@"第2页";
    
    self.button1 = [[UIButton alloc]initWithFrame:CGRectMake(100, 100, 100, 100)];
    self.button1.backgroundColor = self.color;
    [self.button1 addTarget:self action:@selector(toNextAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.button1];
    
    self.button2 = [[UIButton alloc]initWithFrame:CGRectMake(100, 300, 100, 100)];
    self.button2.backgroundColor = [UIColor yellowColor];
    [self.button2 addTarget:self action:@selector(returnToFirst:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.button2];
}

- (void)toNextAction:(UIButton *)button{
    ThirdViewController *third = [[ThirdViewController alloc]init];
    third.color = self.button1.backgroundColor;
    
    third.delegate = self;
    [self.navigationController pushViewController:third animated:YES];
}

- (void)returnToFirst:(UIButton *)button{
    [self.delegate changeColor:self.button2.backgroundColor];
    [self.navigationController popToRootViewControllerAnimated:YES];
}

-(void)changeColor:(UIColor *)color{
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
