//
//  DetailViewController.h
//  UI13_block高级
//

#import <UIKit/UIKit.h>

#pragma mark 第一步:定义一个block
typedef void (^Block)(UIColor *color);

@interface DetailViewController : UIViewController

#pragma marl 第二步:创建一个block类型的属性
#pragma 警告:声明block属性时,一定使用copy,这里是将栈区的block拷贝到堆区
@property (nonatomic, copy) Block myblock;

//-(void)changeBackgroundColor:(Block)block;

@end
