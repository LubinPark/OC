//
//  main.m
//  C08_指针
//

#import <Foundation/Foundation.h>

//使用指针参数,传递地址
//void exchange (int *a, int *b){
//    //交换2个数
//    int temp = *a;
//    *a = *b;
//    *b = temp;
//}

int main(int argc, const char * argv[]) {
    
//    int first = 12;
//    int second = 20;
//    exchange(&first, &second);
//    printf("first = %d,second = %d", first, second);
  
    //指针是存放内存地址的变量
    //定义一个整型指针变量,初始值为空
    //如何判断一个变量的类型:变量名前面所有的是该变量的类型
    
    //整型指针 int *
//    int *p = NULL;
    
    //指针类型只与操作系统有关(64位 8字节, 32位 4字节)
//    printf("%lu", sizeof(float*));
    
    //打印指针变量的地址用 %p
//    printf("p = %p\n", p);

//    int a = 20;
//    printf("a = %p\n",&a);
    
//    int* p = &a;
//    printf("p = %p\n",p);
    
    //打印p指向的地址所存储的内容,这时候我们需要使用取值运算符(*)
//    * p = a
//    printf("%d\n", *p);
//     p = &a
//    *p = 100;
//    printf("%d\n", a);
//    int b = 3;
    
    //将指针重指向 变量b的地址
//    p = &b;
//    *p = 123;
//    printf("%d\n", b);
    
    //指针类型只有加减运算
//    printf("p = %p\n", p);
//    printf("p++ = %p\n",++p);
//    char letter= 'a';
//    char *p2 = &letter;
//    printf("p2 = %p\n", p2);
//    p2++;
//    printf("p2++ = %p", p2);
    
    //数组的名是该数组的首地址
//    int array[4]= {1,3,5,7};
//    printf("array的地址:%p, array[0]的地址%p",&array,&array[0]);
    
//    int *p = array;
//    printf("%d", *p );
//    printf("\n%d", *(p+1));
//    printf("\n%d", *p + 1);
    
//    printf("\n%d", p[2]);
//    *(p + 2)= 6;
//    printf("\n%d", array[2]);
    
//    int a[1,3,5];
//    p[1] = 3
    
//恒等于   a[1]
//恒等于   *(p + 1)
//恒等于   *(a + 1)
    
    //指针和数组的区别
    //指针:只与操作系统位数有关
    //数组:与数组个数和类型有关
    //数组名是常量地址,不能重点向(不能赋值)
    //指针可以重指向
    
//    short array[5] = {1,3,5,6,7};
//    int *p = array;
    
//    printf("%lu", sizeof(short)); //short 占2个字符
//    printf("%d", *p);
    
//    char string[20] = "iphone";
//    char *p = string;
//    *(p + 1) = 'v';
//    printf("%s",p + 1);
    
    //通过指针计算字符串长度
//    char string[1000] = "abcdefg";
//    char *p = string;
//    int count = 0;
//    while (YES) {
//        count++;
//        if (*(p + count) == '\0') {
//            printf("%d",count);
//            break;
//        }
//    }

    return 0;
}




