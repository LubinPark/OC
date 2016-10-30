//
//  ViewController.m
//  CustomPCH
//
//  Created by dllo on 15/11/30.
//  Copyright © 2015年 L-G. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIButton *buttonFirst;
@property (weak, nonatomic) IBOutlet UIButton *buttonSecond;

@property (strong, nonatomic) CurrentViewController *currentVC;
@property (strong, nonatomic) CustomViewController *customVC;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    NSLog(@"%@", URL);
    
    // 系统版本号
    NSString *version = [UIDevice currentDevice].systemVersion;
    NSLog(@"当前版本号：%@",version);
    
    // 应用的版本号
    NSString *appVersion = [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleShortVersionString"];
    NSLog(@"应用版本号：%@",appVersion);
    
    // 构建版本号
    NSString *buildVersion = [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleVersion"];
    NSLog(@"构建版本号：%@",buildVersion);
    
    // 设备标识
    NSString *identify = [[UIDevice currentDevice].identifierForVendor UUIDString];
    NSLog(@"设备标识: %@",identify);
    
    _currentVC = [[CurrentViewController alloc] init];
    _currentVC.view.frame = CGRectMake(0, 0, 375, 667);
    _currentVC.view.backgroundColor = [UIColor orangeColor];
    
    [self.view addSubview:_currentVC.view];
    [self addChildViewController:_currentVC];
    [self.view bringSubviewToFront:_buttonFirst];
    [self.view bringSubviewToFront:_buttonSecond];
}
- (IBAction)buttonFirstAction:(id)sender {
    
    [self.view bringSubviewToFront:_currentVC.view];
    [self.view bringSubviewToFront:sender];
    [self.view bringSubviewToFront:_buttonSecond];
}
- (IBAction)buttonSecondAction:(id)sender {
    if (!_customVC) {
        _customVC = [[CustomViewController alloc]init];
        _customVC.view.frame = CGRectMake(0, 0, 375, 667);
        _customVC.view.backgroundColor = [UIColor redColor];
        [self.view addSubview:_customVC.view];
        [self.view bringSubviewToFront:_customVC.view];
        [self addChildViewController:_currentVC];
    }
    [self.view bringSubviewToFront:_customVC.view];
    [self.view bringSubviewToFront:sender];
    [self.view bringSubviewToFront:_buttonFirst];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
