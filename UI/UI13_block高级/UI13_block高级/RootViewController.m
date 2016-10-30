//
//  RootViewController.m
//  UI13_block高级
//

#import "RootViewController.h"
#import "DetailViewController.h"
@interface RootViewController ()

@end

@implementation RootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //Block高级 完美的OC-Block复习
    
    //无返回值,无参数,打印一句话
    void(^block)() = ^{
        NSLog(@"无参,无返回值");
    };
    block();
    
    //有返回值,无参数 ,返回局部变量n(+ 1)的值
    __block int n = 0;
    int(^block1)() = ^{
        return n++;
    };
    block1();
    NSLog(@"%d", n);
    
    //有参数有返回值 计算a+b 返回和
    int (^block2)(int ,int) = ^(int a ,int b){
        int sum = a + b;
        return sum;
    };
    NSLog(@"%d",block2(4,5));
    
//    NSLog(@"%@",block);
//    NSLog(@"%@",block1);
//    NSLog(@"%@",block2);
      
    //block注意事项:
    //block 默认在全局区
    //如果block中使用的外部变量,那么block在栈区
    //通常我们使用block都需要对block进行copy操作,将之拷贝到堆区
    //栈区和堆区的区别:
    //1:栈区的变量受计算机自动管理,堆区的变量由工程师手动分配内存,管理和释放;
    //2:栈区存储空间小,堆区存储空间大;
    //3:栈区操作简单,使用不灵活,堆区操作复杂,使用灵活,但是容易产生内存碎片
    
    UIButton *button = [[UIButton alloc]initWithFrame:CGRectMake(120, 150, 100, 50)];
    button.backgroundColor = [UIColor redColor];
    [button addTarget:self action:@selector(toDetailAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
    [button release];

    // Do any additional setup after loading the view.
}

-(void)toDetailAction:(UIButton *)button{
    DetailViewController *detail = [[DetailViewController alloc]init];
#pragma mark 第四步:Block的实现
    detail.myblock = ^(UIColor *backgroundColor){
        self.view.backgroundColor = backgroundColor;
    };
    
//    [detail changeBackgroundColor:^(UIColor *color) {
//        self.view.backgroundColor = color;
//    }];
    
    [self.navigationController pushViewController:detail animated:YES];
}


-(void)viewDidAppear:(BOOL)animated{
    NSLog(@"state=======%@",[[NSUserDefaults standardUserDefaults]objectForKey:@"state"]);
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
