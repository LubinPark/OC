//
//  CurstermerView.h
//  UI05_delegate
//

#import <UIKit/UIKit.h>
#pragma mark 第一步声明代理
@protocol  CurstermerViewDeleagate <NSObject>

#pragma mark 第二步:声明代理方法
-(void)changeColor:(UIView *)view;

-(void)changeLocal:(UIView *)view;

@end

@interface CurstermerView : UIView

#pragma mark 第三步:声明代理属性

@property(nonatomic, assign)id <CurstermerViewDeleagate>delegate;

@end
