//
//  main.m
//  OC1_类和对象
//

#import <Foundation/Foundation.h>
#import "Person.h"
int main(int argc, const char * argv[]) {
    @autoreleasepool {
        //给person类实例一个对象, 第一步,为对象开辟内存空间(alloc)
        Person *person = [Person alloc];
        
        //为对象初始化
        person = [person init];
        
        //通常实例一个对象,这么写
        //Person *girlFriend =[[Person alloc] init];
        
        //person->_name = @"李狗蛋";
        //person->_age = 10;
        //person->_hobby = @"吃饭,睡觉,打豆豆";
        
        //调用对象方法:[]
        //[person sayHi];
        
        Animal * animal = [[Animal alloc] init];
        animal->_name = @"狗熊";
        animal->_kind = @"犬科";
        animal->_sex = @"雌性";
        animal->_food =@"鱼";
        
        NSLog(@"%@,%@,%@,%@",animal->_name,animal->_kind,animal->_sex,animal->_food);
        [animal run];
    }
    return 0;
}
