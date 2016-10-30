//
//  RootViewController.m
//  UI18_NSFileManager
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
    
    //文件管理器NSFileManager
    //1.找到caches 在沙盒中的路径
    NSArray *cachesPath = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES);
    NSString * caches = cachesPath.lastObject;
    NSLog(@"%@",caches);
    
    //2.创建一个文件管理器(一个应用程序只有一个文件管理器)
    NSFileManager *manager = [NSFileManager defaultManager];
    
#pragma 重要
    //3.创建一个文件夹
    //(1).拼接一个绝对路径
    NSString *downloadImage = [caches stringByAppendingPathComponent:@"download"];
    NSError *error = nil;
    //(2)通过
    BOOL isSuccess = [manager createDirectoryAtPath:downloadImage withIntermediateDirectories:YES attributes:nil error:&error];
    NSLog(@"%d, %@",isSuccess,error);

    
#pragma  mark 新建一个文件,写入download文件夹内
    NSString *newFilePath = [downloadImage stringByAppendingPathComponent:@"newFile"];
    NSString *str = @"港囧25号上映";
    [str writeToFile:newFilePath atomically:YES encoding:NSUTF8StringEncoding error:nil];
    
#pragma mark 文件夹移动
#pragma waring 注意:首先应该创建目标路径(目标路径最后应该拼接当前的文件夹名称)
    NSString *documentPath = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES).lastObject;
    
    //拼接移动到的绝对路径
    NSString *doccumentNewNewGroup = [documentPath stringByAppendingPathComponent:@"download"];
    
    //atPath:要移动的文件路径 toPath:目的地
   BOOL isTrue = [manager moveItemAtPath:downloadImage toPath:documentPath error:nil];
    NSLog(@"%d",isTrue);
    
#pragma mark 文件的拷贝 (文件夹内部的文件也会被拷贝)
   BOOL iscopy = [manager copyItemAtPath:doccumentNewNewGroup toPath:downloadImage error:nil];
    NSLog(@"%d",iscopy);
    
#pragma mark 删除文件 ;(包括文件夹内的文件)
    
//    NSString *home = NSHomeDirectory();
    BOOL isRemove = [manager removeItemAtPath:downloadImage error:nil];
    NSLog(@ "%d",isRemove);
    
#pragma mark 判断某个文件是否存在
   BOOL isExists = [manager fileExistsAtPath:doccumentNewNewGroup];
    if (isExists) {
        NSLog(@"该文件存在");
    }else{
        NSLog(@"不存在");
    }
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
