//
//  main.m
//  OC07_NSDate
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        //NSDate (用来控制时间,日期和时区的类)
        //直接获取的是 格林尼治时间 0时区时间
        NSDate *nowDate = [NSDate date];
        NSLog(@"格林尼治时间%@",nowDate);
        
        //获取当前时区的时间
        NSTimeZone *zone = [NSTimeZone systemTimeZone];
        NSLog(@"当前区:%@",zone);
        
        //北京时间所在时区是东8区
        NSInteger seconds = [zone secondsFromGMT];
        NSLog(@"北京与0时区的差:%lds", seconds);
        
        //创建一个明天的当前时间
        NSDate *tomorrowDate = [[NSDate alloc]initWithTimeIntervalSinceNow:24 * 60 * 60];
        NSLog(@"明天:%@",tomorrowDate);
        
        //创建一个昨天的当前时间
        NSDate *yestdayDate = [[NSDate alloc] initWithTimeIntervalSinceNow:- 24 * 60 * 60];
        NSLog(@"昨天:%@",yestdayDate);
        
        NSTimeInterval timeIntercal = [yestdayDate timeIntervalSinceNow];
        NSLog(@"昨天和今天相隔了%f",timeIntercal);
        
        //如何获取时间间隔,关键字:timeIntercal
        NSTimeInterval timeIntercal1 = [yestdayDate timeIntervalSinceDate:tomorrowDate];
        NSLog(@"昨天和明天相隔了%f",timeIntercal1);
        
       //NSDateFormatter 日期格式
        /**
            y: year
            M: month
            d: day
            H: hour
            m: minute
            s: second
         */
        
        //初始化一个时间格式
        NSDateFormatter *formatter = [[NSDateFormatter alloc]init];
        
        //设置格式
        [formatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    
        //通过strFromDate可以直接转换成当前时区时间
        NSString *strDate = [formatter stringFromDate:nowDate];
        NSLog(@"现在时间是:%@",strDate);
        
        //把字符串转换成时间
        NSString *string = @"2015-08-24 09:00:00";
        
        //将字符串时间转换成NSDate类型
        //转换后是0时区的时间
        NSDate *dateStr =[formatter dateFromString:string];
        NSLog(@"%@", dateStr);
        
        //timeInterval 计算时间间隔 timeIntervalSinceNow是当前时间
        NSTimeInterval time = [dateStr timeIntervalSinceNow];
        NSLog(@"string距离现在%f",-time);
        
        //练习
        NSString *str = @"2015-08-24 12:15:00";
        NSDate *dateStr1 = [formatter dateFromString:str];
        NSTimeInterval now = [dateStr1 timeIntervalSinceNow];
        
        if (-now < 60 ) {
            NSLog(@"刚刚");
        }else if (-now >60 &&-now <3600){
            NSLog(@"%.1f分钟", -now / 60);
        }else if(-now > 3600){
            NSLog(@"%.1f小时前",-now / 60 /60);
        }
    }
    return 0;
}
