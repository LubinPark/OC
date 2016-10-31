//
//  A.m
//  OC02_实例变量的可见度和方法
//

#import "A.h"
#import "B.h"
@implementation A
-(id)init{
    B *b = [[B alloc]init];
    return self;
}

@end
