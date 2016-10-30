//
//  CustomerNetworking.h
//  UI17_AFNetworking二次封装
//
//  Created by 芦彬 on 15/9/21.
//  Copyright (c) 2015年 芦彬. All rights reserved.
//

#import <Foundation/Foundation.h>

// 声明Block(负责将请求回来的数据传回VC中)
typedef void (^ConnectionBlock)(id response);

@interface CustomerNetworking : NSObject

@property (nonatomic, copy) ConnectionBlock block;

//- (void)connectWithURL:(NSString *)url
//         andParameters:(NSDictionary *)parameters
//              andBlock:(ConnectionBlock)block;
/**
 *  基于AFNetworkding网络请求
 *
 *  @param url        链接地址
 *  @param parameters 连接参数
 *  @param block      网络请求成功回调
 */
+ (void)customerConnectWithURL:(NSString *)url
                 andParameters:(NSDictionary *)parameters
                      andBlock:(ConnectionBlock)block;

@end
