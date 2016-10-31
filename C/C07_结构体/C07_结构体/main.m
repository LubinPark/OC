//
//  main.m
//  C07_结构体
//

#import <Foundation/Foundation.h>

//结构体也写在这
//写一个点得结构体 point
//结构体的关键字:struct
struct point{
    //定义成员,x,y
    float x;
    float y;
};

//定义矩形 square 矩形包括:长 ,宽
struct square{
    int length;
    int witdh;
};

//定义一个日期类型的结构体,结构体类型为(MyDate)
typedef struct date{
    int year;
    int month;
    int day;
}MyDate;

typedef struct course{
    char courseName[100];
    char courseTeacher[100];
}Course;

typedef struct firend{
    char name[100];
    int age;
}Firend;


//定义一个学生 student 成员:姓名,学号,性别,年龄,成绩
typedef struct student{
    char name[100];
    char sex;
    float score;
//    int age;
//    MyDate birthday;
//    Course course;
//    Firend firend;
}Stu;

//把 student重启名叫S
//typedef struct student{
//    
//}S;

//struct{
//    char name[100];
//    int number;
//    int age;
//}

//teacher1 = {"隔壁老王", 250, 50},
//teacher2 = {"小飞)", 38, 51};

typedef struct teacher{
    char name[100];
    int number;
    int age;
}Tea;

//typedef(定义别名) : typedef 原有类型名 新的类型名;
typedef int  Integer;

int main(int argc, const char * argv[]) {
    
    //结构体的赋值,struct 结构体名 变量名 = {成员1值, 成员2值, ..., 成员n}
//   struct point p1={12.3 ,40.0};
    
    //结构体的成员的访问
//    p1.x;
//    printf("%.2f\n", p1.x);
//    printf("%.2f\n", p1.y);
    
//    struct student s1 = {"芦彬", 83, 'm', 23, 100};
//    struct student s2 = {"徐冬雨", 86, 'm', 24, 59};
//    printf("%s, %d, %c, %d, %f\n", s1.name, s1.number, s1.sex, s1.age, s1.score);
//    printf("%s, %d, %c, %d, %f\n", s2.name, s2.number, s2.sex, s2.age, s2.score);
//    printf("%s %d %d\n", teacher1.name, teacher1.number,teacher1.age);
    
//    Integer a = 10;
//    printf("%d", a);
  
//    Stu stu1 = {"张三", 30, 90.5};
//    Stu stu2 = {"李四", 40, 60.5};
//    Stu stu3 = {"王五", 25, 70.5};
//    printf("%s, %d, %f\n", stu1.name, stu1.age, stu1.score);

//    Tea tea1 = {"abc", 01, 30};
//    printf("%s, %d, %d\n", tea1.name, tea1.number, tea1.age);
    
//    Stu stu1 = {"张三", 30, 90.5};
//    Stu stu2 = {"李四", 40, 60.5};
//    Stu stu3 = {"王五", 25, 70.5};
    
//    Stu maxScoreStudent;
//    Stu minAgeStudent;

//    maxScoreStudent = stu1.score > stu2.score ? stu1: stu2;
//    maxScoreStudent = maxScoreStudent.score > stu3.score? maxScoreStudent : stu3;

//    minAgeStudent = stu1.age < stu2.age ? stu1 : stu2;
//    minAgeStudent = minAgeStudent.age < stu3.age ? minAgeStudent : stu3;

//    printf("分数最高%s 分数:%.2f 年龄: %d\n",maxScoreStudent.name,maxScoreStudent.score, maxScoreStudent.age);
//    printf("年龄最小%s 分数:%.2f 年龄: %d\n",minAgeStudent.name,minAgeStudent.score, minAgeStudent.age);

//    Stu stu3 = {"王五", 25, 70.5,{1992, 3,28},{"English", "野哥"},{"张三",20}};
//    printf("%s的生日是:%d-%d-%d\n",stu3.name, stu3.birthday.year, stu3.birthday.month, stu3.birthday.day);
//    printf("课程:%s,名字:%s\n",stu3.course.courseName, stu3.course.courseTeacher);
//    printf("朋友:%s 年龄:%d\n",stu3.firend.name ,stu3.firend.age);

//    strcmp(students[0].name, "国民小舅子");
    Stu stu1 = {"张三", 'm', 80.9};
    Stu stu2 = {"李四", 'f', 90.0};
    Stu stu3 = {"王五", 'm', 67.0};
    Stu stu4 = {"赵六", 'm', 88.0};
    Stu stu5 = {"田七", 'm', 60.0};
    
    Stu class[5] = {stu1, stu2, stu3, stu4, stu5};
    int i = 0;
    Stu maxScore;
    for ( i = 0; i < 5; i++) {
        maxScore = maxScore.score > class[i].score ? maxScore : class[i];
    }
    
    printf("%s 的成绩最高: %.2f\n",maxScore.name,maxScore.score);
    
    //将学生按照成绩从高到低排序
    for (int i = 0; i < 5; i++) {
        for (int j = 0; j < 5 - i - 1; j++) {
            if (class[j].score < class[j + 1].score) {
                //根据学生成绩,交换学生位置
                Stu temp = class[j];
                class[j] = class[j + 1];
                class[j + 1] = temp;
            }
        }
    }
    for (int i = 0; i < 5; i++) {
        printf("%s 成绩为:%.2f 性别: %c\n",class[i].name, class[i].score, class[i].sex);
    }

    return 0;
    
}
