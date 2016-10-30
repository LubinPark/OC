//
//  FirstTableViewCell.h
//  UI11_自定义UITableViewCell
//
//  Created by dllo on 15/9/11.
//  Copyright (c) 2015年 蓝鸥科技. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Contact.h"
@interface FirstTableViewCell : UITableViewCell

#pragma mark封装写法:将Model封装在Cell内,重写该属性的set方法,给对应的控件赋值
@property (nonatomic, retain)Contact *contact;

@property (nonatomic, retain)UILabel *nameLabel;

@property (nonatomic, retain)UILabel *genderLabel;

@property (nonatomic, retain)UILabel *ageLabel;

@property (nonatomic, retain)UILabel *phoneNumberLabel;

@property (nonatomic, retain)UILabel *hobbyLabel;

@property (nonatomic, retain)NSString *picture;

@property (nonatomic, retain)UIImageView *imageViews;

//自定义TableViewCell的便利构造器
+(FirstTableViewCell *)firstTableViewCellWithTable:(UITableView *)tableView;

@end
