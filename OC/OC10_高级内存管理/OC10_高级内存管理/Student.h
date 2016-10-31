//
//  Student.h
//  OC10_高级内存管理
//

#import <Foundation/Foundation.h>
#import "Mobile.h"

@interface Student : NSObject

@property (nonatomic, assign)NSString *name;

@property (nonatomic, copy)NSString *sex;

@property (nonatomic,retain)NSString *number;

-(id)initWithName:(NSString *)name andSex:(NSString *)sex andNumber:(NSString *)number;

+(Student *)studentWithName:(NSString *)name andSex:(NSString *)sex andNumber:(NSString *)number;

-(void)showMyPhone:(Mobile *)mobile;

@end
