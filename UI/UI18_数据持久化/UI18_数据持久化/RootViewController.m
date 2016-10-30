//
//  RootViewController.m
//  UI18_数据持久化
//
//  Created by 芦彬 on 15/9/22.
//  Copyright (c) 2015年 芦彬. All rights reserved.
//

#import "RootViewController.h"

@interface RootViewController ()

@end

@implementation RootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //沙盒机制：是ios中特有的文件限制管理机制，每个应用程序中都是自己的沙盒（文件夹）,而且不可访问应用饮用程序的沙盒
    //NSString *firstSandBox = NSHomeDirectory();
    //NSLog(@"%@",firstSandBox);
    
    /*沙盒结构
     documents:用户信息，如果需要同步到itunes 或者iCloud时,可以存在该文件夹
     Library : Caches :缓存文件
               Prefercence:应用的配置相关文件
     tmp :临时文件夹 特点:系统会定期清理
    */
    
    //NSSearchPathForDirectoriesInDomains 参数说明
    //1.指定的文件夹(NSDocumentsDirectory,NSLirarDirectory)
    //2.NSUserDominMask 用户目录的主路径
    //3.BOOL类型:用来指定将要查找的时绝对路径还是相对路径
    
    //document 文件夹路径
    NSArray *array = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSLog(@"%@",array);
    NSString *documentPath = [array lastObject];
    NSLog(@"%@",documentPath);
    
    //字符串的读写
    /*
    //library 文件夹路径
    //NSArray *array1 = NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, NSUserDomainMask, YES);
    //NSLog(@"%@",array1);
    //NSString *libraryPath = [array1 lastObject];
    //NSLog(@"%@",libraryPath);
    
    //1.在指定的文件夹内创建文件
    //第一种.需要在文件名前面加'/'
    NSString *documentFirst = [documentPath stringByAppendingString:@"/First.txt"];
    //第二种.不需要在文件夹前面加'/',直接写文件名
    NSString *documentSecond = [documentPath stringByAppendingPathComponent:@"Lubin.html"];
    
    
    NSString *string = @"第一次往文件里写字符串";
    //将字符串写入相应的路径下
    //参数说明:写入路径,是否自动;编码方式;错误信息;
    [string writeToFile:documentSecond atomically:YES encoding:NSUTF8StringEncoding error:nil];
    NSString  *string1 = [NSString stringWithContentsOfFile:documentSecond encoding:NSUTF8StringEncoding error:nil];
    NSLog(@"%@",string1);
    */
    
    //数组的读写
    NSString *arrayPath = [documentPath stringByAppendingPathComponent:@"list.plist"];
    NSArray *studentList = @[@"张三", @"李四", @"王五"];
    
    //将数组写入指定的路径下
    [studentList writeToFile:arrayPath atomically:YES];
    
    NSLog(@"%@",arrayPath);
    NSArray *list = [NSArray arrayWithContentsOfFile:arrayPath];
    NSLog(@"%@",list);
    
    NSDictionary *dic = @{@"name":@"张三",@"age":@"24",@"sex":@"男"};
    [dic writeToFile:arrayPath atomically:YES];
    
    //在指定的路径下读取数组
    NSDictionary *dicList = [NSDictionary dictionaryWithContentsOfFile:@"list.plist"];
    NSLog(@"%@",dicList);
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
