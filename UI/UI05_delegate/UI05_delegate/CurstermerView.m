//
//  CurstermerView.m
//  UI05_delegate
//


#import "CurstermerView.h"

@implementation CurstermerView

-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor orangeColor];
    }
    return self;
}

//-(void)changeLocal:(UIView *)view{
//    [view setCenter:CGPointMake(view.center.x, view.center.y + 20)];
//}

#pragma mark 第四步:制定代理方法执行时刻
-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    [self.delegate changeColor:self];
    [self.delegate changeLocal:self];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
