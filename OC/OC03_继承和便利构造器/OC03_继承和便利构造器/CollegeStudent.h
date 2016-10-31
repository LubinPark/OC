//
//  CollegeStudent.h
//  OC03_继承和便利构造器
//

#import "Student.h"

@interface CollegeStudent : Student
{
    NSString *_major;
    NSString *_academy;
}
-(id)initWithMajor:(NSString *)major andAcademy:(NSString *)academy;

-(NSString *)major;
-(void)setMajor:(NSString *)major;

-(NSString *)academy;
-(void)setAcademy:(NSString *)academy;

@end
