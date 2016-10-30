//
//  Contact.h
//  UI10_UITableViewEditing
//

#import <Foundation/Foundation.h>

@interface Contact : NSObject

@property(nonatomic, copy)NSString *name;

@property(nonatomic, copy)NSString *phoneNumber;

-(id)initWithName:(NSString *)name andPhoneNumber:(NSString *)phoneNumber;

+(Contact *)contactWithName:(NSString *)name andPhoneNumber:(NSString *)phoneNumber;

@end
