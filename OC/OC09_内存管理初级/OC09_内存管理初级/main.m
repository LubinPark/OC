//
//  main.m
//  OC09_内存管理初级
//

#import <Foundation/Foundation.h>
#import "Student.h"
#import "Teacher.h"
int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        /**************** 内存管理 *****************/
         
        //创建一个工程,默认为ARC(自动参考引用计数).
        //手动修改MRC(手动参考引用计数) targerts ->build ->settings->搜索auto(gar),将Object-C ARC改为NO.
        //特别注意:OC中没有垃圾回收机制(gc).
        
//        Student *student = [[Student alloc]init];
        
        //OC中通过引用计数(retainCount)来检测某块内存的使用状况.
//        NSLog(@"%ld",student.retainCount);
        
        //引起引用计数变化的方法总结:alloc    由0 到 1
        //                      :retain  引用计数 + 1
        //                      :release 引用计数 - 1
//        Student *stu = [student retain];
//        [stu release];
//        stu = nil;
//        NSLog(@"student = %ld, stu = %ld",student.retainCount, stu.retainCount);

        //自动释放池
//        @autoreleasepool {}

//        NSAutoreleasePool *autoPool = [[NSAutoreleasePool alloc]init];
//        Student *student2 = [[Student alloc]init];
//        [student2 retain];

        //给对象发送autorelease 消息出了释放池之后进行释放
//        NSLog(@"student2 = %ld",student2.retainCount);
//        [student2 autorelease];
//        NSLog(@"student2 (in) = %ld", student2.retainCount);
//        [autoPool release];
//        NSLog(@"student2 (out) = %ld", student2.retainCount);

        //**************************************************************

        //注意EXC_BAD_ACCESS 多数为内存引起的(内存溢出,野指针异常)
//        Student *student3 = [ Student studentWithName:@"张三" andAge:31];
//        NSLog(@"student %ld",student3.retainCount);
//        [student3 release];
//        NSLog(@"%@",student3.name);

//        student3.name = @"李四";
//        NSLog(@"%@",student3.name);
        
        //黄金法则:引用计数的增加和减少减少.
        //alloc 的对象需要在使用之后进行release
        //retain的对象在使用之后进行release
        //特别注意:不要使用已经释放的对象(野指针异常)
        
        /***************  copy    ***************/
        
        // 使用copy方法的对象,必须要遵循NSCopying协议
        //如果对自定义类添加copy方法,首先:遵循NSCopy协议,然后:实现copyWithZone方法,最后:写具体实现
        Student *student = [Student studentWithName:@"张三" andAge:25];
        Student *student2 = [student copy];
        NSLog(@"%@,%ld",student2.name, student2.age);
    }
    return 0;
}
