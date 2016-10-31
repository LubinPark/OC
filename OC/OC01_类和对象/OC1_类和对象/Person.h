//
//  Person.h
//  OC1_类和对象
//

#import <Foundation/Foundation.h>

//接口文件(也叫头文件)
//作用:对外界声明行为和特征,如果该类的行为和特征未在该文件中声明,外界无法访问

@interface Person : NSObject
{
@public               //公共的
    //实例变量(该类具有的共同特征)
    //成员变量
    NSString *_name;    //姓名
    NSString *_sex;     //性别
    NSString *_hobby;   //爱好
    int      _age;      //年龄
}
#pragma mark 初始化方法
-(id)init;

//共同的行为

#pragma mark 打招呼
- (void)sayHi;

#pragma mark 吃饭

- (void)eat;

@end

//定义一个新的类:animal
@interface Animal : NSObject
{
    @public
    NSString *_name;
    NSString *_kind;
    NSString *_sex;
    NSString *_food;
}

-(void)run;
-(void)speak;
@end


@interface Food : NSObject
{
    NSString *_name;
    NSString *_price;
    NSString *_size;
}
-(void)eat;
-(void)make;
@end
