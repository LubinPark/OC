//
//  main.m
//  OC10_高级内存管理
//

#import <Foundation/Foundation.h>
#import "Student.h"
#import "Mobile.h"
#import "Iphone.h"
#import "Android.h"
int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        Student *stu = [[Student alloc]init];
        stu.sex =@"nan";
        [stu release];        
        
        Mobile *mobile = [[Iphone alloc]init];
        [stu showMyPhone:mobile];
    }
    return 0;
}
