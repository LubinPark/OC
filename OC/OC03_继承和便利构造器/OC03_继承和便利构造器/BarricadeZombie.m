//
//  BarricadeZombie.m
//  OC03_继承和便利构造器
//

#import "BarricadeZombie.h"

@implementation BarricadeZombie
- (NSString *)prop{
    return _prop;
}
- (void)setProp:(NSString *)prop{
    _prop = prop;
}

//对父类的sayHi方法进行重写
//-(void)sayHi{
//    NSLog(@"我是子类的方法sayHi");
//}
@end
