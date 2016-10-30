//
//  TouchView.h
//  UI04_Touch
//

#import <UIKit/UIKit.h>

@interface TouchView : UIView

/**
 *  type为当前类型1:随机变色2:随机位置
 */
typedef enum :NSInteger{
    LoginViewChangeNormal,          //常态(默认)
    LoginViewChangeColor,           //改变颜色
    LoginViewChangeLocation,        //改变位置
    LoginViewChangeColorAndLocation,//改变颜色和位置
}LoginViewChangeType;

@property (nonatomic, assign)NSInteger type;
@property (nonatomic, assign)LoginViewChangeType changeType;
@property (nonatomic, assign)CGPoint startPoint;

@end
