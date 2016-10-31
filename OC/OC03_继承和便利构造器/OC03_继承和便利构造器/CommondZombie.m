//
//  CommondZombie.m
//  OC03_继承和便利构造器
//

#import "CommondZombie.h"
//普通僵尸
@implementation CommondZombie
-(id)initWithTotalBlood:(NSInteger)totalBlood andLoseBlood:(NSInteger)loseBlood andZombieName:(NSString *)zombieName{
    _totalBlood = totalBlood;
    _loseBlood = loseBlood;
    _zombieName = zombieName;
    return self;
}

- (NSInteger)totalBlood{
    return _totalBlood;
}
- (void)setTotalBlood:(NSInteger)totalBlood{
    _totalBlood = totalBlood;
}

- (NSInteger)loseBlood{
    return  _loseBlood;
}
- (void)setLoseBlood:(NSInteger)loseBlood{
    _loseBlood = loseBlood;
}

- (NSString *)zombieName{
    return _zombieName;
}
- (void)setZombieName:(NSString *)zombieName{
    _zombieName = zombieName;
}

//-(void)sayHi{
//    NSLog(@"我时父类方法sayHi");
//}
@end
