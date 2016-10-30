//
//  Contact.m
//  UI11_自定义UITableViewCell
//

#import "Contact.h"

@implementation Contact

-(id)initWithDictionary:(NSDictionary *) dic{
    self = [super init];
    if (self) {
        [self setValuesForKeysWithDictionary:dic];
    }
    return self;
}

+(Contact *)contactWithDictionary:(NSDictionary *)dictionary{
    Contact *contact = [[Contact alloc]initWithDictionary:dictionary];
    return [contact autorelease];
}

//KVC容错方法比如:
-(void)setValue:(id)value forUndefinedKey:(NSString *)key{
    
}

@end
