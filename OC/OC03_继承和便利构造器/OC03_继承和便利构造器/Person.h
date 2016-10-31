//
//  Person.h
//  OC03_继承和便利构造器
//

#import "CommondZombie.h"
#pragma mark Person的初始化方法
@interface Person : NSObject
{
    NSString *_name;    //姓名
    NSInteger _age;     //年龄
    NSString *_sex;     //性别
}
#pragma mark 初始化
-(id)initWithName:(NSString *)name andAge:(NSInteger)age andSex:(NSString *)sex;

#pragma mark Person的便利构造器的方法
//首先便利构造器的一个类名(+)然后方法民以类名开头
//*****返回值是该类的实例类型
+(Person *)personWithName:(NSString *)name andSex:(NSString *)sex andAge:(NSInteger)age;

#pragma mark 姓名set, get方法
- (NSString *)name;
- (void)setName:(NSString *)name;

#pragma mark 年龄set, get方法
- (NSInteger)age;
- (void)setAge:(NSInteger)age;

#pragma mark 性别set, get方法
-(NSString *)sex;
-(void)setSex:(NSString *)sex;

#pragma mark person的学习方法实现
-(void)study;

@end
