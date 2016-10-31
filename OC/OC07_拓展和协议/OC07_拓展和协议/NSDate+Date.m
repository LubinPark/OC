//
//  NSDate+Date.m
//  OC07_拓展和协议
//

#import "NSDate+Date.h"
#import "NSString+SayHi.h"
#import "NSDate+Date.h"
@implementation NSDate (Date)

+(NSDate *)dateWithDateString:(NSString *)dateString{
    NSDateFormatter *formatter = [[NSDateFormatter alloc]init];
    [formatter setDateFormat:@"yyyyMMddHHmmss"];
    NSDate *date = [formatter dateFromString:dateString];
    return date;
}
@end
