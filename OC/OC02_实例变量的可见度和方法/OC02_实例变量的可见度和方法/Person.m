//
//  Person.m
//  OC02_实例变量的可见度和方法
//

#import "Person.h"

@implementation Person
//自定义的初始化
-(id)initWithName:(NSString *)name andSex:(NSString *)sex{
    _name = name;
    _sex =sex;
    return self;
}
-(id)init{
    _age = 18;
    _hobby = @"敲代码";
    _speHobby = @"做梦敲代码";
    return self;
}
-(void)sayHi{
    NSLog(@"HI");
}
+(void)sayHello{
    NSLog(@"HELLO");
}

#pragma mark 读取年龄的方法实现
-(NSInteger)age{
    return _age;
}
#pragma mark 读取爱好的方法实现
-(NSString *)hobby{
    return _hobby;
}
#pragma mark 读取嗜好的方法实现
-(NSString *)speHobby{
    return _speHobby;
}

#pragma mark age 的赋值方法实现
-(void)setAge:(NSInteger)age{
    _age = age;
}
#pragma mark hobby 的赋值方法
-(void)setHobby:(NSString *)hobby{
    _hobby = hobby;
}
#pragma mark speHobby的赋值方法实现
-(void)setSpeHobby:(NSString *)speHobby{
    _speHobby = speHobby;
}
@end
