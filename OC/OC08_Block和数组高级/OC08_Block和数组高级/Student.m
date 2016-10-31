//
//  Student.m
//  OC08_Block和数组高级
//
//  Created by dllo on 15/8/25.
//  Copyright (c) 2015年 蓝鸥科技. All rights reserved.
//

#import "Student.h"

@implementation Student

-(id)initWithName:(NSString *)name andAge:(NSInteger)age andScore:(CGFloat)score{
    self = [super init];
    if (self) {
        _name = name;
        _age =age;
        _score = score;
    }
    return self;
}

+(Student *)studentWithName:(NSString *)name andAge:(NSInteger)age andScore:(CGFloat)score{
    Student *student = [[Student alloc]initWithName:name andAge:age andScore:score];
    return student;
}


@end
