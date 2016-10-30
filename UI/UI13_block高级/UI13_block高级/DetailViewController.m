//
//  DetailViewController.m
//  UI13_block高级
//

#import "DetailViewController.h"
#import "RootViewController.h"
@interface DetailViewController ()

@end

@implementation DetailViewController

- (void)dealloc{
#pragma mark block的释放使用block_releas()
    Block_release(_myblock);
    [super dealloc];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"收藏" style:UIBarButtonItemStylePlain target:self action:@selector(collectAction:)];
    
    UIButton *button = [[UIButton alloc]initWithFrame:CGRectMake(100, 100, 100, 100)];
    button.backgroundColor = [UIColor purpleColor];
    [button addTarget:self action:@selector(toRootAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
    [button release];
    self.view.backgroundColor = [UIColor orangeColor];
}

-(void)collectAction:(id)sender{
    //当用户为登陆状态,可以进行收藏相关操作
    //当用户为在登陆状态,模态出登陆页面
#pragma mark 通常我们使用NSUserDefault记录用户信息/登陆状态等轻量级信息.(内部实现原理为plist文件)
    //可以通过不同的Key值,将数据存储到NSUserDefaults中.;例如:登陆状态(BOOL),用户名(NSString),密码(Integer).....
    
    //系统默认为NO, 如果现实成功,是因为forKey:@"isLoad"是系统字段.该成其他
    //[[NSUserDefaults standardUserDefaults] setBool:NO forKey:@"isLoads"];
    //[[NSUserDefaults standardUserDefaults] setObject:@"lubin" forKey:@"name"];
    //[[NSUserDefaults standardUserDefaults] setInteger:123456 forKey:@"password"];
    [[NSUserDefaults standardUserDefaults ] setObject:@"今天很不爽" forKey:@"state"];
    
    //判断登陆状态
    if ([[NSUserDefaults standardUserDefaults] boolForKey:@"isLoads"]) {
        NSLog(@"收藏成功");
    }
}

-(void)toRootAction:(UIButton *)button{
#pragma mark 第三步:指定调用block的时刻
      self.myblock(self.view.backgroundColor);
    [self.navigationController popToRootViewControllerAnimated:YES];
}

//-(void)changeBackgroundColor:(Block)block{
//    self.myblock = block;
//}


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
