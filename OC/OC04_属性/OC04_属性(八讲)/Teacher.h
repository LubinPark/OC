//
//  Teacher.h
//  OC04_属性
//
#import "Person.h"

@interface Teacher : NSObject
//定义一个只读属性
//@property(readonly)NSString *sex;

//控制读写属性:readonly 和 readwrite(默认生成)
//只读属性,系统只为我们生成getter方法
//我们重写属性的setter和getter的时候,需要重新成膜实例变量,这个时候需要@synthesize 属性名 = _属性名

//属性的原子性操作控制:atomic , nonatomic
//atomic 保证属性的原子性操作,在多线程下是安全的. 缺点:系统消耗大,系统默认使用.
//nonatomic 非原子操作,不能保证多线程安全.无多余的系统消耗,自定义时默认使用.
@property (nonatomic) NSString *name;

//属性的语义控制: assign, ratain, copy.
//assign: 通常只在设置基本数据类型时使用,例如:NSInteger, CGFloat.
//retain:通常是在设置对象类型时使用.
//copy:通常设置NSString类型时使用.
//@property(nonatomic,assign) NSInteger age;
//@property(nonatomic,copy) NSString *number;
//@property(nonatomic,retain) Person *person;

@property(nonatomic,copy)NSString *sex;
@property(nonatomic,assign) NSInteger age;
@property(nonatomic,assign) NSInteger number;

-(id)initWithSex:(NSString *)sex andName:(NSString *)name andAge:(NSInteger)age andNumber:(NSInteger)number;

+(Teacher *)teacherWithSex:(NSString *)sex andName:(NSString *)name andAge:(NSInteger)age andNumber:(NSInteger)number;

@end
