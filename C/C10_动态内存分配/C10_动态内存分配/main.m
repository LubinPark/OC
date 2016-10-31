//
//  main.m
//  C10_动态内存分配
//

#import <Foundation/Foundation.h>

char *returnString(){
    char *str = "iphone";
    return str;
}

//定义一个静态变量
static int a = 10;
void changeAvalue(){
    a = 12;
}

//定义学生结构体
typedef struct student{
    char name[20];
    int age;
    float score;
}Student;

int main(int argc, const char * argv[]) {

    /*
    计算内存存储区主要成分:栈区,堆区,静态区,常量区,代码区
    
    栈区:主要是基于计算机底层分配原则,主要存储常量,函数调用等.有内存的自动回收机制
     优点:效率高
     缺点:内存小,使用不灵活
     
    堆区:主要存储的是手动分配的内存.堆区在32位系统下,可以存储4G内存大小
     优点:使用灵活,空间大
     缺点:操作复杂,容易产生内存碎片
    
    静态区:一般存储静态变量(static),全局变量
     特点:初始化一次,在程序运行期间不会注销,永远存在0.
     
    常量区:常量或字符串
     
    代码区: 程序编译后的二进制文件
    */
    
//    printf("%p",returnString());
    
//    char * string = "iphone";
//    string[0] = 'a';
    
//    changeAvalue();
//    printf("%d", a);
    
//    malloc分配内存函数,返回值类型为 void * (任意类型指针)
   
    //给str 分配8字节空间
//    char * str = malloc(8);
//    strcpy(str, "iphone");
//    printf("%s",str);
    
//    int * number = malloc(4);
//    short * sarray = malloc(4);
    
//    *number = 4;
//    *sarray = 2;
//    *(sarray + 1) = 4;
//    printf("%d", *number);
    
    //给一个学生结构体分配内存空间
//   Student *stu = malloc(sizeof(Student));
    
    //给一个学生数组分配空间(如果是给一个数组指针分配内存空间,应该分配单个元素所占内存大小乘以元素个数)
//   Student *stu2 = malloc(sizeof(Student) * 5);
    
//    int number = 10;
//    int *a = malloc(4);
//    a = &number;
    
//    销毁指针a  不可以重复销毁
//    free(a);
//    free(a);
//    printf("%d",a);
    
    char str[] = "iphone5s and touch3";
    int i = 0;
    //count 计算数字个数
    int count = 0;
    while (str[i] != '\0') {
        if (str[i] >= '0' && str[i] <= '9') {
            count++;
        }
        i++;
    }
    
    //动态分配count个元素内存空间,加的 1,是为了加'\0'
    char *str2= malloc(count + 1);
    i = 0;
    count = 0;
    while (str[i] != '\0') {
        if (str[i] >= '0' && str[i] <= '9') {
            str2[count] = str[i];
            count++;
        }
        i++;
    }
    printf("%s", str2);
 
    return 0;
}
