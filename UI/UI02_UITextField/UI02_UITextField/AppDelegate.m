//
//  AppDelegate.m
//  UI02_UITextField
//

#import "AppDelegate.h"

@interface AppDelegate ()<UITextFieldDelegate>

@end

@implementation AppDelegate


- (void)dealloc
{
    [_window release];
    [super dealloc];
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    NSLog(@"%s,%d",__func__,__LINE__);
    
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    self.window.backgroundColor = [UIColor whiteColor];
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectMake(160, 100, 30, 30);
    btn.backgroundColor = [UIColor orangeColor];
    [btn addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
    
#pragma mark 设置按钮的前景图片
    //给按钮设置背景图片
    //setImage是固定尺寸  setBackgroundImage自动拉伸
    //[btn setImage:[UIImage imageNamed:@"check"] forState:UIControlStateNormal];
    [btn setBackgroundImage:[UIImage imageNamed:@"check"] forState:UIControlStateNormal];
    [self.window addSubview:btn];
    
    /*************** UITextfield ***************/
    //创建一个UITextField
    UITextField *firstTextField = [[UITextField alloc]initWithFrame:CGRectMake(50, 200, 270, 50)];
    firstTextField.backgroundColor = [UIColor whiteColor];
    
    //placeholder属性:占位符,起提示作用
    firstTextField.placeholder = @"请输入信息";
    
    //font属性:设置字体大小
    firstTextField.font =[UIFont systemFontOfSize:20];
    
    //editing属性:设置是否可编辑(只读属性,不可设置)
    //firstTextField.editing = YES;
    
    //textAlignment 对齐方式
    firstTextField.textAlignment = NSTextAlignmentLeft;
    
    //borderStyle属性 边框样式
    firstTextField.borderStyle = UITextBorderStyleRoundedRect;
    
    //clearsOnBeginEditing 在开始编辑删除文本信息
    firstTextField.text = @"123123";
    firstTextField.clearsOnBeginEditing = YES;
    
    //enabled 设置文本不可编辑
    //firstTextField.enabled = NO;
    
    //弹出键盘类型
    //firstTextField.keyboardType = UIKeyboardTypeNumberPad;
    //firstTextField.keyboardType = UIKeyboardTypeNamePhonePad;
    firstTextField.keyboardType = UIKeyboardTypeEmailAddress;
    
    //returnType属性 返回键位置的提示样式(右下角)(Done,Next,Join)
    firstTextField.returnKeyType = UIReturnKeyNext;
    
    //clearButtonMode 输入后右边有X,点击清空文本信息
    firstTextField.clearButtonMode = UITextFieldViewModeAlways;
    
    [UIColor orangeColor];
    
#pragma mark 设置UITextfieldDelegate的代理,重要
    
    //设置self为当前 textfield的代理
    //而且必须签订代理 UITextFieldDelegate
    firstTextField.delegate = self;
    firstTextField.tag = 100;

    UIButton *button = [[UIButton alloc]initWithFrame:CGRectMake(50, 300, 100, 50)];
    button.backgroundColor = [UIColor whiteColor];
    [button setTitle: @"点击" forState:UIControlStateNormal];
    [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [button setTitleColor:[UIColor greenColor] forState:UIControlStateHighlighted];
    [button addTarget:self action:@selector(buttonClicked:) forControlEvents:UIControlEventTouchUpInside];
    [self.window addSubview:button];
    [button release];
    
    [self.window addSubview:firstTextField];
    [firstTextField release];
    
    [self.window makeKeyAndVisible];
    return YES;
}

#pragma mark 点击return 键触发代理方法
-(BOOL)textFieldShouldReturn:(UITextField *)textField{
    //失去第一响应者
    [textField resignFirstResponder];
    return YES;
}

-(void)buttonClicked:(UIButton *)button{
    //让textField成为第一响应者
    button.selected = !button.isSelected;
    UITextField *textField = (UITextField *)[self.window viewWithTag:100];
    
    if (button.isSelected) {
        [textField becomeFirstResponder];
    }
    else{
        [textField resignFirstResponder];
    }
}


-(void)buttonAction:(UIButton *)button{
    //点击按钮改变图片
    button.selected = !button.isSelected;
    if (button.selected) {
        [button setBackgroundImage:[UIImage imageNamed:@"checked"] forState:UIControlStateNormal];
    }else{
        [button setBackgroundImage:[UIImage imageNamed:@"check"] forState:UIControlStateNormal];
    }
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
