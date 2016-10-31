//
//  main.m
//  OC04_属性
//

#import <Foundation/Foundation.h>
#import "Person.h"
#import "Student.h"
#import "Teacher.h"
int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        Person *per = [[Person alloc]initWithName:@"张三" andSex:@"男" andAge:24 andDeposit:10000.34];
        NSLog(@"%@",[per name]);
        [per setName:@"李四"];
        [per setAge:24];
        [per setSex:@"男"];
        [per setDeposit:100000.34];
        NSLog(@"%@ ,%ld, %@, %.2f",[per name],[per age],[per sex],[per deposit]);
        
        Student *stu = [[Student alloc]initWithName:@"李四" andSex:@"男" andAge:24 andDeposit:10000.23 andNum:101 andClasses:@"IOS"];
        NSLog(@"姓名:%@ 性别:%@ 年龄%ld 存款:%.2f 学号%ld 班级%@",[stu name], [stu sex],[stu age], [stu deposit], [stu num], [stu classes]);
        
        //点语法的使用赋值左边的 有点得部分相当于 setter 右边的getter
        stu.num = 102;
        stu.classes =@"蓝鸥";
         NSLog(@"姓名:%@ 性别:%@ 年龄%ld 存款:%.2f 学号%ld 班级%@",stu.name, stu.sex, stu.age, stu.deposit, stu.num, stu.classes);
        [stu study];
        
        Student *stu2 = [Student studentWithName:@"李四" andSex:stu.sex andAge:stu.age andDeposit:500.1 andNum:stu.num andClasses:stu.classes];

        //Teacher *teacher = [[Teacher alloc]initWithSex:@"女" andName:@"张三" andAge:30 andNumber:10001];
        //NSLog(@"姓名:%@ 性别:%@ 年龄:%ld岁 编号:%ld", [teacher name ],[teacher sex], [teacher age], [teacher number] );
        
        Teacher *t = [[Teacher alloc]init];
        stu2.teacher = t;
        
        //当使用点语法对属性经行连续访问赋值时,只有最后一个点相当于调用setter方法,其余均为getter方法.
        stu2.teacher.name = @"大哥";
        NSLog(@"%@",stu2.teacher.name);
        
        stu2.name = @"涛哥";
        
        //使用KVC(Key-Value-Coding/键值编码)为学生的姓名重新赋值
        //setValue:(id) forKey:(NSString *)
        //[stu2 setValue:@"王思聪" forKey:@"name"];
        //NSLog(@"%@",stu2.name);
        
        //setValue:(id) forKeyPath:(NSString *)
        //[stu2 setValue:@"花依然" forKeyPath:@"teacher.name"];
        //NSLog(@"%@",stu2.teacher.name);
        //NSLog(@"%@",[stu2 valueForKeyPath:@"teacher.name"]);
    }
    return 0;
}
