//
//  AudiCar.m
//  OC02_实例变量的可见度和方法
//

#import "AudiCar.h"

@implementation AudiCar
-(id)initWithColor:(NSString *)color andPrice:(NSInteger)price andKind:(NSString *)kind andProductArea:(NSString *)productArea{
    _color = color;
    _price = price;
    _kind = kind;
    _productArea = productArea;
    return  self;
}

-(NSString *)color{
    return _color;
}
-(NSInteger)price{
    return _price;
}
-(NSString *)kind{
    return _kind;
}
-(NSString *)productArea{
    return _productArea;
}

-(void)setColor:(NSString *)color{
    _color = color;
}
-(void)setPrice:(NSInteger)price{
    _price = price;
}
-(void)setKind:(NSString *)kind{
    _kind = kind;
}
-(void)setProductArea:(NSString *)ProductArea{
    _productArea = ProductArea;
}

@end
