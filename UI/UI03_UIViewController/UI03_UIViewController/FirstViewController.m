//
//  FirstViewController.m
//  UI03_UIViewController
//

#import "FirstViewController.h"
#import "LoginView.h"
#import "SecondViewController.h"

@interface FirstViewController ()<UITextFieldDelegate>

@end

@implementation FirstViewController


#pragma mark 加载视图(UIViewController自带的UIView)
-(void)loadView{
    [super loadView];
    
    LoginView *loginView = [[LoginView alloc]initWithFrame:CGRectMake(50, 50, 200, 100)];
    //设置loginView中textField 的代理
    loginView.textField.delegate = self;

    //设置loginView中label的文本
    loginView.label.text= @"用户名";
    
    //设置loginView中button的点击事件
    [loginView.button addTarget:self action:@selector(loginAction:) forControlEvents:UIControlEventTouchUpInside];
    
    //替代self.view为loginView
    //self.view = loginView;
    [self.view addSubview:loginView];
}

#pragma mark loginAction实现
-(void)loginAction:(UIButton *)button{
    
    //实现跳转到secondViewController
    SecondViewController *second = [[SecondViewController alloc]init];
    
    //模态的动画效果
    second.modalPresentationStyle = UIModalPresentationCurrentContext;
    
    //实现"模态"跳转 关键词:present
    [self presentViewController:second animated:YES completion:^{
        NSLog(@"完成模态跳转");
    }];
    
    //实现"模态"跳转回来 关键词:dismiss
    [self dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark 视图已经加载
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    //每个视图控制器都会自带一个IUView(大小为当前屏幕大小)
    //self.view.backgroundColor = [UIColor orangeColor];
    //NSLog(@"%s,%d",__func__,__LINE__);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
    
    //监视内存警告
    //1.检测当前视图控制器是否处于加载状态
    //2.检测当前视图是否处于window上
    
    //如果既不处于加载状态也不处于window上,那么我们释放掉
    if([self isViewLoaded] && self.view.window ==nil){
        //将根视图进行销毁
    }
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
