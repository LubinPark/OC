//
//  TouchView.m
//  UI04_Touch
//

#import "TouchView.h"
@implementation TouchView

- (id)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor yellowColor];
        //设置默认类型
        self.changeType = LoginViewChangeNormal;
    }
    return self;
}

#pragma mark 开始点击

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    
    //随机变色
    if (self.changeType == LoginViewChangeColor) {
        self.backgroundColor = [UIColor colorWithRed:arc4random() %256 / 255.0 green:arc4random() %256 / 255.0 blue:arc4random() %256 / 255.0 alpha:1];
    }
    
    //获得当前视图可在屏幕范围内宽和高
    if (self.changeType == LoginViewChangeLocation) {
        NSInteger width = [UIScreen mainScreen].bounds.size.width - self.frame.size.width;
        NSInteger height = [UIScreen mainScreen].bounds.size.height - self.frame.size.height;
        self.frame = CGRectMake(arc4random() % width, arc4random() % height, self.frame.size.width, self.frame.size.height);
    }
    
    if (self.changeType == LoginViewChangeColorAndLocation) {
        NSInteger width = [UIScreen mainScreen].bounds.size.width - self.frame.size.width;
        NSInteger height = [UIScreen mainScreen].bounds.size.height - self.frame.size.height;
        self.backgroundColor = [UIColor colorWithRed:arc4random() %256 / 255.0 green:arc4random() %256 / 255.0 blue:arc4random() %256 / 255.0 alpha:1];
        self.frame = CGRectMake(arc4random() % width, arc4random() % height, self.frame.size.width, self.frame.size.height);
    }
    
//    switch (self.changeType) {
//        case LoginViewChangeNormal:
//            break;
//        default:
//            break;
//    }
}

#pragma mark 移动
- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event{
    NSLog(@"移动");
    if (self.changeType == LoginViewChangeColorAndLocation) {
    //创建触摸对象 当前touches 集合中只有一个触摸对象
    UITouch *touch = [touches anyObject];
    //通过触摸对象,获得触摸点的坐标
    //1种
    //CGPoint newPoint = [touch locationInView:self];
    //CGFloat x = newPoint.x - self.startPoint.x;
    //CGFloat y = newPoint.y - self.startPoint.y;
    //self.center = CGPointMake(self.center.x + x, self.center.y + y);
    
    //2种
    self.startPoint = [touch locationInView:self.superview];
    NSLog(@"%f,%f",self.startPoint.x,self.startPoint.y);
    self.frame = CGRectMake(self.startPoint.x, self.startPoint.y, self.frame.size.width, self.frame.size.height);
    }
}

#pragma mark 触摸结束
- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event{
    NSLog(@"触摸结束");
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
