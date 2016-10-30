//
//  RootViewController.m
//  UI07_UIScrollView
//

#import "RootViewController.h"

@interface RootViewController ()<UIScrollViewDelegate>

@end

@implementation RootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor orangeColor];
    
#pragma mark UIScrollView 继承UIView
    //1.最主要的两个功能:1.可滚动
    //                2.可缩放
    UIScrollView *scroll = [[UIScrollView alloc]initWithFrame:[UIScreen mainScreen].bounds];
    scroll.backgroundColor = [UIColor purpleColor];
    [self.view addSubview:scroll];
    [scroll release];
    
#pragma mark contentSize 一定要大于frame,才可以滚动
    //contectSize 是UIScrollView的可滚动区域
    scroll.contentSize = CGSizeMake(scroll.frame.size.width , scroll.frame.size.height * 8);
    //scroll.contentSize = CGSizeMake(scroll.frame.size.width , scroll.frame.size.height);
    
    //contentOffset视图左上角距离原点的距离 初始值的位置
    //scroll.contentOffset = CGPointMake(0, scroll.frame.size.height);
    
    //scrollToTop:滚动到视野图顶部
    //注意:UIScrollView 需要是垂直滚动状态,并且点击状态栏时才触发.
    //当前页面只有一个为yes,其他的为no
    //当一个页里面有多个UIScrollView的时候,虽然scrollToTop默认是yes,此方法也不会触发,只有将其它UIScorllView的该属性均设置成NO时才使用.
    //scroll.scrollsToTop = NO;
    
    //pagingEnabled:是否整屏滚动  默认为NO
    scroll.pagingEnabled = YES;
    
    //bounces属性:边界是否回弹 默认为NO
    scroll.bounces = YES;
    
    //scrollEnable 是否能够滚动
    //scroll.scrollEnabled = NO;
    
    //是否显示垂直滚动条.默认为YES
    //scroll.showsVerticalScrollIndicator = NO;
    
#pragma mark UIScrollView的缩放属性
    //首先:如果相同UIScrollView实现缩放功能,必须遵循UISrollViewDelegate,并且实现代理方法,返回当前要缩放的视图.
    //注意:只有当UIScrollView中存在一个视图时,我们才能使用UISrollView的所缩放功能
    
    //指定UIScrollViewDelegate代理人
    scroll.delegate = self;
    
    //进行相关缩放属性的设置 最大最小缩放比例默认都是1.0
    scroll.minimumZoomScale = 0.5;
    scroll.maximumZoomScale = 3.0;
    
    //bouncesZoom属性:缩放时是否有回弹效果,默认为yes
    //scroll.bouncesZoom = NO;
    
    //zoomScale设置图片的缩放比例
    //scroll.zoomScale = 0.5;
    
    for (int i = 1; i < 9; i++) {
        UIImageView *image = [[UIImageView alloc]initWithImage:[UIImage imageNamed:[NSString stringWithFormat:@"h%d.jpeg",i]]];
        image.frame = CGRectMake(0, scroll.frame.size.height * (i - 1), scroll.frame.size.width, scroll.frame.size.height);
        [scroll addSubview:image];
        [image release];
    }

}

#pragma mark UIScrollViewDelegate 方法
-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
    //contextOffset偏移量
    NSLog(@"已经滚动 %.2f,%.2f",scrollView.contentOffset.x,scrollView.contentOffset.y);
}

-(void)scrollViewWillBeginDragging:(UIScrollView *)scrollView{
    NSLog(@"将要开始拖拽");
}

-(void)scrollViewWillEndDragging:(UIScrollView *)scrollView withVelocity:(CGPoint)velocity targetContentOffset:(inout CGPoint *)targetContentOffset{
    NSLog(@"将要结束拖拽");
}

-(void)scrollViewWillBeginDecelerating:(UIScrollView *)scrollView{
    NSLog(@"将要减速");
}

-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    NSLog(@"减速结束");
}

-(UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView{
    return [[scrollView subviews]objectAtIndex:0];
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
