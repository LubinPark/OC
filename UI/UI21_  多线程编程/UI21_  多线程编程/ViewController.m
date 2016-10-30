//
//  ViewController.m
//  UI21_  多线程编程
//
//  Created by chuxinyu123 on 15/9/28.
//  Copyright (c) 2015年 芦彬. All rights reserved.
//

#import "ViewController.h"

//进程：正在进行中的应用程序
//线程：程序最小的执行单元
//进程和线程的联系：一个进程中最少的一个线程（主线程）
//进程和线程的区别：进程可以调度应用程序的所有资源，线程负责使用
@interface ViewController ()

@end

@implementation ViewController
- (IBAction)buttonOne:(id)sender {
    //线程阻塞
    //当程序中只有一个线程的时候，这个线程被称为主线程
    //主线程：线程中的代码顺序执行
    NSUInteger num = 0;
    for (int i = 1; i < 633500000; i++) {
        num += i;
    }
}

- (IBAction)buttonTwo:(id)sender {
    self.view.backgroundColor = [UIColor orangeColor];
}

- (IBAction)creatNSThread:(id)sender {
    //NSThread 是ios中轻量级的多线程
    //优点：操作简单步骤少
    //缺点：效率低，性能低
    //第一种：创建
    NSThread *firstThread = [[NSThread alloc] initWithTarget:self selector:@selector(changeBackgroundColor:) object:nil];
    //开启子线程
    [firstThread start];
    
    //第二种方法：通过结构便利器创建子线程（该方法创建子线程自动开启）
    [NSThread detachNewThreadSelector:@selector(summary:) toTarget:self withObject:nil];
}

-(void)summary:(id)sender
{
    NSLog(@"NSThread第二种子线程");
    NSInteger sum = 0;
    for (int i = 0; i < 633500000; i++) {
        sum = sum + i;
    }
    NSLog(@"sum = %ld",sum);
}

- (void)changeBackgroundColor:(id)sender
{
    NSLog(@"当前子线程");
    self.view.backgroundColor = [UIColor orangeColor];
}
//图片下载
- (IBAction)test:(id)sender {
   [NSThread detachNewThreadSelector:@selector(testPicture:) toTarget:self withObject:nil];
}

- (void)testPicture:(id)sender
{
    NSLog(@"当前线程:%@,是否为主线程%d",[NSThread currentThread],[NSThread isMainThread]);

    NSString *string = [NSString stringWithFormat: @"http://p1.pichost.me/i/40/1639665.png"];
    NSURL *url = [NSURL URLWithString:string];
    NSData *data = [NSData dataWithContentsOfURL:url];
    UIImage *image = [UIImage imageWithData:data];
    UIImageView *imageView = [[UIImageView alloc] initWithImage:image];
    imageView.frame = CGRectMake(20, 350, 375 - 40 , 220);
    [self.view addSubview:imageView];
    
//    dispatch_async(dispatch_get_main_queue(), ^{
//        self.imageView.image = image;
//    });
}
- (IBAction)createOperation:(id)sender {
    //NSOperation不用来创建子线程,通常使用2个子类(NSInvocationOperation,NSBlockOperation)
    NSInvocationOperation *firstInvocationOperation = [[NSInvocationOperation alloc]initWithTarget:self selector:@selector(invocationOperation:) object:nil];
    
    //[firstInvocationOperation start];
    
    NSBlockOperation *firstBlockOperation = [NSBlockOperation blockOperationWithBlock:^{
        //线程内部实现
        NSLog(@"block ,当前线程:%@,是否为主线程%d",[NSThread currentThread],[NSThread isMainThread]);
    }];
    
    //[firstBlockOperation start];
    
    //创建NSOperationQueue队列
    NSOperationQueue *firstQueue = [[NSOperationQueue alloc]init];
    
    //指定线程的执行顺序:方法参数为当前2个线程先执行的线程
    //[firstBlockOperation addDependency:firstInvocationOperation];
    //[firstInvocationOperation addDependency:firstBlockOperation];
    
    //设置当前队列同一时刻最多执行的线程数(即:线程并发最大数)
    //如果最大并发数为1,南无该队列为同步队列
    [firstQueue setMaxConcurrentOperationCount:2];
    
    //将创建好的线程添加到线程队列中统一管理
    [firstQueue addOperation:firstInvocationOperation];
    [firstQueue addOperation:firstBlockOperation];
}

- (IBAction)enterBackground:(id)sender {
    //NSObject进入后台执行
    [self performSelectorInBackground:@selector(testPicture:) withObject:nil];
}
- (IBAction)GCD:(id)sender {
    /*
    //获得系统主线程队列
    dispatch_queue_t mainQueue = dispatch_get_main_queue();
    
    //向主线程队列中添加任务
    //参数说明:第一个参数为线程队列, 第二个参数:为block
    dispatch_async(mainQueue, ^{
        //任务的执行部分
        NSLog(@"是否为主线程%d",[NSThread isMainThread]);
    });
    
    dispatch_async(mainQueue, ^{
        NSLog(@"2.是否为主线程%d",[NSThread isMainThread]);
    });
    
    dispatch_async(mainQueue, ^{
        NSLog(@"3.是否为主线程%d",[NSThread isMainThread]);
    });
    */
    
    /*
    // 创建自定义的串行队列
    //参数说明: 1.串行队列的标示符 2.当前队列类型
    //标示符通常使用倒写域名 @"www.baidu.com" 写成 "com.baidu.www"
    
    dispatch_queue_t serial = dispatch_queue_create("com.baidu.www", DISPATCH_QUEUE_SERIAL);
    
    dispatch_async(serial, ^{
        NSLog(@"1.是否为主线程 %d",[NSThread isMainThread]);
        for (NSInteger i = 0; i < MAXFLOAT; i ++) {
            NSLog(@"%ld",i);
        }
    });
    
    dispatch_async(serial, ^{
        NSLog(@"2.是否为主线程 %d",[NSThread isMainThread]);
    });
    
    dispatch_async(serial, ^{
        NSLog(@"3.是否为主线程 %d",[NSThread isMainThread]);
    });
     */
    
    /*
    //返回主线程队列的方法,通常使用在子线程中
    //什么时候返回主线程队列?如果创建UI或者更新UI的时候
    dispatch_async(dispatch_get_main_queue(), ^{
        //进行UI的现实或者更新
    });
    
    //创建自定义的并行队列
    //参数说明: 1.当前队列的标识 2.苹果备用参数
    dispatch_queue_t  concurrent = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_async(concurrent, ^{
        NSLog(@"1.是否在主线程队列中%d",[NSThread isMainThread]);
        for (NSInteger i = 0; i < MAXFLOAT; i++) {
            NSLog(@"%ld",i);
        }
    });
    
    dispatch_async(concurrent, ^{
        NSLog(@"2.是否在主线程队列中%d",[NSThread isMainThread]);
    });
    
    dispatch_async(concurrent, ^{
        NSLog(@"3.是否在主线程队列中%d",[NSThread isMainThread]);
    });
    */
    
#warning 重要 :延迟执行
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        NSLog(@"正在执行");
    });
    
//#warning 重要:只执行一次
//    static dispatch_once_t onceToken;
//    dispatch_once(&onceToken, ^{
//        NSLog(@"执行一次");
//    });
}

- (void)invocationOperation:(id)sender{
    NSLog(@"当前线程:%@,是否为主线程%d",[NSThread currentThread],[NSThread isMainThread]);
    for (int i = 0; i< MAXFLOAT; i++) {
        NSLog(@"%d",i);
    }
}

//GCD:iOS4.0出现
//优点:使用函数执行任务.所以执行效率高,性能优越
//缺点:不好记

- (void)viewDidLoad{
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
