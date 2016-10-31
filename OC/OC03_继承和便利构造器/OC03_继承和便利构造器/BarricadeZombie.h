//
//  BarricadeZombie.h
//  OC03_继承和便利构造器
//

#import "CommondZombie.h"

@interface BarricadeZombie : CommondZombie
{
    NSString *_prop; //道具
}
- (NSString *)prop;
- (void)setProp:(NSString *)prop;
@end
