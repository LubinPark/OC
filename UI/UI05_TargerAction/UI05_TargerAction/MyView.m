//
//  MyView.m
//  UI05_TargerAction
//

#import "MyView.h"
#import "RootViewController.h"

@implementation MyView

-(id)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor greenColor];
    }
    return self;
}

#pragma mark 第三步:实现方法
- (void)addMyTarget:(id)target action:(SEL)action{
#pragma  mark 第四步:设置target和action
    self.target = target;
    self.action = action;
}

#pragma mark 第五步:视图检测点击事件
-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
#pragma mark 第六步: 如果当前View被点击,那么target执行action方法
    [self.target performSelector:self.action withObject:self];
}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
