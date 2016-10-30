//
//  RootViewController.m
//  UI05_手势
//

#import "RootViewController.h"

@interface RootViewController ()

@end

@implementation RootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    //创建一张图片
    UIImageView *imageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"1.jpg"]];
    imageView.tag = 100;
    imageView.frame = CGRectMake(30, 100, 300, 400);
    
    //用户交互开启
    imageView.userInteractionEnabled = YES;
    
    [self.view addSubview:imageView];
    [imageView release];
    
#pragma mark label 和imageView的用户交互默认为关闭状态
    /*
    //创建轻拍手势
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(panAction:)];
    //手势的相关设置
    //设置点击次数,默认为1
    tap.numberOfTapsRequired = 2;
    
    //同时2点点击
    tap.numberOfTouchesRequired = 2;
    
    //给具体的某个视图添加轻拍手势
    [imageView addGestureRecognizer:tap];
    //[imageView addGestureRecognizer:pan];
    */
    
    /*
    //平移手势
    UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc]initWithTarget:self action:@selector(tapAction:)];
    [imageView addGestureRecognizer:pan];
    pan.minimumNumberOfTouches =2;
    [pan release];
    */
    
    /*
    //捏合手势
    UIPinchGestureRecognizer *pinch = [[UIPinchGestureRecognizer alloc]initWithTarget:self action:@selector(pinchAction:)];
    [imageView addGestureRecognizer:pinch];
    [pinch release];
     */
    
    UIRotationGestureRecognizer *rot = [[UIRotationGestureRecognizer alloc]initWithTarget:self action:@selector(rotAction:)];
    [imageView addGestureRecognizer:rot];
    [rot release];
}
#pragma mark 轻拍手势
-(void)tapAction:(UITapGestureRecognizer *)tap{
    self.view.backgroundColor = [UIColor orangeColor];
}

#pragma mark 平移手势
-(void)panAction:(UITapGestureRecognizer *)pan{
    self.view.backgroundColor = [UIColor orangeColor];
}

#pragma mark 捏合手势
-(void)pinchAction:(UIPinchGestureRecognizer *)pinch{
    
    //找到当前图片
    UIImageView *imageView = (UIImageView *)[self.view viewWithTag:100];
    imageView.transform = CGAffineTransformScale(imageView.transform, pinch.scale,pinch.scale);
    
    //切记:缩放完成后把当前scale 置为1
    pinch.scale = 1;
    self.view.backgroundColor = [UIColor purpleColor];
}

#pragma mark 旋转手势
-(void)rotAction:(UIRotationGestureRecognizer *)rot{
    UIImageView *imageView = (UIImageView *)[self.view viewWithTag:100];
    imageView.transform = CGAffineTransformRotate(imageView.transform,rot.rotation);
    //切记:旋转完把当前角度设置为0
    rot.rotation = 0;
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
