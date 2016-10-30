//
//  ImageDownloader.m
//  UI17_图片异步下载
//
//  Created by 芦彬 on 15/9/21.
//  Copyright (c) 2015年 芦彬. All rights reserved.
//

#import "ImageDownloader.h"

@implementation ImageDownloader

- (void)dealloc{
    [_urlString release];
    [_delegate release];
    Block_release(_block);
    [super dealloc];
}

-(instancetype)initWithUrl:(NSString *)urlString andDelegate:(id<ImageDownloaderDelegate>)myDelegate{
    self = [super init];
    if (self) {
        self.urlString = urlString;
        self.delegate = myDelegate;
        [self ImageDownloding];
        //开始图片异步下载
    }
    return self;
}

// 图片异步下载的实现
- (void)ImageDownloding{
    //将urlString 转换成 NSURL对象
    NSURL *url = [NSURL URLWithString:self.urlString];
    //创建请求对象
    NSURLRequest *request = [[NSURLRequest alloc]initWithURL:url];
    //建立异步请求对象
    [NSURLConnection sendAsynchronousRequest:request queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
        //建立保护，如果请求成功，使用代理返回image对象，如果失败，返回错误信息
        if (self.delegate != nil) {
            //代理传值
            if (connectionError == nil) {
                UIImage *image = [UIImage imageWithData:data];
                [self.delegate sendImageToFond:image];
            }
            else{
                NSLog(@"%@",connectionError);
            }
        }
        else{
            //block传值
            if (connectionError == nil) {
                UIImage *image = [UIImage imageWithData:data];
                self.block(image);
            }
            else{
                NSLog(@"%@",connectionError);
            }
        }
    }];
}

#pragma mark Block形式的初始化方法
-(instancetype)initWithUrl:(NSString *)urlString andBlock:(ImageDownloaderBlock)myBlock{
    self = [super init];
    if (self) {
        self.urlString = urlString;
        self.block = myBlock;
        [self ImageDownloding];
    }
    return self;
}

@end
