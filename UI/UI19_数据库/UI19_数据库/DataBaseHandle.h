//
//  DataBaseHandle.h
//  UI19_数据库
//
//  Created by 芦彬 on 15/9/23.
//  Copyright (c) 2015年 芦彬. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Student.h"

#import <sqlite3.h>
#warning 注意:使用数据库首先要引人libsqllite3.0框架, 然后引人sqlite3的头文件;

@interface DataBaseHandle : NSObject

#pragma markDataBaseHandle单例方法

+ (DataBaseHandle *)shareDataBaseHandle;

//打开数据库
- (void)openDB;

//创建表
//tableName:代表 表名
- (void)createTableWithName:(NSString *)tableName;

//插入一个学生信息
- (void)insertStudent:(Student *)student;

//修改一个学生信息
- (void)updateStudent:(Student *)student;

//删除一个学生的信息(根据学号)
- (void)deleteStudent:(NSInteger)number;

//查询所有学生信息
- (NSArray *)selectAllStudent;



@end
