//
//  main.m
//  C02_运算符
//

#import <Foundation/Foundation.h>

//枚举类型 一组有符号名称的整型常量 ,如果没有给枚举类型赋值,那么默认值为0,以后依次递增
//单独赋值,只改变当前以后的,之前的不变
enum {
    spring,  //spring = 0;默认为0, 可以更改 spring = 2,则summer =3.递增
    summer,
    autumn,
    winter
};

int main(int argc, const char * argv[]) {
    
    //BOOL类型：非0即为真
    //关系运算符 >, <, >=, <=, ==, !=
    
    /*
    BOOL isSelected = 2;
    BOOL isTrue = 2;
    BOOL isWrong = 2>=3;
    BOOL isBig = 6 >= 4;
    BOOL isSmall = 5 <= 9;
    BOOL isSame = 6 != 6;
    
    printf("isSelected %d\n",isSelected);
    printf("isTrue %d\n",isTrue);
    printf("isWrong %d\n",isWrong);
    printf("isBig %d\n",isBig);
    printf("isSmall %d\n",isSmall);
    printf("isSame %d\n",isSame);
    

    //逻辑运算符:&&(与), ||(或), !(非)
    //逻辑运算符:一假即假
    
    //与运算符前后都为真，结果为真
    BOOL isYu11 = 3 > 2 && 4 > 1;
    //与运算符前后有一个为假，结果为假
    BOOL isYu10 = 3 > 2 && 4 < 1;
    BOOL isYu01 = 3 < 2 && 4 > 1;
    BOOL isYu00 = 3 < 2 && 4 < 1;
    
    printf("--与--\n");
    printf("%d\n", isYu11);
    printf("%d\n", isYu10);
    printf("%d\n", isYu01);
    printf("%d\n", isYu00);
    printf("--与--\n");
    
    //逻辑与短路问题
     
    int a = 2;
    BOOL isYuTrue = 4 > 5 && a++;
    printf("isYuTrue = %d, a = %d 与 短路\n",isYuTrue,a);
    
    //逻辑或运算
    //逻辑或运算：一真即为真
    
    printf("--或--\n");
    BOOL isHuo11 = 3 < 5 || 2 < 5;
    printf("%d\n",isHuo11);
    
    BOOL isHuo10 = 3 < 5 || 2 > 5;
    printf("%d\n",isHuo10);
    
    BOOL isHuo01 = 3 > 5 || 2 < 5;
    printf("%d\n",isHuo01);
    
    BOOL isHuo00 = 3 > 5 || 2 > 5;
    printf("%d\n",isHuo00);
    printf("--或--\n");
    
    //逻辑或的短路问题
    
    int b = 10;
    BOOL isHuoTrue = 2 > 1 || b++;
    printf("isHuoTrue=%d,b=%d 或 短路\n", isHuoTrue, b);
    
    //逻辑非：表达式结果取反
    //逻辑运算符的优先级没有关系运算符的优先级高
    BOOL isFeiTrue = ! (2 > 3);  //2 > 3 为假 0 ，!0则为1
    printf("%d \n",isFeiTrue);
    
    //if分支结构的3种形式
    //if标准的形式 if(条件){语法快}
    printf("++++++++++++++\n");
    if (NO) {
        printf("满足if分支条件\n");
    }
    
    if(YES)
        printf("满足if分支条件\n");
    char sex1 = 'm';
    if (sex1 == 'm'){
        printf("男的\n");
    }
    
    char sex2 = 'n';
    if (sex2 == 'n'){
        printf("女的\n");
    }
    
    //if 第一种形式
    int num = 0;
    printf("输入");
    scanf("%d", &num);
    if (num % 7 == 0 || num % 10 == 7 || num / 10 == 7) {
        printf("喝酒");
    }
    
    //if第二种形式
    
    char sex = 'm';
    if (sex == 'm') {
        printf("男的");
    } else {
        printf("女的");
    }
    
    int num = 0;
    printf("输入");
    scanf("%d", &num);
    if (num % 7 == 0 || num % 10 == 0 ||num / 10 == 0) {
        printf("喝酒");
    } else {
        printf("不喝酒");
    }

    int t, g, s, b = 0;
    int num = 0;
    scanf("%d",&num);
    b = num / 100;
    s = num % 100 / 10;
    g = num % 10;
    if (num == b*b*b + s*s*s + g*g*g) {
        printf("是水仙花数");
    }else{
        printf("不是水仙花数");
    }
    
    //if的第三种形式
    char sex = 'm';
    if (sex == 'm') {
        printf("male");
    } else  if(sex == 'f'){
        printf("famale");
    else {
        printf("不确定");
    }
     */
    
    /*
    char s, m, a, w=0;
    char c;
    printf("输入 s, m, a, w (春夏秋冬):");
    scanf("%c",&c);
    if (c == 's') {
        printf("春");
    }else if (c =='m'){
        printf("夏");
    }else if (c == 'a'){
        printf("秋");
    }else if (c == 'w'){
        printf("冬");
    }else
        printf("错误");
    */
    
    //练习2
    /*
    int time = 0;
    printf("请输入年份:\n");
    scanf("%d",&time);
    if (time % 400 == 0 || time % 4 == 0) {
        if (time % 100 != 0) {
        printf("闰年\n");
        } else {
            printf("不是闰年\n");
        }
    } else
        printf("不是闰年\n");
    */
    
    //练习3
     /*
    char letter=' ';
    printf("输入字符：\n");
    scanf("%c",&letter);
    if (letter >= '0' && letter <= '9')
            printf("this is digital letter\n");
        else if (letter >= 'A' && letter <= 'Z')
            printf("this is capital letter\n");
        else if (letter >= 'a' && letter <= 'z')
            printf("this is letter\n");
        else
            printf("other\n");
    */
    
    //练习4
     /*
    int num = 0;
    printf("输入数字（1-4）：\n");
    scanf("%d", &num);
    switch (num) {
        case 1:
            printf("春天");break;
        case 2:
            printf("夏天");break;
        case 3:
            printf("秋天");break;
        case 4:
            printf("冬天");break;
        default:
            printf("输入错误！");
    }
    
    
    //三目运算符 表达式 ? 表达式1 : 表达式2;
    
    int a = 10;
    int b = 5;
    int c = 12;
    int max = a > b ? a : b;
    max = max > c ? max : c;
    printf("最大值:%d",max);
    */
    
    //第二种分支语句switch case
    
    //打印一年中每个月多少天
    /*
    int month = 1;
    printf("输入月份:\n");
    scanf("%d",&month);
    switch (month){
        case 1:
        case 3:
        case 5:
        case 7:
        case 8:
        case 10:
        case 12:
            printf("本月31天");
            break;
        case 4:
        case 6:
        case 9:
        case 11:
            printf("本月30天");
            break;
        default:
            printf("本月28天");
    }
   
    int season= 0;
    printf("输入1-4:\n");
    scanf("%d", &season);
    switch (season){
        case 1:printf("春");break;
        case 2:printf("夏");break;
        case 3:printf("秋");break;
        case 4:printf("冬");break;
        default:printf("error");
    }
     */
     //枚举显示
     int season= 0;
     printf("输入1-4:\n");
     scanf("%d", &season);
     switch (season){
     case spring:printf("春\n");break;
     case summer:printf("夏\n");break;
     case autumn:printf("秋\n");break;
     case winter:printf("冬\n");break;
     default: break;
     }
    
    //枚举打印 例子如下:
    printf("%d",summer);
    
    return 0;
}
