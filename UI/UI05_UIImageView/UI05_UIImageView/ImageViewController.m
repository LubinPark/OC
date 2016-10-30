//
//  ImageViewController.m
//  UI05_UIImageView
//

#import "ImageViewController.h"

@interface ImageViewController ()

@end

@implementation ImageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //静态图片一张显示
    //1种创建图片对象
    UIImage *image = [UIImage imageNamed:@"1"];
    
    //2种创建图片对象 通过图片路径
    //找到当前图片在当前工程中的
    //NSString *path = [[NSBundle mainBundle]pathForResource:@"1" ofType:@"jpg"];
    //UIImage *imageTwo = [UIImage imageWithContentsOfFile:path];
    
    /********************************************************************************/
    
    //多张静态图片连续播放，产生动画效果
    //创建图案片
    UIImageView *firstImage = [[UIImageView alloc]initWithImage:image];
    firstImage.frame = CGRectMake(80, 50, 200, 100);
    
    //背景颜色，如果网络请求，请求慢，初始化一个背景颜色
    firstImage.backgroundColor = [UIColor whiteColor];
    
    //设置图片平铺样式contextMode属性
    firstImage.contentMode = UIViewContentModeScaleAspectFit;
   
    NSMutableArray *imageArray = [NSMutableArray array];
    for (int i = 1; i < 41; i++) {
    NSString *path = [[NSBundle mainBundle]pathForResource:[NSString stringWithFormat:@"2250_3650903_179fb89ae279fae－%d（被拖移）",i] ofType:@"tiff"];
      UIImage *image = [UIImage imageWithContentsOfFile:path];
      [imageArray addObject:image];
    }
    NSLog(@"%@",imageArray);
    
    [self.view addSubview:firstImage];
    [firstImage release];
    
    //定义tag值，唯一标识符,为了给定每张图片一个标示
    firstImage.tag = 100;
    
    //添加图片动画
    firstImage.animationImages = imageArray;
    
    //设置总动画时长
    firstImage.animationDuration = 2.5;
    
    //开始动画
    [firstImage startAnimating];
    
    //设置动画重复次数
    firstImage.animationRepeatCount = 1;
    
    //创建几个点击按钮控制
    NSArray *array = @[@"开始",@"快进",@"放慢",@"停止"];
    for (int i = 0; i < 4; i++) {
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        button.frame = CGRectMake(40 + 80 * i, 300, 50, 30);
        button.tag = 1 + i;
        button.backgroundColor = [UIColor whiteColor];
        [button setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
        [button setTitleColor:[UIColor grayColor] forState:UIControlStateHighlighted];
        [button setTitle:array[i] forState:UIControlStateNormal];
        [button addTarget:self action:@selector(imageAction:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:button];
        NSLog(@"%ld",button.tag);
    }
}

-(void)imageAction:(UIButton *)button{
    UIImageView *image =(UIImageView *)[self.view viewWithTag:100];
    switch (button.tag) {
        case 1:
            NSLog(@"%ld",button.tag);
            [image startAnimating];
            break;
        case 2:
            image.animationDuration = 0.5;
            [image startAnimating];
            break;
        case 3:
            image.animationDuration = 4;
            [image startAnimating];
            break;
        case 4:
            [image stopAnimating];
            break;
        default:
            break;
    }
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
