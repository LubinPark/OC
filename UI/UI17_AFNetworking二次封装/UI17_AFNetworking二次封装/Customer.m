//
//  Customer.m
//  UI17_AFNetworking二次封装
//
//  Created by 芦彬 on 15/9/21.
//  Copyright (c) 2015年 芦彬. All rights reserved.
//

#import "Customer.h"

@implementation Customer

- (instancetype)initWithDictionary:(NSDictionary *)dic{
    self = [super init];
    if (self) {
        [self setValuesForKeysWithDictionary:dic];
    }
    return self;
}

+(Customer *)customerWithDictionary:(NSDictionary *)dictionary{
    Customer *customer = [[Customer alloc]initWithDictionary:dictionary];
    return [customer autorelease];
}

- (void)setValue:(id)value forUndefinedKey:(NSString *)key{
    
}

@end
