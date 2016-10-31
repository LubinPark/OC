//
//  Student.m
//  OC04_属性
//

#import "Student.h"
@implementation Student

- (id)initWithName:(NSString *)name andSex:(NSString *)sex andAge:(NSInteger)age andDeposit:(CGFloat)deposit
            andNum:(NSInteger)num andClasses:(NSString *)classes
{
    self = [super initWithName:name andSex:sex andAge:age andDeposit:deposit];
    if (self) {
        _num = num;
        _classes = classes;
    }
    return self;
}
+(Student *)studentWithName:(NSString *)name andSex:(NSString *)sex andAge:(NSInteger)age andDeposit:(CGFloat)deposit andNum:(NSInteger)num andClasses:(NSString *)classes{
    Student *student = [[Student alloc]initWithName:name andSex:sex
                                             andAge:age andDeposit:deposit andNum:num andClasses:classes];
    return student;
}

-(void)study{
    NSLog(@"study");
}

@end
