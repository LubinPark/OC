//
//  main.m
//  OC06_数组字典嵌套练习
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
       //创建3个学生,每个学生是一个字典
        NSMutableDictionary *stu1 = [NSMutableDictionary dictionaryWithObjectsAndKeys:
                                     @"张三", @"name", @"18", @"age", @"120121", @"number", @"男", @"sex", nil];
        NSMutableDictionary *stu2 = [NSMutableDictionary dictionaryWithObjectsAndKeys:
                                     @"李四", @"name", @"20", @"age", @"120122", @"number", @"男", @"sex", nil];
        NSMutableDictionary *stu3 = [NSMutableDictionary dictionaryWithObjectsAndKeys:
                                     @"王五", @"name", @"22", @"age", @"120123", @"number", @"女", @"sex", nil];
        NSMutableDictionary *stu4 = [NSMutableDictionary dictionaryWithObjectsAndKeys:
                                     @"赵六", @"name", @"21", @"age", @"120124", @"number", @"女", @"sex", nil];
        NSMutableDictionary *stu5 = [NSMutableDictionary dictionaryWithObjectsAndKeys:
                                     @"田七", @"name", @"23", @"age", @"120125", @"number", @"男", @"sex", nil];
        
        //创建一个班级数组,包含学生字典
        NSMutableArray *array = [NSMutableArray arrayWithObjects:stu1, stu2, stu3, stu4, stu5, nil];
        
        //打印班级内所有学生姓名
        for (NSMutableDictionary *dic in array) {
            NSLog(@"%@",[dic objectForKey:@"name"]);
        }
        
        NSMutableDictionary *stu6 = [NSMutableDictionary dictionaryWithObjectsAndKeys:
                                     @"小张", @"name", @"19", @"age", @"120126", @"number", @"女", @"sex", nil];
        NSMutableDictionary *stu7 = [NSMutableDictionary dictionaryWithObjectsAndKeys:
                                     @"小王", @"name", @"22", @"age", @"120127", @"number", @"女", @"sex", nil];
        NSMutableDictionary *stu8 = [NSMutableDictionary dictionaryWithObjectsAndKeys:
                                     @"小李", @"name", @"19", @"age", @"120128", @"number", @"男", @"sex", nil];
        
        NSArray *firstArray =   [NSArray arrayWithObjects:stu1, stu4,nil];
        
        NSArray *sencondArray = [NSArray arrayWithObjects:stu2, stu6, nil];
        
        NSArray *thirdArray =  [NSArray arrayWithObjects:stu3, stu7, stu8, nil];
        
        //给学生添加朋友
        [stu1 setObject:firstArray
                 forKey:@"friend"];
        [stu2 setObject:sencondArray
                 forKey:@"friend"];
        [stu3 setObject:thirdArray
                 forKey:@"friend"];
        
        for (NSMutableDictionary *dic in array) {
            for (NSMutableDictionary *temp in [dic objectForKey:@"friend"]) {
                NSLog(@"-%@",[temp objectForKey:@"name"]);
            }
             NSLog(@"=======");
        }
  
    }
    return 0;
}
