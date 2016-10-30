//
//  MyView.h
//  UI05_TargerAction
//

#import <UIKit/UIKit.h>

@interface MyView : UIView

#pragma mark 第一步:定义方法
- (void)addMyTarget:(id)target action:(SEL)action;

#pragma mark 第二步:创建Target,Action属性
/**
 *  MyView里target属性
 */
@property(nonatomic,retain) id target;
/**
 *  MyView里action属性
 */ 
@property(nonatomic,assign) SEL action;

@end
