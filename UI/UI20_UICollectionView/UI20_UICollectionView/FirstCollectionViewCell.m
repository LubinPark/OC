//
//  FirstCollectionViewCell.m
//  UI20_UICollectionView
//
//  Created by 芦彬 on 15/9/24.
//  Copyright (c) 2015年 芦彬. All rights reserved.
//

#import "FirstCollectionViewCell.h"

#import "SDWebImageManager.h"
#import "UIImageView+WebCache.h"

@interface FirstCollectionViewCell ()

@property (nonatomic,retain)UIImageView *picture;

@property (nonatomic,retain)UILabel *label;

@end

@implementation FirstCollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame{
    self= [super initWithFrame:frame];
    if (self) {
        _picture = [[UIImageView alloc]init];
        _picture.backgroundColor = [UIColor redColor];
        [self.contentView addSubview:_picture];
        
        _label = [[UILabel alloc]init];
        _label.backgroundColor = [UIColor orangeColor];
        [self.contentView addSubview:_label];
    }
    return self;
}

- (void)layoutSubviews{
#pragma mark 一定要实现父类的layoutSubviews
    [super layoutSubviews];
    self.picture.frame = CGRectMake(0, 0, self.frame.size.width, self.frame.size.height);
    self.label.frame = CGRectMake(0, self.frame.size.height - 30, self.frame.size.width, 30);
}

- (void)setPictureURL:(NSString *)pictureURL{
    [self.picture sd_setImageWithURL:[NSURL URLWithString:pictureURL ] placeholderImage:[UIImage imageNamed:@"331.jpg"]];
}

- (void)setCurrentSection:(NSString *)currentSection{
    self.label.text = currentSection;
}



@end
