//
//  RootViewController.m
//  UI07_UIPageControl
//

#import "RootViewController.h"

@interface RootViewController ()<UIScrollViewDelegate>

@end

@implementation RootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
#pragma mark 创建一个横屏滚动视图,展示三张图片,在创建一个UIPageControl
    
    UIScrollView *scroll = [[UIScrollView alloc]initWithFrame:[UIScreen mainScreen].bounds];
    scroll.tag = 100;
    scroll.contentSize = CGSizeMake(scroll.frame.size.width * 8 , scroll.frame.size.height );
    scroll.delegate = self;
    scroll.backgroundColor = [UIColor groupTableViewBackgroundColor];
    scroll.pagingEnabled = YES;
    [self.view addSubview:scroll];
    [scroll release];
    
#pragma mark 创建1个有8页的UIPageControl
    UIPageControl *pageControl = [[UIPageControl alloc]initWithFrame:CGRectMake(100, self.view.frame.size.height - 100, 200, 50)];
    pageControl.backgroundColor = [UIColor grayColor];

    //添加事件
    pageControl.tag = 101;
    [pageControl addTarget:self action:@selector(pageChange:) forControlEvents:UIControlEventValueChanged];
    [self.view addSubview:pageControl];
    [pageControl release];
    
    //设置pageControl页数
    pageControl.numberOfPages = 8;
    
    //设置当前页,默认为0 (第一页)
    pageControl.currentPage = 0;
    for (int i = 1; i < 9; i ++) {
        UIImageView *image= [[UIImageView alloc]initWithImage:[UIImage imageNamed:[NSString stringWithFormat:@"h%d.jpeg",i]]];
        image.frame = CGRectMake(scroll.frame.size.width * (i - 1), 0, scroll.frame.size.width, scroll.frame.size.height);
        [scroll addSubview:image];
        [image release];
    }
}

-(void)scrollViewWillEndDragging:(UIScrollView *)scrollView withVelocity:(CGPoint)velocity targetContentOffset:(inout CGPoint *)targetContentOffset{
    UIPageControl *pageControl = (UIPageControl *)[self.view viewWithTag:101];
    pageControl.currentPage = (1 + scrollView.contentOffset.x / self.view.frame.size.width);
    //NSLog(@"%f",scrollView.contentOffset.x / 375);
}

-(void)pageChange:(UIPageControl *)pageControl{
    UIScrollView *scroll = (UIScrollView *)[self.view viewWithTag: 100];
    scroll.contentOffset = CGPointMake(self.view.frame.size.width * pageControl.currentPage, 0);
    NSLog(@"page被点击 %ld",pageControl.currentPage);
}


#pragma mark pageControl事件实现
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
