//
//  main.m
//  OC08_Block和数组高级
//

#import <Foundation/Foundation.h>
#import "Student.h"

int add(int a,int b){
    int c = a + b;
    return c;
}

int max(int a , int b){
    int max = a > b ? a : b;
    return max;
}

typedef NSInteger (^MyBlock)(NSString *);

typedef int(^MyBlcok)(NSString *);

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        //回顾函数指针  p 是指针变量, int(*)(int,int)是指针类型,sum是指针存的内容
//        printf("%d\n", add(10, 4));
//        printf("%d\n", max(4, 7));

//        int (*p)(int, int) = add;
//        printf("%d\n", p(4, 6));
        
//        int( *p1)(int,int) = max;
//        printf("%d\n", p1(55, 44));
        
        //block: 块语法
        // ^ 插入符 也是OC中Block的标识
        //block 以 ; 结束
        // = 左面: 返回值类型 (^名)(参数类型)
        // = 右边: ^[返回值类型]  []可写可不写 参数名必须写
        // = 左边右面 的参数类型必须一一对应
        
//        void (^Myblock)(int, int) = ^  void (int a, int b){
//            NSLog(@"%d", a + b);
//        };
        
        //注意:block内部在定义时未运行, 调用时才使用
//        Myblock(10, 12);

        //有返回值无参
//        int(^Myblock1)() = ^{
//           int max = 0;
//           int  a= 10;
//           int  b = 5;
//           max = a > b ? a : b;
//           return max;
//        };
//        printf("%d",Myblock1());

        //定义一个无参数,无返回值的block
//        void(^Myblock2)() = ^{
//            NSLog(@"无参,无返回值");
//        };
//        Myblock2();
        
        //定义一个有参数,有返回值的block
        
//        int(^Myblock3)(int, int) = ^ int(int a, int b){
//            int sum = a + b;
//            return  sum;
//        };
//        NSLog(@"%d", Myblock3(4,7));
        
        //练习  写一个 返回值为整型 参数为NSString（仅一个参数）的block，实现将字符串转换为整型的功能。
//        NSInteger (^block)(NSString *) = ^(NSString *str){
//            return [str integerValue];
//        };
//        NSLog(@"%ld", block(@"123123"));
        
        //使用typedef 给block起别名
//        typedef NSInteger (^MyBlock)(NSString *);
//        MyBlcok block2 = ^(NSString *str){
//            return [str integerValue];
//        };
//        NSLog(@"%ld", block1(@"123123"));
        
        /****   block    ****/

        //注意:block 内不能对局部变量进行更改,只能惊醒读取
        //block内可以对全局变量进行读取和更改
        //block内部 可以使用外界的局部变量
        //注意:如果相对局部变量在block内进行更改,需要关键字__block将局部变量拷贝到当前block所在栈区
        
//       __block int num = 10;
//        void (^block)() = ^(){
//            int c = num * 10;
//            NSLog(@"%d",num++);
//        };
//        block();
//        NSLog(@"%d",num);
        
        //@selector 方法选择器
        NSArray *array = [NSArray arrayWithObjects:@"2", @"4", @"6", @"8", @"3", @"5", @"7", nil];
//        NSArray *array2 = [array sortedArrayUsingSelector:@selector(compare:)];
        
        //比较器
        NSComparator compare = ^(id obj1, id obj2){
            return [obj2 compare:obj1];
        };
        
        //使用Block进行数组排序,要用到比较器,(NSComparator)
        NSArray *array3 = [array sortedArrayUsingComparator:compare];
        NSLog(@"%@", array3);
        
//        Student *stu1 = [Student studentWithName:@"Zhangsan" andAge:24 andScore:98.5];
//        Student *stu2 = [Student studentWithName:@"Lisi" andAge:23 andScore:67];
//        Student *stu3 = [Student studentWithName:@"Wangwu" andAge:27 andScore:85];
//        Student *stu4 = [Student studentWithName:@"Zhaoliu" andAge:19 andScore:95.5];
//        Student *stu5 = [Student studentWithName:@"Tianqi" andAge:31 andScore:59];
//        NSArray *array = [NSArray arrayWithObjects:stu1, stu2, stu3, stu4, stu5, nil];
        
        //使用block,将数组array中学生元素按照姓名升序排列
        //设置比较器
//        NSComparator comparator = ^(Student *stu1,Student *stu2){
//            NSLog(@"=============%@, %@",stu1.name, stu2.name);
//            return [stu1.name compare:stu2.name];
//        };
        
        //按照比较器的比较规则,将数据进行排序
//        NSArray *sortedArray = [array sortedArrayUsingComparator:comparator];
//        for (Student *stu in sortedArray) {
//            NSLog(@"%@", stu.name);
//        }
//        NSLog(@"学生的年龄进行升序排列");
        
        //将数组按照学生年纪进行升序排列
//        NSComparator comarator2 = ^(Student *stu1,Student *stu2){
//            if (stu1.age > stu2.age) {
//                return NSOrderedDescending;
//            }else if (stu1.age < stu1.age){
//                return NSOrderedAscending;
//            }else{
//                return NSOrderedSame;
//            }
//        };

//        NSArray *sorbArray = [array sortedArrayUsingComparator:comarator2];
//        for (Student *stu in sorbArray) {
//            NSLog(@"%ld",stu.age);
//        }
//        NSLog(@"学生的成绩进行升序排列");
        
        //按照数组按照学生的成绩进行升序排列
//        NSComparator comparator3 = ^(Student *stu1, Student *stu2){
//            if (stu1.score > stu2.score ) {
//                return  NSOrderedDescending;
//            }else if (stu1.score < stu2.score){
//                return NSOrderedAscending;
//            }else{
//                return NSOrderedSame;
//            }
//        };

//        NSArray *array2 = [array sortedArrayUsingComparator:comparator3];
//        for (Student *stu in array2) {
//            NSLog(@"%.1f",stu.score);
//        }
//        NSLog(@"学生的成绩进行降序排列");

        //按照数组按照学生的成绩进行降序排列
//        NSComparator comparator4 = ^(Student *stu1, Student *stu2){
//            if (stu1.score < stu2.score) {
//                return NSOrderedDescending;
//            }else if (stu1.score > stu2.score){
//                return NSOrderedAscending;
//            }else{
//                return NSOrderedSame;
//            }
//        };
//        
//        NSArray *array3 = [array sortedArrayUsingComparator:comparator4];
//        for (Student *stu in array3) {
//            NSLog(@"%.3f",stu.score);
//        }
        
//        /***********************   字面量    **********************/
        
        //字符串的字面量
//        NSString *str = @"This is String";
        
        //数组的字面量
//        NSArray *arrays = @[@"12", @"14",@"da"];
        
        //等价于NSArray *arrays = [NSArray arrayWithObjects:@"12", @"14",@"da", nil]
//        NSArray *arrays2 = @[stu1,stu2];

        //数组字面量的取值
//        arrays2[1]; //等价于  [array2 objecetAtIndex:1]
        
        //字典的字面量 @{key : value, ...}
        //相当与 NSDictionary *dic = [NSDictionary dictionaryWithObjectsAndKeys:@"张三",@"name",@"24",@"age",@"94",@"score", nil];
//        NSDictionary *dic = @{@"name" : @"张三", @"age" : @"24", @"score" : @"94" };

        //字典取值字面量dic[key] 相当于 [dic objectForKey:key]
//        NSLog(@"%@",dic[@"name"]);
        
        //mutableCopy 将不可变拷贝成可变
//        NSMutableArray *arrays3 = [@[@"12", @"asd",@"asd12",@"123"]mutableCopy];
        
        //相当于 NSMutableArray *array4 = [NSMutableArray arrayWithArray:array];
//        array = [@"12", @"asd",@"asd12",@"123"];
//        [arrays3 addObject:@"test"];
//        NSLog(@"%@",arrays3);
    }
    return 0;
}

