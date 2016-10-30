//
//  RootViewController.m
//  UI18_复杂对象的读写
//
//  Created by 芦彬 on 15/9/22.
//  Copyright (c) 2015年 芦彬. All rights reserved.
//

#import "RootViewController.h"
#import "Person.h"
@interface RootViewController ()

@end

@implementation RootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    Person *person1 = [[Person alloc]init];
    person1.name = @"张三";
    person1.hobby = @"登山包";
    person1.age = @"20";
    
    Person *person2 = [[Person alloc]init];
    person2.name = @"李四";
    person2.hobby = @"大水杯";
    person2.age = @"22";
    
    //1.创建一个文件路径
    NSString *path = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES).lastObject;
    NSString *personPath = [path stringByAppendingPathComponent:@"person.txt"];
    
    //2.将复杂对象写入文件 通过NSKeyedArchiver
    BOOL isArchiver = [NSKeyedArchiver archiveRootObject:person1 toFile:personPath];
    NSLog(@"%@,%d",personPath, isArchiver);
    
    //在归档文件内读取文件内容,进行反归档(KSKeyedUnarchiver)
    Person *person = [NSKeyedUnarchiver unarchiveObjectWithFile:personPath];
    NSLog(@"%@,%@",person.name, person.hobby);
    
#pragma mark 将复杂对象数组写入文件
    NSString *personListPath = [path stringByAppendingPathComponent:@"personList"];
    NSArray *array = [NSArray arrayWithObjects: person1, person2, nil];

    //写入(归档)
    [NSKeyedArchiver archiveRootObject:array toFile:personListPath];
    
    //读取(反归档)
    NSArray *tempArray = [NSKeyedUnarchiver unarchiveObjectWithFile:personListPath];
    NSLog(@"%@",tempArray);
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
