//
//  OneViewController.m
//  UI13_UITabBarController
//

#import "OneViewController.h"
#import "DetailViewController.h"
@interface OneViewController ()

@end

@implementation OneViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationItem.title = @"第一页";
    
    UIButton *button = [[UIButton alloc]initWithFrame:CGRectMake(150, 150, 50, 50)];
    button.backgroundColor = [UIColor redColor];
    [button addTarget:self action:@selector(toDetailAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
    
    // Do any additional setup after loading the view.
}

-(void)toDetailAction:(UIButton *)button{
    DetailViewController *detail = [[DetailViewController alloc]init];
    //当push到下一页的时候,让当前的标签栏隐藏.默认是NO,不隐藏
    detail.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:detail animated:YES];
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
