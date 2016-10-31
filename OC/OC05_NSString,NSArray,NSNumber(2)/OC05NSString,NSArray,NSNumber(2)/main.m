//
//  main.m
//  OC05NSString,NSArray,NSNumber(2)
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        //用多个对象来初始化一个数组
        NSArray *array = [NSArray arrayWithObjects:@"小张" ,@"小王", @"小李", @"小狗" ,nil];
        
        //NSArray 有一个计算元素的个数属性 array.count 或者 [array count]
//        for (int i  = 0; i < [array count]; i++) {
//            NSLog(@"%@",array[i]);
//        }
        
        //oc里面如何访问某个元素[array objectAtIndex:index]
        //和C语言习惯用法等价 array[index]
//        NSString *str = [array objectAtIndex:2];
//        NSLog(@"%@",str);
        
        //根据数组内对象,返回对象下标
//        NSInteger a = [array indexOfObject:@"小王"];
//        NSLog(@"%ld",a);
        
        //小王之前的人
//        for (int  i = 0; i < [array indexOfObject:@"小王"]; i++) {
//            NSLog(@"%@",array[i]);
//        }
        
//        if ([array indexOfObject:@"小刘"] == NSNotFound) {
//            NSLog(@"没找到");
//        }
        
        
        //创建可变数组NSMutableArray ,以 已存在的array进行初始化
        NSMutableArray *mulArray = [NSMutableArray arrayWithArray:array];
        
        //遍历可变数组NSMutableArray
//        for (int i = 0; i < mulArray.count; i++) {
//            NSLog(@"%@",[mulArray objectAtIndex:i]);
//        }
        
        //添加一个元素  关键字:add
//        [mulArray addObject:@"小猫"];
//        for (NSString *str in mulArray) {
//            NSLog(@"%@",str);
//        }
        
        //添加多个元素(来自一个数组)
//        [mulArray addObjectsFromArray:array];
//        for (NSString *str in mulArray) {
//            NSLog(@"%@",str);
//        }
        
        //遍历可变数组NSMutableArray
//        for (int i = 0; i < mulArray.count; i++) {
//            NSLog(@"%@",[mulArray objectAtIndex:i]);
//        }
        
        //插入某个元素在数组中特定的位置(index) 关键字:insert
        //[mulArray insertObject:@"小鸡" atIndex:2];
        
        //移除数组内元素关键字:remove
        //删除指定元素
        //[mulArray removeObject:@"小鸡"];
        
        //移除指定下标内元素
        //[mulArray removeObjectAtIndex:2];
        
        //移除数组内所有元素
        //[mulArray removeAllObjects];
        
        //替换数组内元素 关键字:replace
        //[mulArray replaceObjectAtIndex:2 withObject:@"金三胖"];
        
        //交换指定位置的两个元素 关键字exchange
        //[mulArray exchangeObjectAtIndex:0 withObjectAtIndex:mulArray.count -1];
        
        //遍历可变数组NSMutableArray
//        for (int i = 0; i < mulArray.count; i++) {
//            NSLog(@"%@",[mulArray objectAtIndex:i]);
//        }
        
        NSMutableArray *array1 = [NSMutableArray array];

        //值对象NSNumber
        //值转换为NSNumber 对象时,方法名numberWith+值得类型名
        //NSNumber 转换值得时候,方法名:值得类型+Value
        NSNumber *number = [NSNumber numberWithInt:12];

        [array1 addObject:number];
        NSLog(@"%@",array1);
        
        //把number转换成整型 intValue
        int a = [[array1 objectAtIndex:0] intValue];
        NSLog(@"%d",a);
    }
    return 0;
}
