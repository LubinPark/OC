//
//  Student.m
//  OC03_继承和便利构造器
//

#import "Student.h"

@implementation Student
#pragma mark 初始化学生方法实现

-(id)initWithSchool:(NSString *)school andNumber:(NSInteger)number {
    self = [super initWithName:@"张三" andAge:23 andSex:@"男"];
    if (self) {
        _school = school;   //学校
        _number = number;   //学号
    }
    return self;
}

#pragma mark 学校 set get方法实现
-(NSString *)school{
    return _school;
}
-(void)setSchool:(NSString *)school{
    _school =school;
}

#pragma mark 学号set get方法实现
-(NSInteger)number{
    return _number;
}
-(void)setNumber:(NSInteger)number{
    _number = number;
}

//重写父类的study的方法
-(void)study{
    [super study];
    NSLog(@"student 的学习方法 计算器");
}
@end
