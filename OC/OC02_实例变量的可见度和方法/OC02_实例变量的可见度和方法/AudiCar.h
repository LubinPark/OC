//
//  AudiCar.h
//  OC02_实例变量的可见度和方法
//

#import <Foundation/Foundation.h>

@interface AudiCar : NSObject
{
    @public
    NSString       *_color;
    NSInteger       _price;
    NSString        *_kind;
    NSString *_productArea;
}

-(id)initWithColor:(NSString *)color andPrice:(NSInteger)price andKind:(NSString *)kind andProductArea:(NSString *)productArea;

-(NSString *)color;
-(NSInteger)price;
-(NSString *)kind;
-(NSString *)productArea;

-(void)setColor:(NSString *)color;
-(void)setPrice:(NSInteger)price;
-(void)setKind:(NSString *)kind;
-(void)setProductArea:(NSString *)ProductArea;
@end
