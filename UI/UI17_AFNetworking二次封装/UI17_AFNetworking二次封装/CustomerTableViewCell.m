//
//  CustomerTableViewCell.m
//  UI17_AFNetworking二次封装
//
//  Created by 芦彬 on 15/9/21.
//  Copyright (c) 2015年 芦彬. All rights reserved.
//

#import "CustomerTableViewCell.h"

#define Width self.frame.size.width

@implementation CustomerTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:UITableViewCellStyleDefault reuseIdentifier:reuseIdentifier];
    if (self) {

        self.titleLabel = [[UILabel alloc]init];
//        self.titleLabel.backgroundColor = [UIColor orangeColor];
        [self.contentView addSubview:self.titleLabel];
        
        self.imageViews = [[UIImageView alloc]init];
//        self.imageViews.backgroundColor = [UIColor purpleColor];
        [self.contentView addSubview:self.imageViews];
        
        self.addressLabel = [[UILabel alloc]init];
//        self.addressLabel.backgroundColor = [UIColor purpleColor];
        [self.contentView addSubview:self.addressLabel];
        
        self.contentLabel = [[UILabel alloc]init];
//        self.contentLabel.backgroundColor = [UIColor orangeColor];
        [self.contentView addSubview:self.contentLabel];
    }
    return self;
}

- (void)layoutSubviews{
    [super layoutSubviews];
    self.titleLabel.frame = CGRectMake(130, 10, 200, 30);
    self.imageViews.frame = CGRectMake(10, 10, 80, 120);
    self.addressLabel.frame = CGRectMake(130, 50, 200, 30);
    self.contentLabel.frame = CGRectMake(130, 100, 200, 30);
}

+(UITableViewCell *)customerTableViewCellWithTable:(UITableView *)tableView{
    static NSString *cellIdentify = @"cellIdentify";
    CustomerTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentify];
    if (!cell) {
        cell = [[CustomerTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentify];
    }
    return cell;
}

- (void)setCustomer:(Customer *)customer{
    if (_customer != customer) {
        [_customer release];
        _customer = [customer retain];
    }
    self.titleLabel.text = customer.title;
    self.contentLabel.text = customer.content;
    self.addressLabel.text = customer.address;
    NSString *urlString = [NSString stringWithFormat:@"%@", customer.image];
    NSURL *url = [NSURL URLWithString:urlString];
}

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
