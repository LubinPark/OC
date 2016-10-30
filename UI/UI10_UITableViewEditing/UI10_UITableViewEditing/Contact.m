//
//  Contact.m
//  UI10_UITableViewEditing
//

#import "Contact.h"

@implementation Contact

-(id)initWithName:(NSString *)name andPhoneNumber:(NSString *)phoneNumber{
    self = [super init];
    if (self) {
        _name = name;
        _phoneNumber = phoneNumber;
    }
    return self;
}

+(Contact *)contactWithName:(NSString *)name andPhoneNumber:(NSString *)phoneNumber{
    Contact *contact = [[Contact alloc]initWithName:name andPhoneNumber:phoneNumber];
    return contact;
}

@end
