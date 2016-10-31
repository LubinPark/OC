//
//  main.m
//  C03循环三种结构
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    
    //循环的三种形式:while , do...while , for
    //第一种
//    int a = 0;
//    while (a < 2) {
//        printf("1\n");
//        a++;
//    }
//    return 0;

//    int num = 1;
//    int a = 0;
//    scanf("%d",&a);
//    while (num <= a) {
//        if (num % 7 == 0) {
//            printf("7的倍数%d,", num);
//        }else if(num % 10 == 7){
//            printf("个位数是7是%d,", num);
//        }else if (num / 10 ==7){
//            printf("十位是7是%d,", num);
//        }
//        num++;
//    }
    
    //30-50
//    int a = 0;
//    while (a < 1) {
//        printf("%d\n",arc4random() % 31 + 15);
//        a++;
//    }
    
    //102-150
//    int a = 0;
//    while (a < 10) {
//        printf("%d\n",arc4random() % 49 + 102);
//        a++;
//    }
    
    //11-34
//    int a = 0;
//    while (a < 5) {
//        printf("%d\n", arc4random() % 24 + 11);
//        a++;
//    }
//    
    
    //练习2
    //最大值
//    int n = 0;
//    int num = 0;
//    int max = 0;
//    int random = 0;
//    scanf("%d", &n);
//    while (num < n) {
//        random = arc4random() % 41 + 30;
//        printf("%d\n",random);
//        max = max > random ? max :random;
//        num++;
//    }
//    printf("最大%d\n",max);
    
    //最小值
//    int n = 0;
//    int num = 0;
//    int mix = 10000;
//    scanf("%d",&n);
//    while (num < n) {
//        int random = arc4random() % 41 + 30;
//        printf("%d\n", random);
//        mix = mix < random ? mix : random;
//        num++;
//    }
//    printf("最小为%d",mix);
    
   //break 强制结束,跳出当前循环体
//    int n = 0;
//    while (1) {
//        printf("%d ",n);
//        if (n == 5) {
//            break;
//        }
//        n++;
//    }
   
    
    //continue结束本次循环,进入下一次循环
//    int a = 0;
//    int n = 0;
//    while (a < 5) {
//        printf("a = %d, n = %d \n",a, n);
//        a++;
//        if (a == 2) {
//            continue;
//        }
//        n++;
//    }
    
    //do...while 循环结构:限制性循环体,在进行循环判断:特点至少执行一次
//    int n = 0;
//    do {
//        n++;
//    }while (0);
//    printf("%d\n",n);
//    
//    int m = 0;
//    while (0) {
//        m++;
//    }
//    printf("%d\n", m);
    
    
    //for 循环结果
//    int i = 0;
//    for (i; i < 10; i++) {
//        printf("%d,", i);
//        break;
//    }
//    printf("%d", i);
    

   //100-1000水仙花数
    for (int i = 100; i < 1000; i++) {
        int b = i / 100;
        int s = i % 100 / 10;
        int g = i % 10;
        
        if (i == g * g * g + s * s * s + b * b * b ) {
            printf("%d\n", i);
        }
    }
    
//    for (int j = 1; j < 4; j++) {
//        for (int i = 1; i < j + 1; i++) {
//            printf("%d ",i);
//        }
//        printf("\n");
//    }
    
    //乘法口诀表
//    for (int j = 1; j < 10; j++) {
//        for (int i = 1; i < j + 1; i++) {
//            printf("%d*%d=%02d   ", i, j, i * j);
//        }
//        printf("\n");
//    }
    
//    for (int i = 1; i < 10; i++) {
//        for (int j = 0; j < 10; j++) {
//            for (int k = 1; k < 10; k++) {
//                printf("%d%d%d  ", i, j, k);
//            }
//        }
//    }
    
    //总结
    // for 最常用, 通常用于知道循环此时的循环
    // while 也很常用.通常用于不知道循环次数的循环
    // do...while 不是特别常用,通常用于需要限制性依次的循环
    // break 跳出本层循环,continue 结束本次循环,通常与if 连用

//    int num = 0;
//    int max = 100;
//    int min = 0;
//    int guess = 0;
//    int time = 5;
//    printf("输入0-100数字\n");
//    scanf("%d", &num);
//    while (time > 0) {
//        printf("%d___%d\n",min,max);
//        printf("剩余%d次\n",time);
//        scanf("%d",&guess);
//        if (guess > num && guess < max) {
//            max = guess;
//        }else if (guess < num && guess > min){
//            min = guess;
//        }else
//            printf("错误\n");
//        if(guess == num){
//            printf("正确\n");
//        }
//        time--;
//    }
    
    return 0;
}
    
    

    

