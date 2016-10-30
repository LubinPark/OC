//
//  AppDelegate.m
//  UI02_UIButton
//

#import "AppDelegate.h"

@interface AppDelegate ()

@end

@implementation AppDelegate

-(void)dealloc{
    [_window release];
    [super dealloc];
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    
    // Override point for customization after application launch.
    self.window.backgroundColor = [UIColor whiteColor];
    
    /*************** UIButton ***************/
    //特别注意,UIButton不用release
    
    UIButton *firstButton = [UIButton buttonWithType:UIButtonTypeCustom];
    firstButton.frame = CGRectMake(100, 100, 100, 40);
    firstButton.backgroundColor = [UIColor blackColor];
    
    //给按钮添加点击事件(如果写一个按钮,没添加点击事件,写10遍)
    //tager:执行点击事件对象: action:方法选择器; forControlEvents:按钮的点击状态(枚举类型)
    [firstButton addTarget:self action:@selector(firstButtonAction:) forControlEvents:UIControlEventTouchUpInside];
    
    //按钮添加标题
    [firstButton setTitle:@"点击" forState:UIControlStateNormal];
    [firstButton setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    firstButton.showsTouchWhenHighlighted = YES;
    
    [self.window addSubview:firstButton];
    [self.window makeKeyAndVisible];
    return YES;
}

//点击方法实现˜
- (void)firstButtonAction:(UIButton *) button{
    button.selected = !button.isSelected;
    if (button.isSelected) {
        self.window.backgroundColor = [UIColor brownColor];
    }else{
        self.window.backgroundColor = [UIColor cyanColor];
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
