//
//  main.m
//  C04_一维数组、字符数组
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    
    //数组:一组相同类型数的集合;
    //类型修饰符(基本数据类型) 数组名[常亮表达式] = {元素1,元素2...  }
//    int a[5] = {1, 2, 3, 4, 5};
//    float b[10] = {1.1, -1.2, 10.3, -1.04, 1.0 };
//    char c[5] = {'A', 'B', 'c', 'd', 'e', '=', '?', '/'};
//    char string[] = "iPhone6";
//    char string2[] = {'i', 'P', 'h', 'o', 'n', 'e', '6'};//与上描述相同
//    char student[] = {'s', 't', 'u', 'd', 'e', 'n', 't'};
//    char student1[] = "student";
//    char teacher[] = {'t', 'e', 'a', 'c', 'h', 'e', 'r'};
//    char teacher1[] = "teacher";
//    int array[10] = {1, 2, 3, 4, 5, 6, 7, 8, 9, 10};
    
//    printf("%d ",array[3]);
//    printf("%d ",array[6]);
      //循环遍历数组
//    for (int i = 0 ; i < 10; i++) {
//        printf("%d ",array[i]);
//    }
    
//    int arrayTwo[10] = {0};
//    for (int i = 0; i < 10; i++) {
//        arrayTwo[i] = i + 1;
//        printf("%d  ", arrayTwo[i]);
//    }
    
//    int a[10]={0};
//    int b = 0;
//    for (int  i = 0; i < 10; i++) {
//        b = arc4random() % 31 + 20;
//        a[i] = b;
//        printf("%d\n", a[i]);
//    }
//
    //计算: 数组个数 = 数组所占的内存总数 / 单个元素所占内存大小
//    int array11[] = {1,2,34,54,55,7,5,123,2,3,34,2,34};
//    int count11 = sizeof(array11) /sizeof(array11[0]);
//    printf("%d个元素\n",count11);
//    
//    int array[]={0 };
//    int count = sizeof(array) /sizeof(array[0]);
//    printf("%d",count);
    
    //练习1 1
//    int arrary[20] = {};
//    int num = 0;
//    int sum = 0;
//    int max = 0;
//    int min = 10000;
//    int avg = 0;
//    for (int i= 0 ; i < 20; i++) {
//        num = arc4random() % 41 + 30;
//        max = max > num ? max : num;
//        min = min < num ? min : num;
//        arrary[i] = num;
//        printf("%d  ",arrary[i]);
//        sum = arrary[i] + sum;
//        avg = sum / 20;
//    }
//    printf("\n");
//    printf("和为%d\n", sum);
//    printf("最小%d\n", min);
//    printf("最大%d\n", max);
//    printf("平均数%d\n", avg);
//
        //2
//    int before[10] = {1, 2, 3, 4, 5, 6, 7, 8, 9, 10};
//    int after[10]={0};
//    for (int i = 0; i <10; i++) {
//         after[i] = before[i];
//        printf("%d ", after[i]);
//    }
//    printf("\n");
    
        //3
//    int a[10] = { 0 };
//    int b[10] = { 0 };
//    int c[10] = { 0 };
//    for (int i = 0 ; i < 10; i++) {
//        a[i] = arc4random() % 21 + 20;
//        b[i] = arc4random() % 21 + 20;
//        c[i] = a[i] + b[i];
//        printf("a[%d] = %d, b[%d] = %d, c[%d] = %d\n", i, a[i] ,i, b[i], i, c[i]);
//    }
    
    //冒泡排序(从小到大): 每走一趟排序,选出一个当前无序数组中最大的一个放到数组的最后.
    //每趟比较当前无序数组中元素个数减1次.
    
    //冒泡排序
    int num1[10] = {0};
    for (int i = 0; i < 10; i++) {
        num1[i] = arc4random() % 31 + 20;
        printf("%d ", num1[i]);
    }
    printf("\n");
    for (int i = 0; i < 10 - 1; i++) {//控制趟数 每趟冒泡出来1个最大
        for (int j = 0; j < 10 - 1 - i; j++) {
            if (num1[j] < num1[j + 1]) {//如果当前元素比后一个元素大,交换位置
                int temp = 0;
                temp = num1[j];
                num1[j] = num1[j + 1];
                num1[j + 1] = temp;
            }
        }
    }
    for (int i = 0; i < 10; i++) {
        printf("%d ",num1[i]);
    }
    
    //练习2
//    int array[10] = {0};
//    for (int i = 0; i < 10; i++) {
//        array[i] = arc4random() % 21 + 20;
//        printf("%d ",array[i]);
//    }

    //2遍
//    for (int i = 0; i < 10 - 1; i++) {
//        for (int j = 0; j < 10 - 1 - i; j++) {
//            if (array[j] > array[j + 1]) {
//            int temp = 0;
//            temp = array[j];
//            array[j] = array[j + 1];
//            array[j + 1] = temp;
//            }
//        }
//    }
    //3遍
//    for (int i = 0; i < 10; i++) {
//        for (int j = 0; j < 10 - 1 - i; j++) {
//            if (array[j] > array[j + 1]) {
//                int temp = array[j];
//                array[j] = array [j + 1];
//                array[j + 1] = temp;
//            }
//        }
//    }
    
    //4遍
       //第4遍
//    for (int i = 0; i < 10 - 1; i++) {
//        for (int j = 0; j < 10 - i - 1; j++) {
//            if (array[j] > array[j + 1]) {
//                int  temp = array[j];
//                array[j] = array[j + 1];
//                array[j + 1] = temp;
//            }
//        }
//    }
    
    //5遍
//    int n = 0;
//    scanf("%d",&n);
//    int array[n];
//    for (int k = 0; k < n; k++) {
//        array[k] = arc4random() % 91 + 10;
//        printf("%d ",array[k]);
//    }
//    printf("\n");
//    for (int i = 0; i < n - 1; i++) {
//        for (int j = 0; j < n - i - 1; j++) {
//            if (array[j] >array[j + 1]) {
//                int temp = array[j];
//                array[j] = array[j + 1];
//                array[j + 1] = temp;
//            }
//        }
//    }
//    for (int i = 0; i < n; i++) {
//        printf("%d ", array[i]);
//    }
    
    // 6冒泡
//    int a[10]={0};
//    for (int i = 0 ; i < 10; i++) {
//        a[i] = arc4random() % 10 + 1;
//        printf("%d ", a[i]);
//    }
//    printf("\n");
//    for (int i = 0; i < 10 -1; i++) {
//        for (int j = 0; j <  10 - i - 1; j++) {
//            if (a[j] > a[j + 1]) {
//                int temp = a[j];
//                a[j] = a[j + 1];
//                a[j + 1] = temp;
//            }
//        }
//    }
//    for (int i = 0; i < 10; i++) {
//        
//        printf("%d ", a[i]);
//        
//    }
//    
    //strlen() 输出字符串长度
    
//    char str[100] = "iphone";
//    
//    printf("%lu\n", sizeof(str) / sizeof(str[0]));
//    
//    printf("%lu\n", strlen(str));
    
    //strcat() 字符串拼接
    
//    char str[100] = "iphone";
//    char str1[100] = "Watch";
//    strcat(str, str1);
//    printf("%s", str);
    
    // I am in lanou, I will study hard.
//    char str[100] = "I am in lanou,";
//    char str1[100] = "I will study hard.";
//    strcat(str, str1);
//    printf("%s", str);
    
    // 6遍
//    int array[10] ={0};
//    for (int i = 0; i < 10 ; i++) {
//        array[i] = arc4random() % 21 +20;
//        printf("%d ", array[i]);
//    }
//    printf("\n");
//    for (int i = 0; i < 10 - 1; i++) {
//        for (int j = 0; j < 10 - i -1; j++) {
//            if (array[j] >array[j + 1]) {
//                int temp = array[j];
//                array[j] = array[j + 1];
//                array[j + 1] = temp;
//            }
//        }
//    }
//    for (int i = 0 ; i < 10; i++) {
//        printf("%d ", array[i]);
//    }
    
    //字符串拷贝 strcpy()
//    char str1[100] = "I'm so happy!";
//    char str2[100];
//    printf("%s",strcpy(str2, str1));
//    
    //字符串比较 strcmp() 比较结果为整数,大于0 时表示,前面的比后面的大,当结果等于0时,表示前面后面相等.当结果小于0时,表示后面的大.
    //只比较第一个字符,如果相同比较下一个,不一样,只比较第一个.
    char str3[100] = "Apple";
    char str4[100] = "aPPLE";
    printf("%d",strcmp(str3, str4));
//
//    
//    
    //练习3
    //    char a[]= "afjnpue";
    //    int num = sizeof(a) / sizeof(a[0]) - 1;
    //    printf("%d\n", num);
    //    for (int i = 0; i < num - i ; i++) {
    //        int temp = a[i];
    //        a[i] = a[num - i];
    //        a[num - i] = temp;
    //    }
    //    for (int i = 0; i <= num; i++) {
    //        printf("%c" , a[i]);
    //    }

    
 //   int array[10] = {123,42,326,674,57,5765,456,4564,90,9};
    
//    for (int i = 0; i < 9; i++) {
//        for (int j = 0; j < 9 - i; j++) {
//            if (array[j] > array[j + 1]) {
//                int temp = array[j];
//                array[j] = array[j + 1];
//                array[j + 1] = temp;
//            }
//        }
//    }
    
    
    
//    for (int i = 0; i < 9; i ++) {
//        for (int j = 0; j < 9 - i; j++) {
//            if (array[j] > array[j + 1]) {
//                int temp = array[j];
//                array[j] = array[j + 1];
//                array[j + 1] = temp;
//            }
//        }
//    }
    
//    for (int i = 0; i < 9; i++) {
//        for (int j = 0; j < 10 - i; j++) {
//            if (array[j] > array[j + 1]) {
//                int temp = array[j];
//                array[j] = array[j + 1];
//                array[j + 1] = temp;
//            }
//        }
//    }
//    for (int i = 0; i < 10; i ++) {
//        printf("%d ", array[i]);
//    }

    return 0;
}
