//
//  Girl.h
//  OC07_拓展和协议
//

#import <Foundation/Foundation.h>

//1设置协议(起草合同)
//协议的命名规则:类名+Delegate
@protocol GirlDelegate <NSObject>

//如果不写@required ,那么默认的也是必须实现
@required   //遵循协议的对象必须区做的事
-(void)makeMoney;

@optional   //可选择的
-(void)cook;

@end

@interface Girl : NSObject

//2声明协议属性 (*****)声明时一定要写assgin 防止循环引用
@property(nonatomic, assign) id<GirlDelegate> delegate;

//3接到(请求)表白信息
-(void)receiveMarrayInformation;

@end
