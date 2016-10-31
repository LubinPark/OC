//
//  main.m
//  C01_基本数据类型与表达式
//  Created by lubin on 15/7/28

/* 
 Xcode常用的快捷键
 commond + r 运行
 commond + / 注释，撤销注释
 commond + shift + y 下面控制台显示和隐藏
 commond + 0 左侧文件栏显示和隐藏
 commond + alt + 0 右侧属性栏显示和隐藏
 commond + ，偏好设置
 */

//引入Foundation 框架
#import <Foundation/Foundation.h>
//main函数是唯一的
//main是程序的入口，也是程序的出口
int main(int argc, const char * argv[]) {
    
    //整型：int（长整形long 短整型short） 6，0，-7
    //浮点型：float（float 6位 单精度 double  8位 双精度） 0.7 -3.1
    //字符型：char   'a' ‘5’
    
    /*
     定义一个变量的规则：
     1.变量可以由字母，下划线，字母组成，但是不能由数字开始
     2.不能和系统关键字重名
     3.不能重复相同的定义变量名
     4.驼峰式命名法（建议命名）studentNameNumber
     5.起变量名的时候见名知意
     */
    
    // 打印时：%d 代表打印的变量是整型变量
    //        %f 代表打印的变量是浮点型变量
    //        %c 代表打印的变量是字符型变量
    //定义整型
    
    /*
    int studentAge = 23;
    printf("学生年龄：%d 岁\n",studentAge);
    
    int studentId = 83;
    printf("学生学号：%d\n",studentId);
    
    int studentNumber = 46;
    printf("学生人数：%d 人\n",studentNumber);
   
    //浮点型
    float studentHeight = 1.7;
    printf("学生身高：%0.3f 米\n",studentHeight);
    
    double agvHeight = 1.8;
    printf("学生平均身高：%f 米\n",agvHeight);
    
    float studentWeight = 110.1;
    printf("学生体重：%0.4f 斤\n",studentWeight);//详见95,96行
    
    //定义字符型变量
    char sex = 'm';
    printf("性别：%c\n",sex);
    
    char firstLitter = 'L';
    printf("第一个字母：%c\n",firstLitter);
    
    char lastLitter = 'n';
    printf("最后一个字母：%c\n",lastLitter);
    
    //定义2个整型变量，交换2个变量的值
    
    int num1 = 10;
    int num2 = 5;
    int temp = 0;
    printf("交换前\n");
    printf("%02d, %d",num1,num2);
    
    temp=num1;
    num1=num2;
    num2=temp;
    
    //输出函数
    printf("交换后\n");
    printf("%05d , %2d\n",num1,num2);//%后‘0’是代表补0，第二个是个数
    printf("%5d , %2d\n",num1,num2); //如果不写‘0’，直接数字是代表空格
    */
    //基本算数运算符 + ，-， *， /，%，++，--，
    
    /*加法
    int a=12, b=4;
    int sum=0;
    sum = a + b;
    printf("%d\n",sum);
    
    // int sub = a / b;
    // printf("%d",sub);
    
    float c = 3.0;
    float s = c / a;
    printf("%f\n",sub);
    */
    
    /*
    //余数
    int a = 13;
    int b = 4;
    int yushu= a % b;
    printf("%d\n",yushu);
    */
    
    //自增 ，自减
    int a = 10;
    // a++; //相当于a=a+1
    //printf("%d\n",++a);
    //printf("%d" ,a);
    
    
    //2个变量	互换值
    int num1=10;
    int num2=4;
    
    num1=num1-num2; // 6=10-4
    num2=num1+num2; // 10=6+4
    num1=num2-num1;   // 4=10-6
    printf("%d,%d\n" ,num1,num2);
    
    // 输出函数
    printf("输入\n");
    scanf("%d", &a);
    printf("a=%d",a);
    
    //主函数是返回状态
    return 0;
}
