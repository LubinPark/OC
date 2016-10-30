//
//  RootViewController.m
//  UI05_delegate
//

#import "RootViewController.h"
#import "CurstermerView.h"
@interface RootViewController ()<CurstermerViewDeleagate>

@end

@implementation RootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    CurstermerView *aView = [[CurstermerView alloc]initWithFrame:CGRectMake(100, 100, 100, 100)];
#pragma mark 第五步:指定代理人
    aView.delegate = self;
    [self.view addSubview:aView];
    [aView release];
    // Do any additional setup after loading the view.
}

#pragma mark 第六:实现方法
-(void)changeColor:(UIView *)view{
    view.backgroundColor = [UIColor redColor];
}

-(void)changeLocal:(UIView *)view{
    [view setCenter:CGPointMake(view.center.x, view.center.y + 20)];
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
