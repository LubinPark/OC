//
//  Student.h
//  OC03_继承和便利构造器
//

#import "Person.h"
#pragma mark Student的初始化方法
@interface Student : Person
{
    NSString *_school;
    NSInteger _number;
}
#pragma mark 初始化学生方法
-(id)initWithSchool:(NSString *)school andNumber:(NSInteger)number;

#pragma mark 学校set get方法
-(NSString *)school;
-(void)setSchool:(NSString *)school;

#pragma mark 学号set get方法
-(NSInteger)number;
-(void)setNumber:(NSInteger)number;
@end
