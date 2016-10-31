//
//  Student.h
//  OC04_属性
//

#import "Person.h"
#import "Teacher.h"

@interface Student : Person
@property(nonatomic,assign) NSInteger num;
@property(nonatomic,copy) NSString *classes;
@property(nonatomic,retain) Teacher *teacher;

- (id)initWithName:(NSString *)name andSex:(NSString *)sex andAge:(NSInteger)age andDeposit:(CGFloat)deposit  andNum:(NSInteger)num andClasses:(NSString *)classes;

+(Student *)studentWithName:(NSString *)name andSex:(NSString *)sex andAge:(NSInteger)age andDeposit:(CGFloat)deposit  andNum:(NSInteger)num andClasses:(NSString *)classes;

-(void)study;

@end
