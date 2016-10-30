//
//  DetailTableViewCell.h
//  UI13_UITabBarController
//

#import <UIKit/UIKit.h>

@interface DetailTableViewCell : UITableViewCell

@property (nonatomic,retain)UILabel *label;

@property (nonatomic ,assign)CGFloat height;

+(DetailTableViewCell *)detailTableViewCellWithTable:(UITableView *)tableView;

+(CGFloat)heightOfLabel:(NSString *)text andTextFont:(UIFont *)font;

@end
