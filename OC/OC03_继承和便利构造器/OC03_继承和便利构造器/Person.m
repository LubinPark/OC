//
//  Person.m
//  OC03_继承和便利构造器
//

#import "Person.h"

@implementation Person	
#pragma mark 初始化方法实现
-(id)initWithName:(NSString *)name andAge:(NSInteger)age andSex:(NSString *)sex{
    self = [super init];
    if (self) {
        _name = name;
        _age = age;
        _sex = sex;
    }
    return self;
}
+(Person *)personWithName:(NSString *)name andSex:(NSString *)sex andAge:(NSInteger)age{
    Person *per = [[Person alloc]initWithName:name andAge:age andSex:sex];
    return per;
}


#pragma mark 姓名set get方法实现
- (NSString *)name{
    return _name;
}
- (void)setName:(NSString *)name{
    _name = name;
}
#pragma mark 年龄set get方法实现
- (NSInteger)age{
    return _age;
}
- (void)setAge:(NSInteger)age{
    _age = age;
}
#pragma mark 性别set get方法实现
-(NSString *)sex{
    return _sex;
}
-(void)setSex:(NSString *)sex{
    _sex = sex;
}

#pragma mark person的学习方法实现
-(void)study{
    NSLog(@"Person 的学习方法");
    
}
@end
