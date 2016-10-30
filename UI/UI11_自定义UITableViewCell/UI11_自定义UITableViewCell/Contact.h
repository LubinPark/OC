//
//  Contact.h
//  UI11_自定义UITableViewCell
//

#import <Foundation/Foundation.h>

@interface Contact : NSObject

@property (nonatomic, copy) NSString *name;

@property (nonatomic, copy) NSString *gender;

@property (nonatomic, copy) NSString *age;

@property (nonatomic, copy) NSString *phoneNumber;

@property (nonatomic, copy) NSString *hobby;

@property (nonatomic, copy) NSString *picture;

-(instancetype)initWithDictionary:(NSDictionary *)dic;

+(Contact *)contactWithDictionary:(NSDictionary *)dictionary;

@end
