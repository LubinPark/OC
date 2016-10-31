//
//  Teacher.m
//  OC09_内存管理初级
//

#import "Teacher.h"

@implementation Teacher

-(id)initWithSutudent:(Student *)student{
    self = [super init];
    if (self) {
        _student = [[student alloc]init];
    }
    return self;
}

+(Teacher *)teacherWithStudent:(Student *)student{
    Teacher *teacher = [[Teacher alloc]initWithSutudent:student];
    return teacher;
}

@end
