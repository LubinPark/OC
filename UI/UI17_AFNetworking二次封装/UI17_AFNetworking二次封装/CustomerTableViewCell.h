//
//  CustomerTableViewCell.h
//  UI17_AFNetworking二次封装
//
//  Created by 芦彬 on 15/9/21.
//  Copyright (c) 2015年 芦彬. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Customer.h"

@interface CustomerTableViewCell : UITableViewCell

@property (nonatomic, retain) Customer *customer;

@property (nonatomic, retain) UILabel *titleLabel;

@property (nonatomic, retain) UIImageView *imageViews;

@property (nonatomic, retain) UILabel *addressLabel;

@property (nonatomic, retain) UILabel *contentLabel;

@property (nonatomic, retain) NSString *image;

+(CustomerTableViewCell *)customerTableViewCellWithTable:(UITableView *)tableView;

@end
