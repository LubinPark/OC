//
//  RootViewController.m
//  UISlider
//

#import "RootViewController.h"
@interface RootViewController ()

@end

@implementation RootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    NSMutableArray *imageArray = [NSMutableArray array];
    for (int i = 1; i < 41; i++) {
        NSString *name = [NSString stringWithFormat:@"2250_3650903_179fb89ae279fae－%d（被拖移）",i];
        NSString *path = [[NSBundle mainBundle]pathForResource:name ofType:@"tiff"];
        UIImage *image = [UIImage imageWithContentsOfFile:path];
        [imageArray  addObject:image];
    }
    
    UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 200 , 200)];
    imageView.tag = 15;
    imageView.center = self.view.center;
    imageView.animationImages = imageArray;
    imageView.animationDuration = 2.5;
    imageView.animationRepeatCount = 0;
    [imageView startAnimating];
    [self.view addSubview:imageView];
    [imageView release];
    
    //创建一个UIsiler用来控制动画的播放速度
    UISlider *slider = [[UISlider alloc]initWithFrame:CGRectMake(0, 50, 375, 80)];
    
    slider.backgroundColor = [UIColor orangeColor];
    
    //设置slider的最小值
    slider.minimumValue = 0.1;
    
    //设置slider的最大值
    slider.maximumValue = 4.0;
    
    //定义划过区域的颜色
    slider.minimumTrackTintColor = [UIColor redColor];
    
    //添加slider的事件
    [slider addTarget:self action:@selector(sliderAction:) forControlEvents:UIControlEventValueChanged];
    [self.view addSubview:slider];
    // Do any additional setup after loading the view.
}

-(void)sliderAction:(UISlider *)slider{
    ((UIImageView *)[self.view viewWithTag:15]).animationDuration = 4 -  slider.value;
    [(UIImageView *)[self.view viewWithTag:15] startAnimating];
    NSLog(@"slider当前值%f",slider.value);
    //取出slider当前值
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
