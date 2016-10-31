//
//  CommondZombie.h
//  OC03_继承和便利构造器
//

#import <Foundation/Foundation.h>

@interface CommondZombie : NSObject
{
    NSInteger _totalBlood;  //总血量
    NSInteger _loseBlood;   //每次被攻击失血量
    NSString *_zombieName;  //僵尸姓名
}
-(id)initWithTotalBlood:(NSInteger)totalBlood andLoseBlood:(NSInteger)loseBlood andZombieName:(NSString *)zombieName;

- (NSInteger)totalBlood;
- (void)setTotalBlood:(NSInteger)totalBlood;

- (NSInteger)loseBlood;
- (void)setLoseBlood:(NSInteger)loseBlood;

- (NSString *)zombieName;
- (void)setZombieName:(NSString *)zombieName;

//-(void)sayHi;
@end
