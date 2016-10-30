//
//  LTView.m
//  UI03_自定义视图,视图控制器
//

#import "LTView.h"

@implementation LTView

- (void)dealloc{
    [_label release];
    [_textField release];
    [super dealloc];
    
}

- (id)initWithFrame:(CGRect)frame{
    
    //首先实现父类的初始化方法
    self = [super initWithFrame:frame];
    if (self) {
        //初始化方法内部,创建子视图
        [self createSubViews:frame];
    }
    return self;
}

-(void)createSubViews:(CGRect)frame{
    self.label = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, frame.size.width / 7 * 2, frame.size.height)];
    self.label.text = @"UILabel";
    self.backgroundColor = [UIColor whiteColor];
    self.textField.delegate = self;
    [self addSubview:self.label];
    [self.label release];
    
    self.textField = [[UITextField alloc]initWithFrame:CGRectMake(self.label.frame.size.width, 0, frame.size.width / 7 * 5, frame.size.height)];
    self.textField.placeholder = @"UITextField";
    self.textField.borderStyle = UITextBorderStyleRoundedRect;
    self.textField.clearButtonMode = UITextFieldViewModeAlways;
    self.textField.backgroundColor = [UIColor whiteColor];
    [self addSubview:self.textField];
    [self.textField release];
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField{
    [self.textField resignFirstResponder];
    return YES;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
