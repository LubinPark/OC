//
//  Student.h
//  UI19_数据库
//
//  Created by 芦彬 on 15/9/23.
//  Copyright (c) 2015年 芦彬. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Student : NSObject

@property (nonatomic, assign)NSInteger number;

@property (nonatomic,copy)NSString *name;

@property (nonatomic,copy)NSString *hobby;

- (instancetype)initWithNumber:(NSInteger)number andName:(NSString *)name andHobby:(NSString *)hobby;

+ (Student *)studentWithNumber:(NSInteger)number andName:(NSString *)name andHobby:(NSString *)hobby;

@end
