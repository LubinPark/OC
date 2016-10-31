//
//  CollegeStudent.m
//  OC03_继承和便利构造器
//

#import "CollegeStudent.h"

@implementation CollegeStudent
-(id)initWithMajor:(NSString *)major andAcademy:(NSString *)academy{
    self = [super initWithSchool:@"东软" andNumber:101];
    if(self){
        _major = major;
        _academy = academy;
    }
    return self;
}

-(NSString *)major{
    return _major;
}
-(void)setMajor:(NSString *)major{
    _major = major;
}

-(NSString *)academy{
    return _academy;
}
-(void)setAcademy:(NSString *)academy{
    _academy = academy;
}

//重写student的study方法
-(void)study{
    [super study];
    NSLog(@"ColegeStudent的自己的学习方法 计算机");
}
@end
