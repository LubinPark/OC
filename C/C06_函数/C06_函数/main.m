//
//  main.m
//  C06_函数
//

#import <Foundation/Foundation.h>
//引入自定义文件.h文件
#import "Fundation.h"

//函数声明 (函数原型: 函数定义,没有函数整体的部分,以分号结束)
//int middleOfThreeNumber(int first,int sencond,int third);

//函数写在这里(引用系统框架下面,主函数上面)
//定义第一个函数 (Hello, Kitty)
//无参数,无返回值得函数
//void sayHello(void){
//    printf("Hello, kitty\n");
//}

//无参无返回值
//void sayBye(){
//    printf("BYE BYE");
//}

//有参,有返回值
//void sum(int a){
//    printf("%d\n", a);
//    
//}

//传入两个整型数,求和并打印
//void add(int a, int b){
//    int sum = 0;
//    sum = a + b;
//    printf("a = %d, b = %d add = %d \n", a , b, sum);
//}

//比较2个数大小
//void cmp(int a, int b){
//    if (a > b) {
//        printf("a = %d b = %d 大的为:%d\n", a, b, a);
//    }else {
//        printf("a = %d b = %d 小的为:%d\n", a, b, b);
//    }
//}

//无参有返回值
//int returnNumber(){
//    return 10;
//}

//有参数,有返回值
//int abSum(int a ,int b){
//    int sum = a + b;
//    printf("%d + %d = %d\n", a, b, a + b);
//    return sum;
//}

//int abSub(int a ,int b){
//    int sub = a + b;
//    printf("%d - %d = %d\n", a, b, a - b);
//    return sub;
//}

//int abCheng(int a ,int b){
//    int cheng = a * b;
//    printf("%d * %d = %d\n", a, b, a * b);
//    return cheng;
//}

//int abChu(int a ,int b){
//    int chu = a / b;
//    printf("%d / %d = %d\n", a, b, a / b);
//    return chu;
//}

//int abMax(int a ,int b){
//    int max = a > b ? a : b;
//    printf("max = %d\n",max);
//    return max;
//}

//int abMin(int a ,int b){
//    int min = a < b ? a : b;
//    printf("min = %d\n",min);
//    return min;
//}

void exchange(int a , int b){
    printf("初始 a = %d, b = %d\n", a, b);
    int temp = a;
    a = b;
    b = temp;
    printf("交换 a = %d, b = %d\n", a, b);
}

//int sumValue(int n){
//    int sum =0;
//    for (int i = 0; i <= n; i++) {
//        sum += i;
//    }
//    printf("sum = %d",sum);
//    return sum;
//}

//输入日期,显示这是今年的第几天
//int dayOfYear (int year,int month,int day){
//    int totalDay = 0;
//    
//    BOOL r = (year % 400 == 0) || (year % 4 == 0 && year % 100 !=0);
//    int dayOfMonth [12] = {31,28+r,31,30,31,30,31,31,30,31,30,31};
//    
//    for (int i = 0; i < month - 1; i++) {
//        totalDay += dayOfMonth[i];
//    }
//    totalDay += day;
//        return totalDay;
//}


//数组作为函数参数时,一定要指明长度
//void bubbleSort(int array[],int length){
    //冒泡排序
//    for (int i = 0; i < length - 1; i++) {
//        for (int j = 0; j < length - i - 1; j++) {
//            if (array[j] > array[j + 1]) {
//                int temp = array[j];
//                array[j] = array[j + 1];
//                array[j + 1]= temp;
//            }
//        }
//    }
//    for (int i = 0; i < length; i++) {
//        printf("%d ",array[i]);
//    }
//}

int returnMax(int a, int b){
    return a > b ? a : b;
}

int num(int n){
    if (n == 1) {
        return 1;
    }
    return  n * num(n - 1);
}

//main函数唯一 ,main 函数是应用程序的入口也是出口
int main(int argc, const char * argv[]) {
    
    int n = 4;
    printf("%d的阶乘 %d", n, num(n));
    
    /*常用的函数
     printf() 在控制台输出
     scanf() 输入函数
     strlen() 计算字符串长度
     strcpy() 拷贝函数
     strcmp() 比较函数
     strcat() 拼接函数
     sizeof() 计算字节
     arc4random() 随机数
    */
    
    //函数调用:函数名()
//    sayHello();
//    sayBye();
//    sum(10);
//    add(4, 3);
//    cmp(5, 4);
//    printf("%d" ,returnNumber());
//    abSum(10, 5);
//    abSub(14, 3);
//    abCheng(4, 7);
//    abChu(10, 5);
//    abMax(10, 6);
//    abMin(2, 7);
//    sumValue(10);
//    printf("当前年的第%d天\n",dayOfYear(2015,8,4));
    
//    middeOfThreeNumber(4, 7, 3);
//    result(5, 7);
    
//    int first = 10;
//    int sencond = 20;
//    exchange(first, sencond);
//    printf("主函数first = %d, sencond = %d\n", first , sencond);
    
//    int a[10] = {0};
//    int length = sizeof(a) / sizeof(a[0]);
//    for (int i = 0 ; i < length; i++) {
//        a[i] = arc4random() % 101;
//    }
//    bubbleSort(a, length);
    
//    printf("(4, 19, 7,123)三个是数最大: %d",
//    returnMax(123, returnMax(7,returnMax(4, 19))));
    
    return 0;
}

void middeOfThreeNumber(int first, int second, int third){
    int max = 0;
    int min = 10000;
    int sum = 0;
    max = first > second ? first : second;
    max = max > third ? max : third;

    min = first < second ? first : second;
    min = min < third ? min :third;
    sum = first + second + third;

    printf("%d", sum - max -min);
}
