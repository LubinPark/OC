//
//  RootViewController.m
//  UI04_Touch
//

#import "RootViewController.h"
#import "NextViewController.h"
#import "TouchView.h"

@interface RootViewController ()

@end

@implementation RootViewController
#pragma mark 视图控制器中视图的生命周期

/**
 1.初始化方法
 2.loadView
 3.viewDidLoad
 注意:以上方法直走一次
    :以下方法可以多次执行
 4.viewWillAppear
 5.viewDisAppear
 
 6.viewWillDisappear
 7.viewDidDisappear
 */

//视图控制器的初始化方法
#pragma mark 控制器的初始化方法,不管你调用不调用,都会运行
- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        NSLog(@"视图控制器的初始化方法");
    }
    return self;
}

#pragma mark 加载视图(self.view)
-(void)loadView{
    
#pragma mark 如果使用loadView,一定要写[super loadView]
    [super loadView];
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectMake(130, 50, 100, 100);
    [btn setTitle:@"主页" forState:UIControlStateNormal];
    btn.backgroundColor = [UIColor redColor];
    //设置圆角 设置的值为弧度的半径
    btn.layer.cornerRadius = 10;
    [btn addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
    NSLog(@"%s,%d",__func__,__LINE__);
    
    //关闭响应者链
//    self.view.userInteractionEnabled = NO;
    
#pragma mark  很重要*****  当一个视图无法响应事件时,原因如下:
    //1.用户交互 userInteractionEnabled 当一个视图无法响应,检查父视图是否开启用户交互
    //2.当前视图是否在父视图额范围内(frame)
    
    TouchView *touchView = [[TouchView alloc]initWithFrame:CGRectMake(80, 100, 200, 50)];
    touchView.backgroundColor = [UIColor blueColor];
    touchView.changeType = LoginViewChangeColor;
    [self.view addSubview:touchView];
    [touchView release];
    
    TouchView *touchView2 =[[TouchView alloc]initWithFrame:CGRectMake(80, 200, 200, 50)];
    [self.view addSubview:touchView2];
    touchView2.changeType = LoginViewChangeLocation;
    [touchView2 release];
    
    TouchView *touchView3 =[[TouchView alloc]initWithFrame:CGRectMake(80, 300, 200, 50)];
    [self.view addSubview:touchView3];
    
    //事件链,no为关闭
    //touchView3.userInteractionEnabled = NO;
    touchView3.changeType = LoginViewChangeColorAndLocation;
    [touchView3 release];
    
    UIView *aview = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 100, 20)];
    aview.backgroundColor= [UIColor blueColor];
    [touchView3 addSubview:aview];
    [aview release];
    
    UIView * bigView = [[UIView alloc]initWithFrame:CGRectMake(80, 400, 200, 200)];
    bigView.backgroundColor = [UIColor redColor];
    bigView.tag = 100;
    [self.view addSubview:bigView];
    [bigView release];
    
    UIButton *button = [[UIButton alloc]initWithFrame:CGRectMake(-50, 50, 100, 100)];
    button.backgroundColor = [UIColor colorWithRed:0.149 green:1.000 blue:0.190 alpha:1.000];
    button.layer.cornerRadius = 50;
    [button addTarget:self action:@selector(changeBackgroundColor:) forControlEvents:UIControlEventTouchUpInside];
    [bigView addSubview:button];
    [button release];
    
}

//点击屏幕换色
//- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
//    self.view.backgroundColor = [UIColor magentaColor];
//}

- (void)changeBackgroundColor:(UIButton *)button{
    button.backgroundColor = [UIColor colorWithRed:0.979 green:0.276 blue:0.137 alpha:1.000];
    //[self.view viewWithTag:100].backgroundColor = [UIColor colorWithRed:1.000 green:0.580 blue:0.844 alpha:1.000];
}

- (void)buttonClick:(UIButton *)button{
    NextViewController *next = [[NextViewController alloc]init];
    next.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;
    [self presentViewController:next animated:YES completion:^{
    }];
}

#pragma mark 视图已经加载完成
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor orangeColor];
    NSLog(@"%s,%d",__func__,__LINE__);
    // Do any additional setup after loading the view.
}

#pragma mark 视图将要显示(可以执行多次)
- (void)viewWillAppear:(BOOL)animated{
    NSLog(@"%s,%d",__func__,__LINE__);
}

#pragma mark 视图已经显示
- (void)viewDidAppear:(BOOL)animated{
    NSLog(@"%s,%d",__func__,__LINE__);
}

#pragma mark 视图将要消失
-(void)viewWillDisappear:(BOOL)animated{
    NSLog(@"%s,%d",__func__,__LINE__);
}

#pragma mark 视图已经消失
- (void)viewDidDisappear:(BOOL)animated{
    NSLog(@"%s,%d",__func__,__LINE__);
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
