//
//  LTView.h
//  UI03_自定义视图,视图控制器
//

#import <UIKit/UIKit.h>

//遵循textField协议
@interface LTView : UIView<UITextFieldDelegate>
//声明对外的接口
/**
 *  LTView的右侧textField
 */
@property (nonatomic, retain) UILabel *label;
@property (nonatomic, retain) UITextField *textField;

//@property(nonatomic, copy)NSString *text;
//@property(nonatomic, copy)NSString *placeholder;

@end
