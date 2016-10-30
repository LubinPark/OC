//
//  CustomerNetworking.m
//  UI17_AFNetworking二次封装
//
//  Created by 芦彬 on 15/9/21.
//  Copyright (c) 2015年 芦彬. All rights reserved.
//

#import "CustomerNetworking.h"
#import "AFNetworking.h"

@implementation CustomerNetworking

+ (void)customerConnectWithURL:(NSString *)url andParameters:(NSDictionary *)parameters  andBlock:(ConnectionBlock)block{
    CustomerNetworking *customer = [[CustomerNetworking alloc]init];
    [customer connectWithURL:url andParameters:parameters andBlock:block];
}

- (void)connectWithURL:(NSString *)url andParameters:(NSDictionary *)parameters andBlock:(ConnectionBlock)block{
    //开始网路请求
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json",@"text/json", @"text/plain", @"text/html", nil];

    //额外的header，根据具体的header添加，如果没有，不用加下面
    [manager.requestSerializer setValue:@"10101024" forHTTPHeaderField:@"App-Id"];
    [manager.requestSerializer setValue:@"c48b179c7daa2d3e759753d7afd810f6" forHTTPHeaderField:@"Device-Id"];
    [manager.requestSerializer setValue:@"aVBob25lIE9TXzkuMC4yXzY0MCoxMTM2XzEwMDAwMTAwMF9pUGhvbmU2LDI=" forHTTPHeaderField:@"Device-V"];
    
    manager.securityPolicy.allowInvalidCertificates = YES;

    //通过parameters是否为空,判断使用时GET or POST
    //如果parameters为空,即为GET请求,如果不为空,即为POST请求
    if (parameters == nil) {
        //get
        [manager GET:url parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
            block(responseObject);
        } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
            NSLog(@"%@",error);
        }];
    }
    else{
        //post
        [manager POST:url parameters:parameters success:^(AFHTTPRequestOperation *operation, id responseObject) {
            block(responseObject);
        } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
            NSLog(@"%@",error);
        }];
    }
        
  
}

@end
