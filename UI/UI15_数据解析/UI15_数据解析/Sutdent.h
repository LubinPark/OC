//
//  Sutdent.h
//  UI15_数据解析
//

#import <Foundation/Foundation.h>

@interface Sutdent : NSObject
/**
 *  编号
 */
@property (nonatomic,copy) NSString *number;
/**
 *  姓名
 */
@property (nonatomic,copy)NSString *name;
/**
 *  时间
 */
@property (nonatomic,copy)NSString *time;
/**
 *  地点
 */
@property (nonatomic,copy)NSString *address;

@end
