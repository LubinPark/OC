//
//  Teacher.m
//  OC04_属性
//

#import "Teacher.h"

@implementation Teacher
- (id)initWithSex:(NSString *)sex andName:(NSString *)name andAge:(NSInteger)age andNumber:(NSInteger)number
{
    self = [super init];
    if (self) {
        _name = name;
        _sex = sex;
        _age =age;
        _number = number;
    }
    return self;
}

+(Teacher *)teacherWithSex:(NSString *)sex andName:(NSString *)name andAge:(NSInteger)age andNumber:(NSInteger)number{
    Teacher *teacher = [[Teacher alloc]initWithSex:sex andName:name andAge:age andNumber:number];
    return teacher;
}
@end
