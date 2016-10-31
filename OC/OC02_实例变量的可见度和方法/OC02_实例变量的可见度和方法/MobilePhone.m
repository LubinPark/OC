//
//  MobilePhone.m
//  OC02_实例变量的可见度和方法
//

#import "MobilePhone.h"

@implementation MobilePhone
-(id)initWithBrand:(NSString *)brand andKind:(NSString *)kind andPrice:(NSInteger)price andColor:(NSString *)color{
    _brand = brand;
    _kind = kind;
    _price = price;
    _color = color;
    return  self;
}

-(NSString *)brand{
    return _brand;
}
-(NSString *)kind{
    return _kind;
}
-(NSInteger)price{
    return _price;
}
-(NSString *)color{
    return _color;
}

-(void)setBrand:(NSString *)brand{
    _brand = brand;
}
-(void)setKind:(NSString *)kind{
    _kind = kind;
}
-(void)setPirce:(NSInteger)price{
    _price = price;
}
-(void)setColor:(NSString *)color{
    _color = color;
}
@end
