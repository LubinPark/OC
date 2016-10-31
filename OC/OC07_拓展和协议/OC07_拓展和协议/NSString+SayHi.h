//
//  NSString+SayHi.h
//  OC07_拓展和协议
//

#import <Foundation/Foundation.h>

@interface NSString (SayHi)
//@property(nonatomic,copy) NSString *name;

+(void)sayHi;

/**
 *  验证密码是否合理
 *
 *  @return YES 为密码合理 / NO 为密码不合理
 */
-(BOOL)passwordIsRight;

-(BOOL)passwordIsEmail;

@end
