//
//  main.m
//  C_11函数指针
//

#import <Foundation/Foundation.h>
#import "fundation.h"
int maxValues(int a ,int b){
    return a > b ? a : b;
}

void maxNumber(int a ,int b){
    int max = a > b ? a : b;
    printf("%d\n",max);
}

void printHello(){
    printf("Hello\n");
}

int sum(int a, int b){
    int s = a + b;
    return  s;
}

int maxValue(int a , int b){
    int max = a > b ? a : b;
    return max;
}

int getValue(int a , int b ,int (*p)(int, int)){
    return p (a, b);
}

int main(int argc, const char * argv[]) {
  
//    printf("%p\n", maxValue);
    
    //定义一个maxValues类型的函数指针
    //一个函数的名字,即为该函数的首地址
    
    //定义函数指针格式:
    //返回值类型: (* 变量名)(形参类型[形参名]...)
    
//    int (*p)(int, int) = NULL;
//    p = maxValues;
//    int value = p(10, 12);
//    printf("%d\n",value);
    
//    void (*q)(int, int) = NULL;
//    q = maxNumber;
//    q(20, 100);
    
//    void(*p)() = NULL;
//    p = printHello;
//    p();
    
//    char string[10];
//    scanf("%s",string);
//    int (*p)(int, int) =NULL;
//    int value;
//    if (strcmp(string, "maxValue") == 0) {
//        p = maxValue;
//        value = p(5,6);
//        printf("%d",value);
//    } else {
//        p = sum;
//        value =p(4, 7);
//        printf("%d",value);
//    }
    
//    int (*p)(int, int)= NULL;
//    p = maxValue;
//    int value = getValue(3, 5, sum);
//    printf("%d", value);
    
//    Student stu1 = {"gou🐶",22,101,95};
//    Student stu2 = {"mao🐱",25,103,80};
//    Student stu3 = {"zhu🐷",27,102,69};
//    Student stu4 = {"xiang🐘",30,102,85};
//    Student stu5 = {"ji🐔",21,102,92};
//    Student students[5] = {stu1, stu2, stu3, stu4, stu5};
    
//    int count = sizeof(students) / sizeof(students[0]);
//    searchStudents(students, count, catGFS);
    
    /*
    //按照学生姓名排序学生
    printf("按照学生姓名排序学生:\n");
    bubbleSortWithStudents(students, count, byName);
    for (int i = 0; i < count; i++) {
        printStudent(&students[i]);
    }
    printf("\n");
    
    printf("按照学生年纪排序学生:\n");
    //按照学生年纪排序学生
     bubbleSortWithStudents(students, count, byAge);
    for (int i = 0; i < count; i++) {
        printStudent(&students[i]);
    }
    printf("\n");
    
    printf("按照学生年纪排序学生:\n");
    //按照学生年纪排序学生
     bubbleSortWithStudents(students, count, byNumber);
    for (int i = 0; i < count; i++) {
        printStudent(&students[i]);
    }
    printf("\n");
    
    //按照学生年纪排序学生
    printf("按照学生年纪排序学生:\n");
     bubbleSortWithStudents(students, count, byScore);
    
    for (int i = 0; i < count; i++) {
        printStudent(&students[i]);
    }
    printf("\n");
     
    */
    printf("%4.1f",1.2345);
    
//    char str[20] = {0};
//    scanf("%s",str);
    
//    PFun p = getFunctionByName(str);
//    bubbleSortWithStudents(students, count, p);

//    for (int i = 0 ; i < count; i++) {
//        printStudent(&students[i]);
//    }
    
    return 0;
}
