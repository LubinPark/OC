//
//  Person.h
//  OC02_实例变量的可见度和方法
//

#import <Foundation/Foundation.h>

@interface Person : NSObject
{
    @public
    NSString     *_name;     //姓名
    NSString      *_sex;     //性别
    
    @protected
    NSInteger      _age;     //年龄
    NSString    *_hobby;     //爱好
    
    @private
    NSString *_speHobby;     //癖好
}

#pragma mark 定义一个Person类的初始化方法
-(id)initWithName:(NSString *)name andSex:(NSString *)sex;

//对象方法
-(void)sayHi;

//类方法
+(void)sayHello;

#pragma mark 写一个读取受保护的成员变量的内容

#pragma mark age的访问方法
-(NSInteger)age;
#pragma mark hobby的访问方法
-(NSString *)hobby;
#pragma mark speHobby的访问方法
-(NSString *)speHobby;

#pragma mark age 的赋值方法
-(void)setAge:(NSInteger)age;
#pragma mark hobby 的赋值方法
-(void)setHobby:(NSString *)hobby;
#pragma mark speHobby的赋值方法
-(void)setSpeHobby:(NSString *)speHobby;


@end
