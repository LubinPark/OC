//
//  Person.m
//  OC1_类和对象
//

#import "Person.h"

@implementation Person

-(id)init{
    _name = @"小王";
    _age = 1;
    _hobby = @"吃饭";
    _sex = @"男";
    
    //self 代表调用该初始化方法的对象
    return self;
}
#pragma mark sayHai方法实现
-(void)sayHi{
    //OC中使用的打印方法为NSlog
    NSLog(@"你好,我叫%@, 今年%d, 爱好%@", _name, _age, _hobby);
}
#pragma mark 吃饭
- (void)eat{
    NSLog(@"中午吃饭");
}
@end

@implementation Animal

-(id)init{
    _name = @"狮子";
    _kind = @"猫科";
    _sex = @"公的";
    _food = @"肉";
    return self;
}

-(void) run{
    NSLog(@"%@,属于%@,%@,爱吃%@.",_name,_kind,_sex,_food);
}
-(void)speak{
    NSLog(@"呱呱呱");
}
@end

@implementation Food
-(void) eat{
    NSLog(@"可以吃, 菜名:%@, 颜色:%@ 价格:%@",_name, _price, _size);
}
-(void) make{
    NSLog(@"谁做的");
}
@end
