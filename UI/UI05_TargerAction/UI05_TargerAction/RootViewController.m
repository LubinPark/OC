//
//  RootViewController.m
//  UI05_TargerAction
//

#import "RootViewController.h"
#import "MyView.h"

@interface RootViewController ()

@end

@implementation RootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
     // Do any additional setup after loading the view.
    
#pragma mark Target-Action 目标动作机制
    //优质程序的设计标准:"高内聚,低耦合"
    //低耦合:模块和模块之间降低练习,使之独立性更强
    //高内聚:使模块内功能更加紧凑
    MyView *my = [[MyView alloc]initWithFrame:CGRectMake(120, 100, 100, 50)];
    
#pragma mark 第七步:为视图添加点击事件
    [my addMyTarget:self action:@selector(changeColor:)];
    [self.view addSubview:my];
    [my release];
}

#pragma mark 第八步:事件实现
- (void)changeColor:(MyView *)sender{
    sender.backgroundColor = [UIColor redColor];
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
