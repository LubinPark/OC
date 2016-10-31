//
//  Student.m
//  OC09_内存管理初级
//

#import "Student.h"

@implementation Student

-(id)initWithName:(NSString *)name andAge:(NSInteger)age{
    self = [super init];
    if (self) {
        _name = name;
        _age = age;
    }
    return self;
}

-(id)copyWithZone:(NSZone *)zone{
    Student *student = [[Student allocWithZone:zone]init];
    student.name = self.name;
    student.age = self.age;
    return  student;
}



+(Student *)studentWithName:(NSString *)name andAge:(NSInteger)age{
    Student *student = [[Student alloc]initWithName:name andAge:age];
    return student;
}

@end
