//
//  Customer.h
//  UI17_AFNetworking二次封装
//
//  Created by 芦彬 on 15/9/21.
//  Copyright (c) 2015年 芦彬. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Customer : NSObject

@property (nonatomic, copy)NSString *title;

@property (nonatomic, copy)NSString *image;

@property (nonatomic, copy)NSString *address;

@property (nonatomic, copy)NSString *content;

- (instancetype)initWithDictionary:(NSDictionary *)dic;

+ (Customer *)customerWithDictionary:(NSDictionary *)dictionary;

@end
