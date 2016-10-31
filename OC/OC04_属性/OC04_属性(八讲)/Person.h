//
//  Person.h
//  OC04_属性
//

#import <Foundation/Foundation.h>

@interface Person : NSObject
//属性是OBjective-C 2.0之后出现的,定义一个属性默认生成getter,setter方法.并且声明一个对应的实例变量;
//属性的关键字@property
@property(nonatomic,copy) NSString *name;  //姓名
@property(nonatomic, copy) NSString *sex;   //性别
@property(nonatomic,assign) NSInteger age;   //年龄
@property(nonatomic,assign) CGFloat deposit; //存款
- (id)initWithName:(NSString *)name andSex:(NSString *)sex andAge:(NSInteger)age andDeposit:(CGFloat)deposit;
@end
