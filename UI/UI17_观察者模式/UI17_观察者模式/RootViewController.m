//
//  RootViewController.m
//  UI17_观察者模式
//
//  Created by 芦彬 on 15/9/21.
//  Copyright (c) 2015年 芦彬. All rights reserved.
//

#import "RootViewController.h"

@interface RootViewController ()

@end

@implementation RootViewController

#warning 注意：观察者对象在不使用时一定要移除（因为时刻监视，耗费内存）
- (void)dealloc{
    //注销对象时，要先移除观察者，然后释放、
    [self.person removeObserver:self forKeyPath:@"name"];
    [_person release];
    [super dealloc];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.person = [[Person alloc]init];
    self.person.name = @"张三";
    //添加一个观察者用来检测person对象的name属性变化
    [self.person addObserver:self forKeyPath:@"name" options:NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld | NSKeyValueObservingOptionInitial context:@"观察self.person的属性变化"];
    
    self.textField = [[UITextField alloc]initWithFrame:CGRectMake(100, 100, 100, 50)];
    self.textField.backgroundColor = [UIColor orangeColor];
    [self.view addSubview:self.textField];
    [self.textField release];
    
    UIButton *button = [[UIButton alloc]initWithFrame:CGRectMake(100 , 250, 100, 50)];
    button.backgroundColor = [UIColor grayColor];
    
    [button addTarget:self action:@selector(clickAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
    // Do any additional setup after loading the view.
}

#pragma mark 观察者触发的方法
- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context{
    NSLog(@"%@",keyPath);
    NSLog(@"%@",object);
    NSLog(@"%@",change);
    NSLog(@"%@",context);
    
    if([change[@"old"] isEqualToString:change[@"new"]]){
        NSLog(@"新值老值相等");
    }
}

-(void)clickAction:(UIButton *)button{
    self.person.name = self.textField.text;
    NSLog(@"%@",self.person.name);
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
