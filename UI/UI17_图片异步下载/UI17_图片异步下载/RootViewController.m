//
//  RootViewController.m
//  UI17_图片异步下载
//
//  Created by 芦彬 on 15/9/21.
//  Copyright (c) 2015年 芦彬. All rights reserved.
//

#import "RootViewController.h"
#import "ImageDownloader.h"

@interface RootViewController ()<ImageDownloaderDelegate>

@end

@implementation RootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.imageViews = [[UIImageView alloc]initWithFrame:CGRectMake(80, 100, 200, 150)];
    self.imageViews.backgroundColor = [UIColor orangeColor];
    [self.view addSubview:self.imageViews];
    [self.imageViews release];

    NSString *str = @"http://img4.duitang.com/uploads/item/201207/28/20120728105310_jvAjW.thumb.600_0.jpeg";

    //代理传值
//    [[ImageDownloader alloc]initWithUrl:str andDelegate:self];
    
    //block传值
    [[ImageDownloader alloc]initWithUrl:str andBlock:^(UIImage *iamge) {
        self.imageViews.image = iamge;
    }];
}

-(void)sendImageToFond:(UIImage *)image{
    self.imageViews.image = image;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
