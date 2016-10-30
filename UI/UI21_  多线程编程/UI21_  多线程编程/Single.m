//
//  single.m
//  UI21_  多线程编程
//
//  Created by 芦彬 on 15/9/28.
//  Copyright (c) 2015年 chuxinyu123. All rights reserved.
//

#import "Single.h"

@implementation Single
+(Single *)shareSingle{
    static Single *single = nil;

    @synchronized(self){
    //如果当前=对象为空,那么创建
        if (single == nil) {
            single = [[Single alloc]init];
        }
    }
    return single;
}

@end
