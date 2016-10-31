//
//  Person.m
//  OC04_属性
//

#import "Person.h"

@implementation Person
@synthesize age = _age;
- (id)initWithName:(NSString *)name andSex:(NSString *)sex andAge:(NSInteger)age andDeposit:(CGFloat)deposit{
    self = [super init];
    if (self) {
        _name = name;
        _sex = sex;
        _age = age;
        _deposit = deposit;
    }
    return self;
}

-(NSInteger)age{
    return _age;
}
-(void)setAge:(NSInteger)age{
    _age = _age + 1;
}



@end
