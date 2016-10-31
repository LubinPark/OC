//
//  main.m
//  OC06_字典
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        //以多个键值对初始化一个不可变字典
        //字典里存储键值对,是无序的,只能通过key存取元素
//        NSNumber *age = [NSNumber numberWithInt:18];
//        NSDictionary *dictionary = [[NSDictionary  alloc] initWithObjectsAndKeys:
//        @"张三", @"name", @"男", @"sex", age, @"age", nil];
        
        //获取name的值
//        NSString *str = [dictionary objectForKey:@"name"];
//        NSLog(@"%@",str);
  
        //获取sex的值
//        NSString *str2 = [dictionary objectForKey:@"sex"];
//        NSLog(@"%@",str2);
        
        //获取age的值 age是整形的,在上边定义了,所有需要转换
//        NSNumber *number = [dictionary objectForKey:@"age"];
//        NSLog(@"%@,%d",str,[number intValue]);
        
        //获取字典内所有的key
//      NSArray *array = [dictionary allKeys];
        
        //遍历字典内所有key值
//        for (int i = 0; i <array.count; i++) {
//          NSLog(@"%@",[array objectAtIndex:i]);
//        }
        
        //遍历字典内所有的value值
//        for (int i  = 0; i <array.count; i++) {
//          NSLog(@"%@",[dictionary objectForKey:array[i]]);
//        }
        
        //获取字典内所有的Value, allValues
//        NSArray *array2 = [dictionary allValues];
//        for (int i = 0; i < array2.count; i++) {
//            NSLog(@"%@",[array2 objectAtIndex:i]);
//        }
        
        //可变字典NAMutableDictionary
//        NSMutableDictionary *dic = [NSMutableDictionary dictionaryWithObjectsAndKeys:
//          @"李四", @"name", @"女", @"sex", nil];
        
//        NSArray  *array3 = [dic allKeys];
        //通过key值遍历字典
//        for (int  i = 0; i < array3.count; i++) {
//            NSLog(@"%@",[dic objectForKey:array3[i]]);
//        }

        //为可变字典添加一堆key-value
//        setObject:forKey:中的key可以为任意类型对象,是NSMutableDictionary 提供的添加键值对的方法
//        setVlaue:forKey :中的key只能是字符串类型 ,在kvc中的方法
        
        //当为可变字典添加键值对时,如果key已经存在,覆盖已有的Value,如果key值不存在,那么添加当前键值对
        //注意:字典内,key值唯一
//        [dic setObject:@"18" forKey:@"age"];
//        [dic setValue:@"男" forKey:@"hobby"];
//        [dic setObject:@"25" forKey:@"age"];
//        NSDictionary *dictionary = [NSDictionary dictionaryWithObjectsAndKeys:@"蓝色",@"blue", @"红色" ,@"red", nil];

        //从另一个字典取出键值对,添加到当前可变字典中
//        [dic addEntriesFromDictionary:dictionary];

        //用另一个字典中所有的键值对,替换掉当前可变字典中的所有键值对. 用后面的键值对替换前面的键值对
//        [dic setDictionary:dictionary];

        //可变字典内键值对的移除操作  关键字:remove
//        [dic removeObjectForKey:@"sex"];

        //移除可变字典所有的键值对
//        [dic removeAllObjects];

//        NSArray *array = [dic allKeys];
        //通过key值遍历字典
//        for (int  i = 0; i < array.count; i++) {
//            NSLog(@"%@",array[i]);
//            NSLog(@"%@",[dic objectForKey:array[i]]);
//        }
        
//****************************集合类***************************
        
        //集合NSSet NSMutableSet
        //特点:集合内元素唯一:集合内元素无序排列,集合内存储的元素必须是对象类型.
        
        NSSet *set = [NSSet setWithObjects:@"1", @"小王", @"蓝色", nil];

//        for (NSString *temp in set) {
//            NSLog(@"%@",temp);
//        }

        NSArray *array = [[NSArray alloc]initWithObjects:@"小张", @"小王", @"小李", @"小刘", nil];
  
//        for (NSString *str in array) {
//            NSLog(@"%@",str);
//        }
//        NSLog(@"\n");
        
//        NSDictionary *dic = [[NSDictionary alloc]initWithObjectsAndKeys:@"小张",@"name",@"男",@"sex",@"18",@"age", nil];
//        for (NSString *temp in [dic allValues]) {
//            NSLog(@"%@",temp);
//        }
//        NSLog(@"\n");
        
        
//        int a[] = {11, 233, 32, 4, 66, 12, 8, 3, 9, 10};
//
//        for (int i = 0 ; i < 9; i++) {
//            for (int j = 0; j < 10 - i - 1; j++) {
//                if (a[j] > a[j + 1]) {
//                    int temp = a[j];
//                    a[j] = a[j + 1];
//                    a[j + 1] = temp;
//                }
//            }
//        }

//        for (int i = 0; i < 10; i ++) {
//            NSLog(@"%d",a[i]);
//        }
        
//        NSMutableArray  *array1 = [NSMutableArray arrayWithObjects:@"1", @"9", @"5", @"3", @"8", @"7", nil];
//        for (int i = 0; i < [array1 count] - 1; i++) {
//            for (int j = 0; j < [array1 count] - i - 1; j++) {
//                if ([array1[j] compare:array1[j + 1]] == 1) {
//                    [array1 exchangeObjectAtIndex:j withObjectAtIndex:j + 1];
//                }
//            }
//        }
        
//        for (NSString *str in array1) {
//            NSLog(@"%@",str);
//        }
        
//        NSMutableArray *a = [NSMutableArray arrayWithObjects:@"2",@"8",@"4",@"3",@"", nil];
//        for (int i = 0; i < a.count - 1; i++) {
//            for (int j = 0; j < a.count - i - 1; j++) {
//                if ([a[j] compare:a[j + 1]]== 1)  {
//                    [a exchangeObjectAtIndex:j withObjectAtIndex:j + 1];
//                }
//            }
//        }
        
//        for (NSString *str in a) {
//            NSLog(@"%@",str);
//        }
        
        //数组升序排列  关键字:sort
//        NSMutableArray  *array2 = [NSMutableArray arrayWithObjects:@"1", @"2", @"5", @"3", @"9", @"7", nil];
//        [array2 sortUsingSelector:@selector(compare:)];
        
//        for (NSString *str in array2) {
//            NSLog(@"%@",str);
//        }
        
    }
    return 0;
}
