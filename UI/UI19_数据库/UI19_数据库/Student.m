//
//  Student.m
//  UI19_数据库
//
//  Created by 芦彬 on 15/9/23.
//  Copyright (c) 2015年 芦彬. All rights reserved.
//

#import "Student.h"

@implementation Student

- (instancetype)initWithNumber:(NSInteger )number andName:(NSString *)name andHobby:(NSString *)hobby{
    self = [super init];
    if (self) {
        _number = number;
        _name = name;
        _hobby = hobby;
    }
    return self;
}

+(Student *)studentWithNumber:(NSInteger)number andName:(NSString *)name andHobby:(NSString *)hobby{
    Student *student = [[Student alloc]initWithNumber:number andName:name andHobby:hobby];
    return [student autorelease];
}

@end
