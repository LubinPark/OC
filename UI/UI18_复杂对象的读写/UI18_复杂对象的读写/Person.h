//
//  Person.h
//  UI18_复杂对象的读写
//
//  Created by 芦彬 on 15/9/22.
//  Copyright (c) 2015年 芦彬. All rights reserved.
//

#import <Foundation/Foundation.h>

#warning mark 如果想将复杂对象写入文件中,首先要遵循协议
@interface Person : NSObject<NSCoding>

@property (nonatomic,copy)NSString *name;

@property (nonatomic,copy)NSString *hobby;

@property (nonatomic,assign)NSString *age;

@end
