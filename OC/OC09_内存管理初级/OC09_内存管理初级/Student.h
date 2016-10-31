//
//  Student.h
//  OC09_内存管理初级
//

#import <Foundation/Foundation.h>

@interface Student : NSObject<NSCopying>

@property(nonatomic, copy) NSString *name;

@property(nonatomic, assign) NSInteger age;

-(id)initWithName:(NSString *)name andAge:(NSInteger)age;

+(Student *)studentWithName:(NSString *)name andAge:(NSInteger)age;

@end
