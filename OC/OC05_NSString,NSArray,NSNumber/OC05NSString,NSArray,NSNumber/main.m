//
//  main.m
//  OC05NSString,NSArray,NSNumber
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
       
        //创建一个字符串
        NSString *string = @"今天抽奖";

        //对象类型的创建,本质上都需要分配内存,初始化两部分.
        
//        NSString *string2 = [[NSString alloc]init];
//        string2 = string;
//        NSString *string3 = [[NSString alloc]initWithString:string2];
//        NSLog(@"string3--%@",string3);

        //字符串的万能初始化方法(**********)
        //Format 格式 最主要的作用进行字符串拼接.
        
//        NSString *str = [NSString stringWithFormat:@"%@", string3];
//        NSLog(@"str%@",str);
        
//        NSString *str2 = @"一定抽个Air回来";
//        NSString *str3 =[NSString stringWithFormat:@"%@ ,%@",string,str2];
//        NSLog(@"%@",str3);
        
//        NSInteger number = 45;
//        NSString *str4 = [NSString stringWithFormat:@"%@,抽到的同学带%ld 跟雪糕回来!",str3,number];
//        NSLog(@"%@",str4);

//        CGFloat num = 1000000.123;
//        NSString *str11 = [NSString stringWithFormat:@"%@%.2f",string,num];
//        NSLog(@"%@",str11);
//        
//        NSString *str5 = [[NSString alloc]initWithFormat:@"%@我们要%.2f一根的.", str4 ,2.5];
//        NSLog(@"%@",str5);
//        NSLog(@"%lu",[str5 length]);
        
        //字符串获取子字符串的方法,通过索引index
        //从5到最后
//        NSString *str6 = [str5 substringFromIndex:4];
//        NSLog(@"%@",str6);

//        //从第一个到3
//        NSString *str7 = [str5 substringToIndex:3];
//        NSLog(@"%@",str7);

        //NSMakeRange是结构体,包含:location,length.
        //在创建的时候使用NSMakeRange()
//        NSRange range = NSMakeRange(2, 4); //下标位2开始长度为4
//        NSString *str8 = [str5 substringWithRange:range];
//        NSLog(@"%@",str8);

       //字符串的替换
        NSString *str5  = @"123";
        NSString *str9 = [str5 stringByReplacingOccurrencesOfString:@"抽到的同学" withString:@"刘明池"];
        NSLog(@"%@",str9);
        
        //字符串拼接
//        NSString *str11 = @"年底继续!";
        
        //string是有初值的
//        NSString *str10 = [string stringByAppendingFormat:@",%@",str11];
//        NSLog(@"%@",str10);
        
        //自带初始化
//        NSString *str12 = [NSString stringWithFormat:@"%@,%@",string ,str11 ];
//        NSLog(@"%@",str12);
        
        //一次拼接1个
//       NSString *str13 = [string stringByAppendingString:str11];
//       NSLog(@"%@",str13);
        
//       NSString *str13 = @"今天不抽奖";
        //判断字符串相等.用isEqual,不用 ==
//        if([string  isEqual: @"今天抽奖"]){
//            NSLog(@"一样");
//        }else{
//            NSLog(@"不一样");
//        }
        
        //字符串比较大小用compare ,返回值是一个枚举类型(-1, 0 ,1) 比较的规律:从两个字符串的左边开始比较,出现第一个不同的进行大小比较(在Unicode表中的位置先后)
        
//        if ([string compare:str13] == -1) {
//            NSLog(@"string 小于 str13");
//        }else if ([string compare:str13] == 0){
//            NSLog(@"string 和 str13相等");
//        }else if ([string compare:str13] == 1){
//            NSLog(@"string 大于 str13");
//        }
        
//        判断一个字符串以某个为开头的(hasPrefix),结尾(hasSuffix),返回类型为BOOL
//        if ([str15 hasPrefix:@"刘"]) {
//            NSLog(@"姓刘的帅");
//        }else{
//            NSLog(@"其他的更帅");
//        }
//        
//        NSString *stra = [NSString stringWithFormat:@"tupian.png"];
//        BOOL isSuffix = [stra hasSuffix:@"png"];
//        if (isSuffix == 1) {
//            NSLog(@"该字符串名是以png结尾.");
//            NSString *str1 = [stra stringByReplacingOccurrencesOfString:@"png" withString:@"jpg"];
//            NSLog(@"替换后的字符串为:%@",str1);
//        }else{
//            NSLog(@"该字符串不是以png结尾");
//            NSString *str2 = [stra stringByAppendingString:@".jpg"];
//            NSLog(@"拼接后字符串为:%@",str2);
//        }
//
//        NSString *str =@"刘XX";
        
          // 可变字符串,初始化方法可以使用父类
//        NSMutableString *str2 = [NSMutableString stringWithString:str];
//        NSString *str3 = @"你等着";
        
          //可变字符串拼接
//        [str2 appendFormat:@",%@ ",str3];
//        [str2 appendString:@",咱们晚上见"];
//        NSLog(@"%@",str2);

//        [str2 deleteCharactersInRange:NSMakeRange(1, 3)];
//        NSLog(@"%@",str2);

        //插入在 xx之后加个'明池'
//        [str2 insertString:@"明池" atIndex:1];
//        NSLog(@"%@",str2);

        //替换
//        [str2 replaceCharactersInRange:NSMakeRange(0, 2) withString:@"刘123123123明"];
//        NSLog(@"%@",str2);
    }
    return 0;
}
