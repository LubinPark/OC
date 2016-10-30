//
//  FirstTableViewCell.m
//  UI11_自定义UITableViewCell
//
//  Created by dllo on 15/9/11.
//  Copyright (c) 2015年 蓝鸥科技. All rights reserved.
//

#import "FirstTableViewCell.h"
#import "Contact.h"
@interface FirstTableViewCell ()

@end

@implementation FirstTableViewCell

//第一步:重写UITaleViewCell的初始化方法
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.backgroundColor = [UIColor groupTableViewBackgroundColor];
#pragma mark 大坑:自定义tableViewCell的初始化方法内,现在的self.frame还是之前cell的默认值
        
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

#warning 非常重要:当frame发生变化时,就会走该方法
-(void)layoutSubviews{
#warning 神坑 切记.不要忘了实现父类的layoutSubviews
    [super layoutSubviews];
#warning 因为当frame发生变化时(addSubViews,改变frame,横竖屏旋转灯饰都会调用该方法),如果初始化方法中想使用self.frame的时候,这时frame是系统默认的值(0,0,屏幕宽度,44),如果在layoutSubViews中使用self.frame,这时frame的值为(0,0,屏幕宽度,当前cell高度)
    self.imageViews.frame       = CGRectMake(10,   0,  80,135);
    self.nameLabel.frame        = CGRectMake(130, 10, 200, 28);
    self.genderLabel.frame      = CGRectMake(130, 40,  90, 28);
    self.ageLabel.frame         = CGRectMake(230, 40, 100, 28);
    self.phoneNumberLabel.frame = CGRectMake(130, 70, 200, 28);
    self.hobbyLabel.frame       = CGRectMake(130,100, 200, 28);
}

#pragma mark 重写contact的setter方法(即model属性)
-(void)setContact:(Contact *)contact{
    if(_contact != contact){
        [_contact release];
        _contact = [contact retain];
    }
    //接下来,给对应视图进行赋值
    self.imageViews.image      =  [UIImage imageNamed:contact.picture];
    self.nameLabel.text        = contact.name;
    self.genderLabel.text      = contact.gender;
    self.ageLabel.text         = contact.age;
    self.phoneNumberLabel.text = contact.phoneNumber;
    self.hobbyLabel.text       = contact.hobby;
}

#pragma mark 遍历构造器的实现
+(FirstTableViewCell *)firstTableViewCellWithTable:(UITableView *)tableView{
    static NSString *cellIdentifer = @"FirstTableViewCellIdentify";
    FirstTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifer];
    if (!cell) {
        cell = [[FirstTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifer];
    }
    return cell;
}

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
