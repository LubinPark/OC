//
//  NSString+SayHi.m
//  OC07_拓展和协议
//

#import "NSString+SayHi.h"

@implementation NSString (SayHi)

+(void)sayHi{
    NSLog(@"你好,恭喜你成功使用Category");
}

-(BOOL)passwordIsRight{
    if (self.length < 6) {
        NSLog(@"请输入6~10位密码");
        return  NO;
    }else if (self.length > 10){
        NSLog(@"请输入6~10为密码");
        return NO;
    }else if ([self containsString:@" "]){
        NSLog(@"输入密码不能有空格");
        return NO;
    }else if ([self containsString:@"#"]){
        NSLog(@"输入的密码不能包含不合法字符");
        return NO;
    }else{
        return YES;
    }
}

-(BOOL)passwordIsEmail{
    if ([self containsString:@"@"] && [self hasPrefix:@"com"]) {
        NSLog(@"不能是邮箱");
        return NO;
    }else{
        return YES;
    }
}









@end
