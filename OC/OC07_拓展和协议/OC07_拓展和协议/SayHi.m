//
//  SayHi.m
//  OC07_拓展和协议
//

#import "SayHi.h"

//拓展文件
@interface SayHi ()

@property(nonatomic, copy)NSString *name;

@end

@implementation SayHi

-(id)init{
    self = [super init];
    if (self) {
        _name = @"张三";
    }
    return self;
}

-(void)someBodySayHi{
    NSLog(@"%@ say Hi",self.name);
}

@end
