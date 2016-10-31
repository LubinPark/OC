//
//  MobilePhone.h
//  OC02_实例变量的可见度和方法
//

#import <Foundation/Foundation.h>

@interface MobilePhone : NSObject
{
    NSString *_brand;
    NSString  *_kind;
    NSInteger _price;
    NSString *_color;
}

-(id)initWithBrand:(NSString *)brand andKind:(NSString *)kind andPrice:(NSInteger)price andColor:(NSString *)color;

-(NSString *)brand;
-(NSString *)kind;
-(NSInteger)price;
-(NSString *)color;

-(void)setBrand:(NSString *)brand;
-(void)setKind:(NSString *)kind;
-(void)setPirce:(NSInteger)price;
-(void)setColor:(NSString *)color;
@end
