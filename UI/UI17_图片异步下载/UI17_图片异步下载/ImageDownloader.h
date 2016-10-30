//
//  ImageDownloader.h
//  UI17_图片异步下载
//
//  Created by 芦彬 on 15/9/21.
//  Copyright (c) 2015年 芦彬. All rights reserved.
//

#import <Foundation/Foundation.h>
//没有UIImage引入UIKit
//所有控件类都在UIKit框架中,数据类在Foundation框架中
#import <UIKit/UIKit.h>

#pragma mark 代理传值第一步：声明代理
@protocol ImageDownloaderDelegate <NSObject>

- (void)sendImageToFond:(UIImage *)image;

@end

#pragma MARK 使用block传值：第一步：声明一个block
typedef void (^ImageDownloaderBlock)(UIImage *iamge);

@interface ImageDownloader : NSObject
/**
 *  用来接收外界传进来的图片地址
 */
@property(nonatomic, retain)NSString *urlString;

@property(nonatomic, copy)ImageDownloaderBlock block;
/**
 *  使用代理将网络请求的数据，返回到前一个代理中
 */
@property(nonatomic, assign)id<ImageDownloaderDelegate>delegate;

#pragma mark  使用代理传值
-(instancetype)initWithUrl:(NSString *)urlString andDelegate:(id<ImageDownloaderDelegate>)myDelegate;

#pragma mark  使用block传值
- (instancetype)initWithUrl:(NSString *)urlString andBlock:(ImageDownloaderBlock)myBlock;

@end
