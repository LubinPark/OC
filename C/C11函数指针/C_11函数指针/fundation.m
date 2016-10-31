//
//  fundation.m
//  C_11函数指针
//
//  Created by dllo on 15/8/11.
//  Copyright (c) 2015年 蓝鸥科技. All rights reserved.
//

#import "fundation.h"
void catGFS(Student * stu){
    strcat(stu->name, "高富帅");
}

void searchStudents(Student *students, int count, void(*p)(Student *)){
    for (int i = 0; i < count; i++) {
        //判断学生分数是不是大于90
        if ((students + i)->score> 90) {
            p(students + i);
        }
    }
}

void printStudent(Student * stu){
    printf("姓名:%s, 年龄:%d, 学号:%d , 分数:%d\n", stu->name, stu->age, stu->number, stu->score);
}

//学生按一定条件进行排序
void bubbleSortWithStudents(Student *students, int count, BOOL(*p)(Student *,Student *)){
    for (int i  = 0; i < count - 1; i++) {
        for ( int j = 0; j < count  - i - 1; j++) {
            //按需求进行,交换
            if(p(students + j,students + j + 1)){
                Student temp = students[j];
                students[j] = students[j + 1];
                students[j + 1] = temp;
            }
        }
    }
}

//学生按照姓名排序
BOOL byName(Student *stu1, Student *stu2){
    return strcmp(stu1->name, stu2->name) > 0;
}

//学生按照年纪排序
BOOL byAge(Student *stu1, Student *stu2){
    return stu1->age > stu2->age;
}

//学生按照学号排序
BOOL byNumber(Student *stu1, Student *stu2){
    return stu1->number > stu2->number;
}

//学生按分数排序
BOOL byScore(Student *stu1, Student *stu2){
    return stu1->score > stu2->score;
}

//根据键盘输入的排序条件,返回对应的判断函数首地址
PFun getFunctionByName(char *str){
    if(strcmp(str, "name") == 0 ){
        return byName;
    }else if(strcmp(str, "age") == 0 ){
        return byAge;
    }else if (strcmp(str, "number") == 0 ){
        return byNumber;
    }else{
        return byScore;
    }
    
}


