//
//  Single.m
//  UILast_消息中心
//
//  Created by 芦彬 on 15/9/30.
//  Copyright (c) 2015年 芦彬. All rights reserved.
//

#import "Single.h"

@implementation Single

+(Single *)shareSingle{
    static Single *single = nil;
    @synchronized (self){
        if (single == nil) {
            single = [[Single alloc]init];
        }
    }
    return single;
}

@end
