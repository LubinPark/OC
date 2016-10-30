//
//  SecondTableViewCell.h
//  UI11_自定义UITableViewCell
//
//  Created by dllo on 15/9/11.
//  Copyright (c) 2015年 蓝鸥科技. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Contact.h"
@interface SecondTableViewCell : UITableViewCell
/**
 *  定义一个   Contact属性
 */
@property (nonatomic, retain)Contact *contact;
/**
 *  姓名
 */
@property (nonatomic, retain)UILabel *nameLabel;
/**
 *  性别
 */
@property (nonatomic, retain)UILabel *genderLabel;
/**
 *  年龄
 */
@property (nonatomic, retain)UILabel *ageLabel;
/**
 *  手机号
 */
@property (nonatomic, retain)UILabel *phoneNumberLabel;
/**
 *  爱好
 */
@property (nonatomic, retain)UILabel *hobbyLabel;
/**
 *  图片路径
 */
@property (nonatomic, retain)UILabel *picture;
/**
 *  图片
 */
@property (nonatomic, retain)UIImageView *imageViews;

/**
 *  用来存储当前自适应label高度
 */
@property (nonatomic, assign)CGFloat height;

+(SecondTableViewCell *)secondTableViewCellWithTable:(UITableView *)tableView;


/**
 *  计算文本高度
 *
 *  @param text 文本内容
 *  @param font 文本字体大小
 *  @param width 文本显示的宽度
 *  @return 计算后的文本的文本高度
 */
+(CGFloat)heightOfLabel:(NSString *)text andTextFont:(UIFont *)font andLabelWidth:(CGFloat)width;

@end
