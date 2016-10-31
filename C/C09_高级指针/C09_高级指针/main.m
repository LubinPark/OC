//
//  main.m
//  C09_高级指针
//

#import <Foundation/Foundation.h>
#define PI 3.141592653
#define URL "http://www.baidu.com"

//定义一个宏 3.141592653
//定义关键字是# define
//宏定义命名规则: 1.宏名全部大写,2或者使用k + 驼峰式命名
//宏定义: 1宏定义结束后,不以分号结束

//定义一个乘法的宏,得到2个数相乘的结果
#define kMult(A,B) A * B
#define jia2(A,B,C) A + B * C
#define jia3(A,B,C,D) A * B + C * D

//条件编译 1为一个使用第一个,0 为下面一个

#if 1
#define kUrl "www.test.com"
#else
#define kUrl "www.souhu.com"
#endif

#define STATE 1

//根据ifdef 有没有定义来判断
#ifdef STATE
#define A 12
#endif

//定义一个学生类型的结构体
typedef struct student{
    int num;
    char name[100];
    int age;
    float score;
    char sex;
}Stu;

typedef struct CPoint{
    float x;
    float y;
}point;

void printMaxAgeStudent();

int main(int argc, const char * argv[]) {

//    Student stu1 = {"张三", 22, 'm'};
//    Student stu2 = {"李四", 23, 'f'};
//    Student *p = &stu1;
//    Student *p2 = &stu2;
//    printf("stu1 = %p, p = %p\n",&stu1 , p);
    
//    printf("学生姓名:%s, 年龄:%d, 性别%c.", stu1.name, stu1.age, stu1.sex);
//    printf("\n学生姓名:%s, 年龄:%d, 性别%c.", (*p).name, (*p).age ,(*p).sex);
//    printf("\n学生姓名:%s, 年龄:%d, 性别%c.\n", p->name, p->age ,p->sex);
   
//    printf("%s %d %c", stu2.name, stu2.age, stu2.sex);
//    printf("%s %d %c", (*p2).name, (*p2).age, stu2.sex);
//    printf("%s %d %c\n", p2->name, p2->age, p2->sex);
//    printf("%s", p);
    
//    point m = {5.0,4.0};
//    point n = {4.0,5.0};
//    point *p = &m;
//    point *p2 = &n;
    
//    float w = p->y - p2->y;
//    float h = p2->x - p->x;

//    float s = sqrtf(h * h + w * w);
//    printf("两点之间的距离:%.2f\n", s);
    
    //首字母替换成大写,空格换成'_'
//    Student stu1= {1,"lan ou",'m',95.6};
//    Student *p = &stu1;

//    p->name[0] -= 32;
//    printf("%s", p->name);
    
//    int i = 0;
//    while (p->name[i] != '\0') {
//        if (p->name[i] == ' ') {
//            p->name[i] = '_';
//        }
//        i++;
//    }
//    printf("%s",p->name);
    
    
//    Stu stu1 = {1, "张三", 22, 80.5, 'm'};
//    Stu stu2 = {2, "李四", 23, 79.5, 'm'};
//    Stu stu3 = {3, "王五", 24, 85.5, 'f'};
//    Stu stu4 = {4, "赵六", 25, 86.0, 'f'};
//    Stu stu5 = {5, "小七", 26, 90.0, 'm'};
    
    //定义一个学生结构体数组
    //Stu students[5] = {stu1, stu2, stu3, stu4, stu5};
    
    //定义一个学生类型指针,指向学生数组
    //Stu *p =students;
    
    //第2个学生信息
//    p[1];
//    printf("学号:%d, 姓名:%s, 年龄:%d, 分数:%.2f\n", p[1].num, p[1].name, p[1].age, p[1].score);
//    printf("学号:%d, 姓名:%s, 年龄:%d, 分数:%.2f\n", p[5].num, p[5].name, p[5].age, p[5].score);
//    Stu temp;
//    for (int i = 0; i < 5; i ++) {
//        temp = temp.age > p[i].age ? temp : p[i];
//    }
//    printf("学号:%d, 姓名:%s, 年龄:%d, 分数:%.2f\n", temp.num, temp.name, temp.age, temp.score);
//    printMaxAgeStudent();
//    printf("%.10f\n",PI);
//    printf("%s" URL);
    printf("%d\n",kMult(10, 20));
    printf("%d\n",jia2(10,20,30));
    printf("%d\n",jia3(1, 2, 3, 4));
    printf("%s\n",kUrl);
    
#if 1
    printf("%s\n",kUrl);
#endif
    printf("%d\n", A);
    return 0;
}

void printMaxAgeStudent(){
    Stu stu1 = {1, "张三", 22, 80.5, 'm'};
    Stu stu2 = {2, "李四", 23, 79.5, 'm'};
    Stu stu3 = {3, "王五", 24, 85.5, 'f'};
    Stu stu4 = {4, "赵六", 25, 86.0, 'f'};
    Stu stu5 = {5, "小七", 26, 90.0, 'm'};
    
    //定义一个学生结构体数组
    Stu students[5] = {stu1, stu2, stu3, stu4, stu5};
    
    //定义一个学生类型指针,指向学生数组
    Stu *p =students;
    
    for (int i = 0; i < 5; i ++) {
        if (p[i].sex == 'm') {
            p[i].score += 10;
            printf("%s" ,p[i].name);
            if (p[i].score >= 100) {
                p[i].score = 100;
            }
            printf("姓名:%s,分数:%f\n" ,p[i].name,p[i].score);
        }
    }
}
