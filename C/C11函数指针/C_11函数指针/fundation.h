//
//  fundation.h
//  C_11函数指针
//
//  Created by dllo on 15/8/11.
//  Copyright (c) 2015年 蓝鸥科技. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef struct student{
    char name[20];
    int age;
    int number;
    int score;
}Student;

//拼接分数大于90分得学生姓名
void catGFS(Student * stu);

//找到分数大于90的学生
void searchStudents(Student *students, int count, void(*p)(Student *));

//打印一个学生信息
void printStudent(Student * stu);

//学生按一定条件进行排序
//void bubbleSortWithStudents(Student *students, int count, BOOL(*p)(Student *, Student *));

//学生按照姓名排序
BOOL byName(Student *stu1, Student *stu2);

//学生按照年纪排序
BOOL byAge(Student *stu1, Student *stu2);

//学生按照学号排序
BOOL byNumber(Student *stu1, Student *stu2);

//学生按照分数排序
BOOL byScore(Student *stu1, Student *stu2);

typedef BOOL (*PFun)(Student *,Student *);

//学生按一定条件进行排序
void bubbleSortWithStudents(Student *students, int count,PFun p);

PFun getFunctionByName(char *name);






