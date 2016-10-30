//
//  AppDelegate.m
//  UI03_自定义视图,视图控制器
//

#import "AppDelegate.h"
#import "LTView.h"

@interface AppDelegate ()

@end

@implementation AppDelegate

- (void)dealloc{
    [_window release];
    [super dealloc];
}


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    
    NSArray *labelArray = @[@"姓名",@"密码",@"确认密码",@"手机",@"邮箱"];
    NSArray *textFieldArray = @[@"请输入姓名",@"请输入密码",@"请再输入密码",@"请输入手机",@"请输入邮箱"];
    
    for (int i = 0; i < 5; i++) {
        LTView *view = [[LTView alloc]initWithFrame:CGRectMake(50, 50 +  80 * i, 270, 30)];
        view.label.text = labelArray[i];
        view.textField.placeholder = textFieldArray[i];
        [self.window addSubview:view];
        [view release];
        if (i == 1 || i == 2) {
            //设置输入框形式，输入内容***保护
            view.textField.secureTextEntry = YES;
        }
    }
    
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    return YES;
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
