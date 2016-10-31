//
//  Teacher.h
//  OC09_内存管理初级
//

#import <Foundation/Foundation.h>
@class Student;
@interface Teacher : NSObject

@property (nonatomic ,retain) Student* student;

-(id)initWithSutudent:(Student *)student;

@end
