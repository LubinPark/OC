//
//  LoginView.m
//  UI03_UIViewController
//

#import "LoginView.h"
//#define  width self.window.frame.size.width
@implementation LoginView

- (void)dealloc {
    [_label release];
    [_textField release];
    [_button release];
    [super dealloc];
}

- (id)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        [self createSubViews:frame];
    }
    return self;
}

-(void)createSubViews:(CGRect)frame{
    
    self.label = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, frame.size.width /3, 50)];
    self.label.backgroundColor = [UIColor orangeColor];
    [self addSubview:self.label];
    [self.label release];
    
    self.textField = [[UITextField alloc]initWithFrame:CGRectMake(100, 0, frame.size.width / 3 * 2, 50)];
    self.textField.backgroundColor = [UIColor greenColor];
    [self addSubview:self.textField];
    [self.textField release];

    self.button = [[UIButton alloc]initWithFrame:CGRectMake(frame.size.width / 4, frame.size.width / 3 , 50, 30)];
    self.button.backgroundColor = [UIColor purpleColor];
    [self addSubview:self.button];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
