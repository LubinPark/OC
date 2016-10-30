//
//  DetailTableViewCell.m
//  UI13_UITabBarController
//

#import "DetailTableViewCell.h"

@implementation DetailTableViewCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.label = [[UILabel alloc]init];
        self.label.backgroundColor = [UIColor purpleColor];
        self.label.text = @"代码代码代码代码代码代码代码代码代码代码代码代码代码代码代码代码代码代码代码代码代码代码代码代码代码代码代码代码代码代码代码代码代码代码代码代码代码代码代码代码代码代代码代码代码代码代码代码代码代码代码代码代码代码代码代码代码代码代码代码代码代码代码代码代码代码码";
        self.label.numberOfLines = 0;
        [self.contentView addSubview:self.label];
        [self.label release];
    }
    return self;
}

+(DetailTableViewCell *)detailTableViewCellWithTable:(UITableView *)tableView{
    static NSString *cellIdentify = @"cellIdentify";
    DetailTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentify];
    if (!cell) {
        cell = [[DetailTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentify];
    }
    return cell;
}

-(void)layoutSubviews{
    [super layoutSubviews];
    
    _height = [DetailTableViewCell heightOfLabel:self.label.text andTextFont:[UIFont systemFontOfSize:17]];
    self.label.frame = CGRectMake(50, 10, self.frame.size.width - 100, self.height);
}

+(CGFloat)heightOfLabel:(NSString *)text andTextFont:(UIFont *)font{
    CGSize size = CGSizeMake(275, MAXFLOAT);
    NSDictionary *dic = [NSDictionary dictionaryWithObject:font forKey:NSFontAttributeName];
    
    CGRect frame = [text boundingRectWithSize:size options:NSStringDrawingUsesLineFragmentOrigin attributes:dic context:nil];
    return frame.size.height;
}

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
