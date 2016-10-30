//
//  RootViewController.m
//  UI15_网络编程
//

#import "RootViewController.h"

//异步请求需要遵循NSURLConnectionDelegate代理
@interface RootViewController ()<NSURLConnectionDataDelegate>

/**
 *  创建一个NSMutableData 用来接受异步网路请求每次返回的Data
 */
@property (nonatomic,retain)NSMutableData *asynData;

@property (nonatomic,retain)UIImageView *aImage;

@end

@implementation RootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSArray *array = @[@"GET同步请求", @"POST同步请求", @"GET异步请求", @"POST异步请求"];
    for (int i = 0; i < 4; i++) {
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        button.frame = CGRectMake(90, 100 + 70 * i, 200, 50);
        [button setTitle:array[i] forState:UIControlStateNormal];
        [button addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
        button.tag = i + 1;
        button.backgroundColor = [UIColor greenColor];
        [self.view addSubview:button];
        
        self.aImage = [[UIImageView alloc]initWithFrame:CGRectMake(50, 400, 300, 150)];
        self.aImage.backgroundColor = [UIColor orangeColor];
        [self.view addSubview:self.aImage];
        
        UIButton *button2 = [[UIButton alloc]initWithFrame:CGRectMake(50, 600, 100, 50)];
        button2.backgroundColor = [UIColor purpleColor];
        [self.view addSubview:button2];
    }
    // Do any additional setup after loading the view.
}

- (void)buttonAction:(UIButton *)sender{
    switch (sender.tag) {
        case 1:
            //GET同步请求
            [self getSyn];
            self.view.backgroundColor = [UIColor redColor];
            break;
        case 2:
            //POST同步请求
            self.view.backgroundColor = [UIColor greenColor];
            [self postSyn];
            break;
        case 3:
            //GET异步请求
            [self getAsyn];
            self.view.backgroundColor = [UIColor purpleColor];
            break;
        case 4:
            //POST异步请求
            [self postAsyn];
            break;
        default:
            break;
    }
}

#pragma mark GET同步请求
- (void)getSyn{
    NSLog(@"开始GET同步请求");
    //1.获得网络字符串
//    NSString *urlString = @"http://movieapi.m.damai.cn/Movie/Show/MovieList.aspx?cityId=852&k=&page=1&source=10099&type=2&version=50101";
    NSString *urlString  = @"http://p1.pichost.me/i/40/1639665.png";
    //2.装换成NSURL对象
    NSURL *url = [NSURL URLWithString:urlString];
    //3.创建请求对象
    NSURLRequest *request = [[NSURLRequest alloc]initWithURL:url];
    //4.创建服务器端相应对象
    NSURLResponse *response = nil;
    //错误信息
    NSError *error = nil;
    //建立网路连接
    //参数说明:1.请求对象 2.相应对象 3.错误信息提示对象
    NSData *data = [NSURLConnection sendSynchronousRequest:request returningResponse:&response error:&error];
    if (error != nil) {
        NSLog(@"%@", error);
    }
    //json解析
    //进行保护措施,如果data没有获取到数据,那么不进行数据解析
    if (data != nil) {
        NSDictionary *dictionary = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
        NSLog(@"%@", dictionary);
    }
}

#pragma mark POST同步请求
- (void)postSyn{
    NSLog(@"开始POST同步请求");
    //1.获取网址字符串
    NSString *urlString = @"http://ipad-bjwb.bjd.com.cn/DigitalPublication/publish/Handler/APINewsList.ashx";
    //2.创建NSURL对象
    NSURL *url = [NSURL URLWithString:urlString];
    //3.创建请求对象(可变请求对象,后面要进行请求方式设置,参数设置)
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc]initWithURL:url];
    //4.设置请求方式(注意:大写的POST)
    [request setHTTPMethod:@"POST"];
    //5.设置请求参数
        //(1)获得请求参数的字符串
    NSString *bodyStr = @"date=20131129&startRecord=5&len=5&udid=1234567890&terminalType=Iphone&cid=215";
        //(2)将请求参数字符串通过UTF8编码格式转换成NSdata类型
    NSData *bodyData = [bodyStr dataUsingEncoding:NSUTF8StringEncoding];
    [request setHTTPBody:bodyData];
    //6.创建相应对象
    NSURLResponse *response = nil;
    NSError *error = nil;
    //7.建立网路连接,获取请求数据
    NSData *data = [NSURLConnection sendSynchronousRequest:request returningResponse:&response error:&error];
    //8.根据错误信息是否为空,进行数据解析
    if (error != nil) {
    //NSLog(@"%@", error);
    }else{
        NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
        NSLog(@"%@",dic);
    }
}

#pragma mark GET异步请求
- (void)getAsyn{
    //1.获得网址字符串
//    NSString *urlString = @"http://movieapi.m.damai.cn/Movie/Show/MovieList.aspx?cityId=852&k=&page=1&source=10099&type=2&version=50101";
    NSString *urlString  = @"http://p1.pichost.me/i/40/1639665.png";
    //2.转换成NSURL对象
    NSURL *url = [NSURL URLWithString:urlString];
    //3.创建请求对象
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc]initWithURL:url];
    //4.建立网路连接,并且设置代理
    //参数说明:1.请求对象,2.代理对象
    [NSURLConnection connectionWithRequest:request delegate:self];
}

//5.开始接受响应信息
- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response{
    NSLog(@"开始接受响应信息%@",response);
    //此时初始化 asyndata
    self.asynData = [[NSMutableData alloc]init];
}

//6.接受返回数据
- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data{
    NSLog(@"接受返回数据");
    //进行数据拼接,将每次返回的数据,拼接到容器内
    [self.asynData appendData:data];
    self.aImage.image = [UIImage imageWithData:self.asynData];
}

//7.完成数据接收
- (void)connectionDidFinishLoading:(NSURLConnection *)connection{
//    NSLog(@"完成数据接收");
//    //当完成数据接收时,将完整的asynData进行数据解析
//    NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:self.asynData options:NSJSONReadingMutableContainers error:nil];
//    NSLog(@"%@",dic);
//    self.aImage.image = [UIImage imageWithData:self.asynData];
}

//网路请求错误信息提示
-(void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error{
    NSLog(@"%@",error);
}

#pragma mark POST异步请求(block)
- (void)postAsyn{
    //1.获取网址字符串
    NSString *urlString = @"http://ipad-bjwb.bjd.com.cn/DigitalPublication/publish/Handler/APINewsList.ashx";
    //2创建NSURL对象
    NSURL *url = [NSURL URLWithString:urlString];
    //3.创建请求对象
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    //4.设置请求方式
    [request setHTTPMethod:@"POST"];
    //5.设置请求参数
    NSString *dataStr = @"date=20131129&startRecord=5&len=5&udid=1234567890&terminalType=Iphone&cid=215";
    NSData *bodyData = [dataStr dataUsingEncoding:NSUTF8StringEncoding];
    [request setHTTPBody:bodyData];
    //建立异步请求连接,并且接受返回值
    //参数说明: 1.请求对象,2主线程对象,3Block(返回请求的数据和请求错误信息)
    //数据都在子线程中进行操作,UI的主线程中刷新或者显示
    [NSURLConnection sendAsynchronousRequest:request queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
        NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
        NSLog(@"%@",dic);
    }];
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
