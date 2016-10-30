//
//  Person.m
//  UI18_复杂对象的读写
//
//  Created by 芦彬 on 15/9/22.
//  Copyright (c) 2015年 芦彬. All rights reserved.
//

#import "Person.h"

@implementation Person

#pragma mark 将复杂对象进行归档操作,相当于告诉当前文件系统,以什么样的格式进行存储

- (void)encodeWithCoder:(NSCoder *)aCoder{
    [aCoder encodeObject:self.name forKey:@"name"];
    [aCoder encodeObject:self.hobby forKey:@"hobby"];
    [aCoder encodeObject:self.age forKey:@"age"];
}

#pragma mark 将复杂对象进行反归档操作,即归档对象的读取过程
- (instancetype)initWithCoder:(NSCoder *)aDecoder{
    self = [super init];
    if (self) {
        self.name = [aDecoder decodeObjectForKey:@"name"];
        self.hobby = [aDecoder decodeObjectForKey:@"hobby"];
        self.age = [aDecoder decodeObjectForKey:@"age"];
    }
    return self;
}

@end
