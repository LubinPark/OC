//
//  DetailViewController.m
//  UI13_UITabBarController
//

#import "DetailViewController.h"
#import "DetailTableViewCell.h"
@interface DetailViewController ()<UITableViewDelegate,UITableViewDataSource>

@end

@implementation DetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"详情页";
    self.view.backgroundColor = [UIColor groupTableViewBackgroundColor];

    UITableView *tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height - 64) style:UITableViewStyleGrouped];
    [self.view addSubview:tableView];
    
    tableView.delegate = self;
    tableView.dataSource = self;

    // Do any additional setup after loading the view.
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 3;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    DetailTableViewCell *detail = [[DetailTableViewCell alloc]init];
    CGFloat height = [DetailTableViewCell heightOfLabel:detail.label.text andTextFont:[UIFont systemFontOfSize:17]];
    return 20 + height;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    DetailTableViewCell *cellDetail = [DetailTableViewCell detailTableViewCellWithTable:tableView];
    return cellDetail;
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
