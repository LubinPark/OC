//
//  SecondTableViewCell.m
//  UI11_自定义UITableViewCell
//
//  Created by dllo on 15/9/11.
//  Copyright (c) 2015年 蓝鸥科技. All rights reserved.
//

#import "SecondTableViewCell.h"
#import "Contact.h"
@implementation SecondTableViewCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.backgroundColor = [UIColor groupTableViewBackgroundColor];
        //姓名
        self.nameLabel = [[UILabel alloc]init];
        self.nameLabel.backgroundColor = [UIColor whiteColor];
        [self.contentView addSubview:self.nameLabel];
        [self.nameLabel release];
        //性别
        self.genderLabel = [[UILabel alloc]init];
        self.genderLabel.backgroundColor = [UIColor whiteColor];
        [self.contentView addSubview:self.genderLabel];
        [self.genderLabel release];
        //年龄
        self.ageLabel = [[UILabel alloc]init];
        self.ageLabel.backgroundColor = [UIColor whiteColor];
        [self.contentView addSubview:self.ageLabel];
        [self.ageLabel release];
        //电话
        self.phoneNumberLabel = [[UILabel alloc]init];
        self.phoneNumberLabel.backgroundColor = [UIColor whiteColor];
        [self.contentView addSubview:self.phoneNumberLabel];
        [self.phoneNumberLabel release];
        //爱好
        self.hobbyLabel = [[UILabel alloc]init];
        self.hobbyLabel.backgroundColor = [UIColor whiteColor];
        self.hobbyLabel.numberOfLines = 0;
        [self.contentView addSubview:self.hobbyLabel];
        [self.hobbyLabel release];
        //图片
        self.imageViews = [[UIImageView alloc]initWithImage:[UIImage imageNamed:[NSString stringWithFormat:@"%@",self.picture]]];
        self.imageViews.backgroundColor = [UIColor whiteColor];
        [self.contentView addSubview:self.imageViews];
        [self.imageViews release];
    }
    return self;
}

-(void)setContact:(Contact *)contact{
    if (_contact != contact) {
        [_contact release];
        _contact = [contact retain];
    }
    self.imageViews.image      =  [UIImage imageNamed:contact.picture];
    self.nameLabel.text        = contact.name;
    self.genderLabel.text      = contact.gender;
    self.ageLabel.text         = contact.age;
    self.phoneNumberLabel.text = contact.phoneNumber;
    self.hobbyLabel.text       = contact.hobby;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(void)layoutSubviews{
    [super layoutSubviews];
    self.imageViews.frame       = CGRectMake(250,  0,  80,135);
    self.nameLabel.frame        = CGRectMake(10,  10, 200, 28);
    self.genderLabel.frame      = CGRectMake(10,  40,  90, 28);
    self.ageLabel.frame         = CGRectMake(110, 40, 100, 28);
    self.phoneNumberLabel.frame = CGRectMake(10,  70, 200, 28);
    self.hobbyLabel.frame       = CGRectMake(10, 100, 200, 28);
    
   _height = [SecondTableViewCell heightOfLabel:self.contact.hobby andTextFont:[UIFont systemFontOfSize: 17] andLabelWidth:200];
    self.hobbyLabel.frame = CGRectMake(10, 100, 200, self.height);
}

+(SecondTableViewCell *)secondTableViewCellWithTable:(UITableView *)tableView{
    static NSString *cellIdentifier = @"SecondTableViewCellIdentify";
    SecondTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (!cell) {
        cell = [[SecondTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    return cell;
}

+(CGFloat)heightOfLabel:(NSString *)text andTextFont:(UIFont *)font andLabelWidth:(CGFloat)width{
    //第一步:设置文本显示的范围
    //注意:width 为当前文本的宽带
    //    height 尽量设为最大值(MAXfLOACT)
    CGSize size = CGSizeMake(width, MAXFLOAT);
    
    //第二步:设置文本显示字体样式
    NSDictionary *attributeDic = [NSDictionary dictionaryWithObject:font forKey:NSFontAttributeName];
    
    //第三步:计算文本显示范围
    CGRect frame = [text boundingRectWithSize:size options:NSStringDrawingUsesLineFragmentOrigin attributes:attributeDic context:nil];
    //NSLog( @"当前文本的高度%f",_height);
    return frame.size.height;
}

@end
