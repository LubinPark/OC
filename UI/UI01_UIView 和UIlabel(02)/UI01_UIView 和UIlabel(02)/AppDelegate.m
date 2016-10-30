//
//  AppDelegate.m
//  UI01_UIView 和UIlabel(02)
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
    
    UIView *firstView = [[UIView alloc]initWithFrame:CGRectMake(100, 100, 100, 100)];
    
    //bounds 以自己为容器.默认情况下:CGRectMake(0,0,frame.size.width, frame.size.height)
    //bounds 的本质作用:更改当前自身的坐标系(坐标原点的位置)
    //bounds.x 如果为正数,相对于当前视图自身坐标系初始原点向外移动 X
    //bounds.y 同理
    //bounds 和 frame的区别和联系.
    
    //区别: bounds相对于自身,frame 相对于父视图
    //联系:通常bounds 的size和frame 的size 一样
    //bounds黄金法则:bounds 永远不改变自身的显示效果,改变的是子视图的显示
    
    //firstView.bounds = CGRectMake(50, 50, 100, 100);
    //NSLog(@"%f,%f,%f,%f",firstView.bounds.origin.x,firstView.bounds.origin.y,firstView.bounds.size.width,firstView.bounds.size.height);
    
    firstView.backgroundColor =[UIColor purpleColor];
    [self.window addSubview:firstView];
    [firstView release];

    //UIView *secondView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 50, 50)];
    //secondView.backgroundColor = [UIColor orangeColor];
    //[firstView addSubview:secondView];
    //[secondView release];
    
    //**************  **************
    //UIView *threeView = [[UIView alloc]initWithFrame:CGRectMake(50, 300, 200, 200)];
    //threeView.backgroundColor = [UIColor greenColor];
    //[self.window addSubview:threeView];
    //[threeView release];
    //UIView *fourView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 100, 100)];
    //fourView.backgroundColor = [UIColor magentaColor];
    //[threeView addSubview:fourView];
    //[fourView release];

    //UIView *fourView = [[UIView alloc]initWithFrame:firstView.bounds];
    //fourView.backgroundColor = [UIColor redColor];
    //[threeView addSubview:fourView];
   
    /***************  ***************/
    //UIView *oneView = [[UIView alloc]initWithFrame:CGRectMake(50, 50, 200, 200)];
    //oneView.backgroundColor = [UIColor orangeColor];
    //[self.window addSubview:oneView];
    //[oneView release];
    
    //UIView *twoView = [[UIView alloc]initWithFrame:CGRectMake(50, 100, 150, 150)];
    //twoView.backgroundColor = [UIColor redColor];
    //[self.window addSubview:twoView];
    //[twoView release];
        
    //UIView *threeView = [[UIView alloc]initWithFrame:CGRectMake(50, 150, 100, 100)];
    //threeView.backgroundColor = [UIColor magentaColor];
    //[self.window addSubview: threeView];
    //[threeView release];
    
    //将特定子视图插入到父类视图的指定位置
    //[self.window insertSubview:threeView atIndex:1];
    
    //将特定的子视图插入到哪个视图的上面
    //[self.window insertSubview:oneView aboveSubview:twoView];
    
    //将特定的子视图插入到哪个视图的下面
    //[self.window insertSubview:twoView belowSubview:oneView];
    
    //将特定子视图移到父类视图最上层显示
    //[self.window bringSubviewToFront:threeView];
    
    //交换父视图中特定的两个视图的位置
    //[self.window exchangeSubviewAtIndex:2 withSubviewAtIndex:1];
    
    //在指定的位置插入子视图
    //[self.window insertSubview:oneView atIndex:2];
    //[self.window insertSubview:twoView atIndex:1];
    //[self.window insertSubview:threeView atIndex:0];
    
    /***************  ***************/

//    UIView *aView = [[UIView alloc]initWithFrame:CGRectMake(50, 50, 250, 250)];
//    aView.backgroundColor = [UIColor orangeColor];
//    [self.window addSubview:aView];
//    [aView release];
//    
//    UIView *bView = [[UIView alloc]initWithFrame:CGRectMake(50, 100, 200, 200)];
//    bView.backgroundColor = [UIColor magentaColor];
//    [self.window addSubview:bView];
//    [bView release];
//    
//    UIView *cView = [[UIView alloc]initWithFrame:CGRectMake(50, 150, 150, 150)];
//    cView.backgroundColor = [UIColor redColor];
//    [self.window addSubview:cView];
//    [cView release];
//    
//    UIView *dView = [[UIView alloc]initWithFrame:CGRectMake(50, 200, 100, 100)];
//    dView.backgroundColor = [UIColor yellowColor];
//    [self.window addSubview:dView];
//    [dView release];
//    
//    UIView *eView = [[UIView alloc]initWithFrame:CGRectMake(50, 250, 50, 50)];
//    eView.backgroundColor = [UIColor purpleColor];
//    [self.window addSubview:eView];
//    [eView release];
//    
//    [self.window bringSubviewToFront:aView];
//    
//    [self.window sendSubviewToBack:bView];
//    
//    [self.window exchangeSubviewAtIndex:2 withSubviewAtIndex:3];
//    
//    [cView removeFromSuperview];
    
    /*************** UIView其他属性 ***************/
    
    UIView *redView = [[UIView alloc]initWithFrame:CGRectMake(50, 50, 200, 200)];
    redView.backgroundColor = [UIColor purpleColor];
    [self.window addSubview: redView];
    [redView release];

    //hidden属性:控制视图的显隐,为BOOL类型,默认为NO
    //redView.hidden = YES;
    
    //alpha属性:控制视图的透明度0~1 默认为1
    redView.alpha = 0.2;
    UIView *tfboy = [[UIView alloc]initWithFrame:CGRectMake(10, 10, 50, 50)];
    tfboy.backgroundColor = [UIColor blueColor];
    [tfboy setTag:100];
    [redView addSubview:tfboy];
    NSLog(@"%.2f",tfboy.alpha);
    
    //supview属性:获得当前视图的父视图,返回值为UIView类型对象
    NSLog(@"🍎=====%@",[tfboy superview]);
    //subviews属性:获得当前视图的所有子视图,返回值为NSarray
    NSLog(@"🍌=====%@", redView.subviews);
    
#warning tag为UIView 中很重要的一个属性
    //tag默认为零,一般情况下通过设置tag值可以带来意想不到的便捷
    //NSLog(@"tfboy.tag = %ld",tfboy.tag);
    
    //通过tag值来获取对应视图 [父视图 viewWithTag:tag]获取视图
    //[redView viewWithTag:100];
    
    /*************** UILabel  ***************/
    //UILabel 继承自UIView,增加了文本显示功能
    
    UILabel *firstLabel = [[UILabel alloc]initWithFrame:CGRectMake(35, 50, 300, 400)];
    firstLabel.backgroundColor = [UIColor whiteColor];
    
    //text属性: 为label添加文本显示,默认系统为17号字
    firstLabel.text =@"tommow is sunning";
    
    //textColor属性
    firstLabel.textColor = [UIColor magentaColor];
    
    //textAlignment属性对齐方式
    firstLabel.textAlignment = NSTextAlignmentRight;
    
    //shadowColor属性 阴影颜色
    firstLabel.shadowColor = [UIColor orangeColor];
    
    //shadowOffset 阴影偏移  阴影向x正⽅方 向偏移5,向y正⽅方向偏移6
    firstLabel.shadowOffset = CGSizeMake(15, 16);
    
    //lineBreakMode属性:label 换行标准
    firstLabel.text=@"tommow is sunning~~~ ,I have a dream!!!";
    
    //如果设置行数, 0 代表无限行,只要label的尺寸内可显示
    firstLabel.numberOfLines = 0;
    firstLabel.lineBreakMode = NSLineBreakByWordWrapping;
    
    /*
     NSLineBreakByTruncatingHead,	 Truncate at head of line: "...wxyz"
     NSLineBreakByTruncatingTail,	 Truncate at tail of line: "abcd..."
     NSLineBreakByTruncatingMiddle   Truncate middle of line:  "ab...yz"
     */
    //firstLabel.lineBreakMode = NSLineBreakByTruncatingHead;
    
    //font 属性 字体大小 默认17号
    firstLabel.font = [UIFont systemFontOfSize:18];
    
    //font 属性 字体
    firstLabel.font = [UIFont fontWithName:@"Zapfino" size:25];

    [self.window addSubview:firstLabel];
    [firstLabel release];
    
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
