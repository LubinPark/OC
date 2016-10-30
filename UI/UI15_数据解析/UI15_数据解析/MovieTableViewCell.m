
//
//  MovieTableViewCell.m
//  UI15_数据解析
//

#import "MovieTableViewCell.h"

@implementation MovieTableViewCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.nameLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 375, 50)];
        
        self.nameLabel.backgroundColor = [UIColor orangeColor];
        [self.contentView addSubview:self.nameLabel];
        [self.nameLabel release];
    }
    return self;
}


- (void)setLabelText:(NSString *)labelText
{
    self.nameLabel.text = labelText;
}


- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
