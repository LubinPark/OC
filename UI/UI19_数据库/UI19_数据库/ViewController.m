//
//  ViewController.m
//  UI19_数据库
//
//  Created by 芦彬 on 15/9/23.
//  Copyright (c) 2015年 芦彬. All rights reserved.
//

#import "ViewController.h"
#import "DataBaseHandle.h"

#import "Student.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];    
    //Student *stu1 = [Student studentWithNumber:1 andName:@"zhangsan" andHobby:@"水晶鞋"];
    //Student *stu2 = [Student studentWithNumber:2 andName:@"lisi" andHobby:@"大水杯"];
}
- (IBAction)openDataBase:(id)sender {
    [[DataBaseHandle shareDataBaseHandle]openDB];
}

- (IBAction)createTable:(id)sender {
    [[DataBaseHandle shareDataBaseHandle]createTableWithName:@"studentList"];
}

- (IBAction)InsertStudent:(id)sender {
    //Student *stu1 = [Student studentWithNumber:4 andName:@"王五" andHobby:@"水晶鞋"];
    Student *stu2 = [Student studentWithNumber:3 andName:@"lisi" andHobby:@"大水杯"];
    [[DataBaseHandle shareDataBaseHandle]insertStudent:stu2];
}

- (IBAction)UpdateStudent:(id)sender {
    Student *stu1 = [Student studentWithNumber:1 andName:@"zhangsan" andHobby:@"水晶鞋"];
    [[DataBaseHandle shareDataBaseHandle]updateStudent:stu1];
    
}

- (IBAction)deleteStudent:(id)sender {
    [[DataBaseHandle shareDataBaseHandle]deleteStudent:1];
}

- (IBAction)SelectSutdent:(id)sender {
    NSArray *array = [[DataBaseHandle shareDataBaseHandle]selectAllStudent];
    
    for (Student *stu in array) {
        NSLog(@"%ld, %@, %@",stu.number, stu.name, stu.hobby);
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
