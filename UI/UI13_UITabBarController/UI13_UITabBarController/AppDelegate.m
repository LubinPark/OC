//
//  AppDelegate.m
//  UI13_UITabBarController
//

#import "AppDelegate.h"
#import "OneViewController.h"
#import "TwoViewController.h"
#import "ThreeViewController.h"
#import "FourViewController.h"
#import "FiveViewController.h"
#import "SixViewController.h"

@interface AppDelegate ()<UITabBarControllerDelegate>

@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    
    //创建第一个标签视图控制器
    UITabBarController *firstTabBar = [[UITabBarController alloc]init];
    
#pragma mark 标签栏,最多只能显示4个模块,如果多余4个,最后一个会变成"..."
    
    //第一个导航控制器
    OneViewController *one = [[OneViewController alloc]init];
    UINavigationController *nav1 = [[UINavigationController alloc]initWithRootViewController:one];
    nav1.tabBarItem = [[UITabBarItem alloc]initWithTitle:@"首页" image:[UIImage imageNamed:@"53-house"] tag:100];
    //设置角标 badgeValue
    //nav1.tabBarItem.badgeValue = @"10";
    
     //第二个导航控制器
    TwoViewController *two = [[TwoViewController alloc]init];
    UINavigationController *nav2 = [[UINavigationController alloc]initWithRootViewController:two];
    nav2.tabBarItem = [[UITabBarItem alloc]initWithTitle:@"饮食" image:[UIImage imageNamed:@"48-fork-and-knife"] tag:101];
    //nav2.tabBarItem.badgeValue = @"1000";
    
     //第三个导航控制器
    ThreeViewController *three = [[ThreeViewController alloc]init];
    UINavigationController *nav3 = [[UINavigationController alloc]initWithRootViewController:three];
    nav3.tabBarItem = [[UITabBarItem alloc]initWithTitle:@"游戏" image:[UIImage imageNamed:@"22-skull-n-crossbones"] tag:102];
    
    //第四个导航控制器
    FourViewController *four = [[FourViewController alloc]init];
    UINavigationController *nav4 = [[UINavigationController alloc]initWithRootViewController:four];
    nav4.tabBarItem = [[UITabBarItem alloc]initWithTitle:@"设置" image:[UIImage imageNamed:@"95-equalizer"] tag:103];
    nav4.tabBarItem.badgeValue = @"99+";
    
    //第五个导航控制器
    FiveViewController *five = [[FiveViewController alloc]init];
    UINavigationController *nav5 = [[UINavigationController alloc]initWithRootViewController:five];
    nav5.tabBarItem = [[UITabBarItem alloc]initWithTitle:@"导航" image:[UIImage imageNamed:@"73-radar"] selectedImage:[UIImage imageNamed:@"74-location"]];
    
    //第六个导航控制器
    SixViewController *six = [[SixViewController alloc]init];
    UINavigationController *nav6 = [[UINavigationController alloc]initWithRootViewController:six];
    nav6.tabBarItem = [[UITabBarItem alloc]initWithTitle:@"更多" image:[UIImage imageNamed:@"10-medical"] tag:103];
    
#pragma mark 设置tarBar样式
#pragma 注意 tarBar 高度为49
    firstTabBar.tabBar.tintColor = [UIColor redColor];
    
    //指定tarBar的代理
    firstTabBar.delegate = self;
    
#pragma mark 使用标签视图控制器管理视图控制器(或视图控制器)
    firstTabBar.viewControllers = @[nav1,nav2,nav3,nav4,nav5,nav6];
    
#pragma mark 统一设置导航栏,标签栏样式,通常我们都再AppDelegate中进行,才会起作用
    [[UINavigationBar appearance] setBarTintColor:[UIColor orangeColor]];
    [[UITabBar appearance ]setBarTintColor:[UIColor orangeColor]];
    
#pragma mark 将标签视图控制器与window建立联系
    self.window.rootViewController  = firstTabBar;
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    return YES;
}

#pragma mark tabBarController代理方法实现

-(void)tabBarController:(UITabBarController *)tabBarController didSelectViewController:(UIViewController *)viewController{
    NSLog(@"当前选中的导航视图控制器%@",viewController);    
    UINavigationController *nav = (UINavigationController *)viewController;
    NSLog(@"%@",nav.tabBarItem.badgeValue);
    NSString *str = [NSString stringWithFormat:@"%ld",[nav.tabBarItem.badgeValue integerValue] - 1 ];
    nav.tabBarItem.badgeValue = str;
    if ([str isEqualToString:@"0"]) {
        nav.tabBarItem.badgeValue = nil;
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
