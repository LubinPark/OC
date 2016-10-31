//
//  Student.h
//  OC08_Block和数组高级
//
//  Created by dllo on 15/8/25.
//  Copyright (c) 2015年 蓝鸥科技. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Student : NSObject
/**
 *  姓名
 */
@property (nonatomic, copy)NSString *name;
/**
 *  年龄
 */
@property (nonatomic, assign)NSInteger age;
/**
 *  分数
 */
@property (nonatomic, assign)CGFloat score;

-(id)initWithName:(NSString *)name andAge:(NSInteger)age andScore:(CGFloat)score;

+(Student *)studentWithName:(NSString *)name andAge:(NSInteger)age andScore:(CGFloat)score;

@end
