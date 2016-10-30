//
//  FirstViewController.m
//  UI12_TableView综合
//

#import "FirstViewController.h"
#import "ModalViewController.h"

#import "SDWebImageManager.h"
#import "UIImageView+WebCache.h"

@interface FirstViewController ()

@end

@implementation FirstViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"添加" style:UIBarButtonItemStylePlain target:self action:@selector(addAction:)];

    UIImageView *imageView= [[UIImageView alloc]initWithFrame:CGRectMake(0, 64, 375, 300)];
    imageView.backgroundColor = [UIColor redColor];
    NSURL *url =  [NSURL URLWithString:@"http://img05.tooopen.com/images/20150202/sy_80219211654.jpg"];
    [imageView sd_setImageWithURL:url];
    
    //-fobjc-arc 把ARC改为MRC
    [self.view addSubview:imageView];
    
    //打印url的解析数据
    NSData *data =[NSData dataWithContentsOfURL:url];
    NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableLeaves error:nil];
    NSLog(@"%@-------------",dic);
 }

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)addAction:(UIButton *)button{
    ModalViewController *modal = [[ModalViewController alloc]init];
    modal.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;
    [self presentViewController:modal animated:YES completion:nil];
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
