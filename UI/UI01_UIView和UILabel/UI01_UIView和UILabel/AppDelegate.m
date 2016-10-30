//
//  AppDelegate.m
//  UI01_UIView和UILabel
//

#import "AppDelegate.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    
    /*************当前苹果手机屏幕尺寸*****************/
    /*
     Iphone4/4S    : 320 * 480 pt
     IPhone5/5C/5S : 320 * 568 pt
     Iphone6       : 375 * 667 pt
     Iphone6 plus  : 414 * 736 pt
     
      ~4   1pt = 1px(像素)
     4~6   1pt = 2px
     6plus 1pt = 3px
     */
    
    //设置背景颜色(通过UIColor)
    self.window.backgroundColor = [UIColor orangeColor];
    
    //IOS中所有看到的东西全都是UIView或者其子类
    //创建一个UIView,通过CGRect
    UIView *firstView = [[UIView alloc]initWithFrame:CGRectMake(85, 50, 205, 50)];
    
    firstView.backgroundColor = [UIColor lightGrayColor];
    
    //特殊注意:一个视图(view)一定依赖window才会显示.
    [self.window addSubview:firstView];
    
    [firstView release];
    
    //**************************************
    UIView *secondView = [[UIView alloc]initWithFrame:CGRectMake(85, 150, 205, 50)];
    
    secondView.backgroundColor = [UIColor purpleColor];
    
    [self.window addSubview:secondView];
    
    [secondView release];
    
    //**************************************
    UIView *yellowView = [[UIView alloc]initWithFrame:CGRectMake(85, 300, 200, 200)];
    
    yellowView.backgroundColor = [UIColor yellowColor];
    
    [self.window addSubview:yellowView];
    
    [yellowView release];
    
    //**************************************
    UIView *blueView = [[UIView alloc]initWithFrame:CGRectMake(50, 50, 100, 100)];
    
    blueView.backgroundColor = [UIColor blueColor];
    
    [yellowView addSubview:blueView];
    
    
    [blueView release];
    
    NSLog(@"x= %f ,y = %f",yellowView.center.x ,blueView.center.y);
    
    //frame 是相对父视图而言
    //另外一个重要的属性:center(CGPoint 类型的结构体)
    //center.x = origin.x + size.widh / 2
    //center.y = origin.y + size.height / 2
    //center会影响frame 中的origin,反过来origin也回同样影响center
    
    blueView.center = CGPointMake(10, 10);
    NSLog(@"x= %f ,y = %f",yellowView.frame.origin.x ,blueView.frame.origin.y);
    
    //使当前window成为应用程序的主窗口.并且可见
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
