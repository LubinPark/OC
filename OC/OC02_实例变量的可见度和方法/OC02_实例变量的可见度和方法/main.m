//
//  main.m
//  OC02_实例变量的可见度和方法
//

#import <Foundation/Foundation.h>
#import "Person.h"
#import "AudiCar.h"
#import "MobilePhone.h"
#import "A.h"
#import "B.h"

@class Person;

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        /*
         实例变量的可见度:
         1.public(共有的):在相应类的内部和外部都可以访问和操作
         2.protected(受保护的,默认的):只有在当前类内部或者其子类内部访问
         3.private(私有的):只有在当前类内访问.
         */
        Person *yaoXu = [[Person alloc]init];
        
        yaoXu->_name = @"姚旭";
        yaoXu->_sex = @"unsure";
        
//        yaoXu->_age = 12;
//        yaoXu->_speHobby = @"吃喝嫖赌抽,坑蒙拐骗偷";
        
//        [yaoXu setAge:22];
//        [yaoXu setHobby:@"敲代码2"];
//        [yaoXu setSpeHobby:@"说快板"];
//        
//        NSLog(@"年龄:%ld,爱好:%@,嗜好:%@",[yaoXu age],[yaoXu hobby],[yaoXu speHobby]);
        
//        [Person sayHello];
//         Person *per = [[Person alloc]init];
//        [per sayHi];
        
        Person *person = [[Person alloc]initWithName:@"张三" andSex:@"男"];
        NSLog(@"%@,%@",person->_name,person->_sex);
    
        Person *person2 = [[Person alloc]initWithName:@"李四" andSex:@"女"];
        NSLog(@"%@,%@",person2->_name,person2->_sex);
        
        AudiCar *car1 = [[AudiCar alloc]initWithColor:@"红色" andPrice:300 andKind:@"s7" andProductArea:@"made in China"];
        NSLog(@"Audi%@,%ld,%@,%@",car1->_color,car1->_price,car1->_kind,car1->_productArea);
        
//        [car1 setColor:@"红色"];
//        [car1 setKind:@"s7"];
//        [car1 setPrice:300];
//        [car1 setProductArea:@"made in china"];
//        NSLog(@"颜色:%@, 类型:%@, 价格:%ld元, 生产地:%@",[car1 color],[car1 kind],[car1 price],[car1 productArea] );
//
//        MobilePhone *mp1 = [[MobilePhone alloc]init];
//        [mp1 setBrand:@"苹果"];
//        [mp1 setKind:@"电信"];
//        [mp1 setPirce:5888];
//        [mp1 setColor:@"金色"];
//        NSLog(@"商标:%@, 类型:%@, 价格%ld元, 颜色:%@",[mp1 brand],[mp1 kind],[mp1 price],[mp1 color]);
        
    }
    return 0;
}
