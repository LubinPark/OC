//
//  DataBaseHandle.m
//  UI19_数据库
//
//  Created by 芦彬 on 15/9/23.
//  Copyright (c) 2015年 芦彬. All rights reserved.
//

#import "DataBaseHandle.h"

@implementation DataBaseHandle

+(DataBaseHandle *)shareDataBaseHandle{
    static DataBaseHandle *dataBaseHandle = nil;
    if (dataBaseHandle == nil) {
        dataBaseHandle = [[DataBaseHandle alloc]init];
    }
    return dataBaseHandle;
}

//首先:声明一个数据库
static sqlite3 *db;

- (void)openDB{
    
    //1.找到路径document
    NSString *documentPath = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES).lastObject;
    
    NSString *databasePath = [documentPath stringByAppendingPathComponent:@"student.sqlite"];
    
    NSLog(@"%@",databasePath);
    
    //2.判断当前数据库是否打开,如果没有打开那么进行打开操作,如果已经打开,那么停止当前操作
    if (db != nil) {
        NSLog(@"数据库已经打开");
        return;
    }
    
    //打开数据库 使用sqlite3_open
    //参数1:数据库打开位置
    //参数2:数据库对象
    //返回值:返回方法执行结果(是个枚举类型,例如:SQLITE_OK 代表执行成功)
    int result =  sqlite3_open(databasePath.UTF8String, &db);
    if (result == SQLITE_OK) {
        NSLog(@"数据库打开成功");
    }else{
        NSLog(@"数据库打开失败");
    }
}

//创建一张表
- (void)createTableWithName:(NSString *)tableName{
    //创建表的qsl语句
    //创建表结构:create table if not exists 表名(字段1 类型,字段3 类型...)
    //整形integer
    //字符串text
    //主键约束:primary key (保证在数据库中的唯一,减轻冗余)
    //自增约束:autoincrement (通常在没有唯一值约束的时候,我们选择用一个自增变量控制)
    NSString *creatTableSQL = [NSString stringWithFormat:@"create table  if not exists %@(number integer primary key autoincrement,name text, hobby text)",tableName];
    
    //执行sql语句 参数:数据库对象， 参数2:sql语句
    int result = sqlite3_exec (db, creatTableSQL.UTF8String,NULL,NULL,nil);
    if(result ==SQLITE_OK){
        NSLog(@"创建成功");
    }else{
        NSLog(@"未创建成功%d",result);
    }
}

//插入一条学生信息
- (void)insertStudent:(Student *)student{
    
    //1.插入语句insert into 表名（字段名称） values （对应字段的值）
    NSString *insertSQL = [NSString stringWithFormat:@"insert into studentList(number, name, hobby)values(%ld,'%@','%@')",student.number,student.name,student.hobby];
    
    //2.执行sql语句
    int result = sqlite3_exec(db, insertSQL.UTF8String, NULL, NULL, nil);
    if (result == SQLITE_OK) {
        NSLog(@"学生信息插入成功");
    }else{
        NSLog(@"学生信息插入失败%d",result);
    }
}

//修改学生信息
- (void)updateStudent:(Student *)student{
    NSString *updateSQL = [NSString stringWithFormat:@"update studentList set hobby ='敲代码,睡觉' where name = '%@'",student.name];
    int result = sqlite3_exec(db, updateSQL.UTF8String, NULL, NULL, nil);
    if (result ==SQLITE_OK) {
        NSLog(@"学生信息修改成功");
    }
    else{
        NSLog(@"学生信息修改失败%d",result);
    }
}

//根据学号删除一个学生
- (void)deleteStudent:(NSInteger)number{
    
    //1.删除语句：delete from 表名 where 条件
    NSString *deleteSQL = [NSString stringWithFormat:@"delete from studentList where number = %ld",number];
    //2.执行删除语句
    int result = sqlite3_exec(db, deleteSQL.UTF8String, NULL, NULL, nil);
    if (result == SQLITE_OK) {
        NSLog(@"删除成功");
    }
    else{
        NSLog(@"删除失败%d",result);
    }
}

#pragma mark 查询所有学生信息
- (NSArray *)selectAllStudent{
    //1.创建查询的sql语句
    //查询所有学生 select *from 表名(where ...)
    NSString *selectSQL = @"select *from studentList";
    //2.创建数据库跟随对象
    sqlite3_stmt *stmt = nil;
    //3.执行查询语句
    //参数1.数据库对象
    //参数2:sql语句
    //参数3:查询语句的限制字符数 (－1代表无穷大)
    //参数4:数据库的跟踪对象
    //参数5:通常为nil
    int result = sqlite3_prepare_v2(db, selectSQL.UTF8String, -1, &stmt, nil);
    //4.创建一个数组用来接收查询结果
    NSMutableArray *array = [NSMutableArray array];
    if (result == SQLITE_OK) {
        NSLog(@"查询成功");
        //5.如果查询成功，对查询的结果进行取值操作
        while (sqlite3_step(stmt) == SQLITE_ROW) {
             //进入循环说明在数据库中存在一条数据
            //查询到多少条数据，走多少次循环
            NSInteger number = sqlite3_column_int64(stmt, 0);
            const unsigned char *name = sqlite3_column_text(stmt, 1);
            const unsigned char *hobby = sqlite3_column_text(stmt, 2);
            
            Student *stu = [[Student alloc]init];
            stu.number = number;
            stu.name = [NSString stringWithUTF8String:(const char *)name];
            stu.hobby = [NSString stringWithUTF8String:(const char *)hobby];
            
            [array addObject:stu];
            [stu release];
        }
    }
    else{
        NSLog(@"查询失败%d",result);
    }
    return array;
}

@end
