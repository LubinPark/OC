//
//  RootViewController.m
//  UI17_AFNetworking二次封装
//
//  Created by 芦彬 on 15/9/21.
//  Copyright (c) 2015年 芦彬. All rights reserved.
//

#import "RootViewController.h"

//使用AFNetworking需要导入头文件
#import "AFNetworking.h"
#import "CustomerNetworking.h"

#import "CustomerTableViewCell.h"

@interface RootViewController ()<UITableViewDelegate,UITableViewDataSource>

@property(nonatomic, retain)NSDictionary *dic;

@property (nonatomic,retain)NSArray *array;

@end

@implementation RootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableViews = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height) style:UITableViewStyleGrouped];
    [self.view addSubview:self.tableViews];
    self.tableViews.delegate = self;
    self.tableViews.dataSource = self;
    
//- 号方法
//    CustomerNetworking *customer = [[CustomerNetworking alloc]init];
//    [customer connectWithURL:@"http://mapi.yinyuetai.com/search/video.json?D-A=0&keyword=T-ARA" andBlock:^(id response) {
//        NSDictionary *dic = response;
//        NSLog(@"%@",dic);
//    }];
    
//+号方法
//    [CustomerNetworking customerConnectWithURL:@"http://mapi.yinyuetai.com/search/video.json?D-A=0&keyword=T-ARA andBlock:^(id response) {
//        NSDictionary *dic = response;
//        NSLog(@"%@",dic);
//    }];
    
//get or post 改进
    [CustomerNetworking customerConnectWithURL:@"http://mapiv2.yinyuetai.com/component/prefecture.json?type=1" andParameters:nil andBlock:^(id response){
        self.dic = response;
        self.array = [self.dic objectForKey:@"data"];
        [self.tableViews reloadData];
        NSLog(@"%@",self.dic);
    }];
}

//开始网络请求
/*
- (void)startConnection:(NSString *)urlString{
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json",@"text/json", @"text/plain", @"text/html", nil];
    manager.securityPolicy.allowInvalidCertificates = YES;
    
    //方法参数说明:关键(GET/POST)
    //第一个参数:连接地址(NSString)
    //第二个参数:连接参数(GET请求中为nil/POST中请求为NSDictionary(参数标识:参数值))
    [manager GET:urlString parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        //请求成功
        NSDictionary *dic = responseObject;
        self.array = [self.dic objectForKey:@"events"];
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"%@", error);
    }];
}
*/

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.array.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    CustomerTableViewCell *customerCell = [CustomerTableViewCell customerTableViewCellWithTable:tableView];
    NSDictionary *dic = [self.array objectAtIndex:indexPath.row];
    
    Customer *customer = [Customer customerWithDictionary:dic];
    customerCell.customer = customer;
    return customerCell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 150;
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
