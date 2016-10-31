//
//  main.m
//  C05_而为数组,字符串数组,多维数组
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    
    //二维数组: 类型 数组名[第一维度长][第二维度长] = {};
    //1.二维数组的2种形式:
//    int array1[2][3] = {{1, 2, 3},{4, 5, 6}};
//    int array2[2][3] ={1, 2, 3, 4,};
//    printf("%d\n", array2[1][2]);
    
    //遍历二维数组
//    for (int i = 0; i < 2; i++) {
//        for(int j = 0; j < 3; j++){
//            if (array1[i][j] == 4) {
//                printf("i = %d, j = %d\n", i ,j);
//            }
//        }
//    }
    
    //二维数组赋值
//    for (int i = 0 ; i < 2; i++) {
//        for (int j = 0; j < 3; j++) {
//            array2[i][j] = arc4random() % 7;
//            printf("%d ", array2[i][j]);
//        }
//    }
    
    
//    int a[2][3] = {1, 2, 3, 4, 5, 6};
//    int a2[3][2] = {0};
//    int max = 0;
//    
//    for (int i = 0; i < 3; i++) {
//        for (int j = 0 ; j < 2; j++) {
//            
//            max = max > a[i][j] ? max : a[i][j];
//            a2[i][j] = a[j][i];
//            
//            printf("j = %d, i = %d, a2[i][j]=%d\n", j, i,a[j][i]);
//        }
//    }
//    printf("max = %d\n", max);
   
    
    //当空时,会根据数量自动添加
//    int array[][3]={1, 2, 3, 4, 5};
//    printf("%d", array[1][1]);
    
//    char string[3][10] = {"iphone","5s","watch"};
//    printf("%s",string[2]);
    
    
    //有个3行4列的二维数组,要求编程找出最大元素,并输出坐在的行和列
    
//    int a[3][4] ={1, 6, 2, 3,
//                  4, 5, 7, 0,
//                  9, 8, 24,11};
//    
//    for (int i = 0; i < 3; i++) {
//        for (int j = 0; j < 4; j++) {
//            if (a[i][j] > a[i + 1][j + 1]) {
//                int temp = a[i][j];
//                a[i][j] = a[i + 1][j + 1];
//                a[i + 1][j + 1]= temp;
//            }
//        }
//    }
//    
//    for (int i = 0; i < 3; i++) {
//        for (int j = 0; j < 4; j++) {
//            printf("%d ,",a[3][4]);
//        }
//    }
//
    // 最长字符串的个数和字符串
//    char string[4][10] = {"iPhone", "5s", "wathch", "abcdefghi"};
//    unsigned long int max = 0;//记录最长字符串的长度
//    int index = 0; //记录最长字符串所在的下标
//    for (int i = 0; i < 4; i++) {
//        //得到最长字符串的长度
//        if ( max < strlen(string[i])) {
//            max = strlen(string[i]);
//            index = i;
//        }
//    }
//    printf("%lu\n",max);
//    printf("%s",string[index]);
//    
//    
//    for (long i = 1; i <= 1000000000000; i ++) {
//        for (long j = 1; j <= 100000000; j ++) {
//            if (i == j * j * j) {
//                printf("i=%ld,", i);
//            }
//        }
//    }

}
