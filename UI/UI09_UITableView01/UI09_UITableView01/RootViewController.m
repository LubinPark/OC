//
//  RootViewController.m
//  UI09_UITableView01
//

#import "RootViewController.h"
#import "DetailViewController.h"

#warning 重点:UITableView必须遵循的2个代理 UITableViewDelegate和UITableViewSoure
@interface RootViewController ()<UITableViewDelegate,UITableViewDataSource>

//用来测试cell创建的个数
@property (nonatomic,assign)NSInteger flag;
/**
 *  用来存储分区标题的数组
 */
@property (nonatomic,retain)NSArray *titlearray;

@end

@implementation RootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.titlearray = @[@"A",@"B",@"C",@"D",@"E"];
    // Do any additional setup after loading the view.
    
    //UITbaleView 样式只有2种,一种是分区Group,另一种是不分区plain.
    //可通过TableView的style属性读取样式
    UITableView *firstTableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height) style:UITableViewStylePlain];
    
    //设置tableView 的分割线颜色
    firstTableView.separatorColor = [UIColor blackColor];
    
    //设置tableView 的行高 默认行高44
    firstTableView.rowHeight = 60;
    
    //设置tableView 的背景颜色
    firstTableView.backgroundColor = [UIColor groupTableViewBackgroundColor];
    
    //设置tableView的分割线样式
    firstTableView.separatorStyle = UITableViewCellSeparatorStyleSingleLineEtched;
    
#pragma mark 设置tableView的头视图
    UIView *header = [[UIView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 100)];
    header.backgroundColor = [UIColor magentaColor];
    firstTableView.tableHeaderView = header;
    
#pragma mark 设置tablev尾视图
    firstTableView.tableFooterView = [[UIView alloc]initWithFrame:CGRectZero];

#pragma mark   指定代理人
    firstTableView.delegate = self;
    firstTableView.dataSource = self;
    
    [self.view addSubview:firstTableView];
    [firstTableView release];
}

#pragma mark 必须实现的代理方法 返回行数
//tableView为当前显示的tableView,section为当前分区
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if(section == 0){
        return 1;
    }
    else if (section == 1){
        return 2;
    }
    else if (section == 2){
        return 3;
    }
    else{
        return 5;
    }
}

#pragma mark 必须实现的代理方法:返回单元格
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    //设置cell的重用标识
    static NSString *cellIdentifier = @"cellIdentifier";
    
#pragma markUITableViewCell的重用机制:非常重要
    //去重用池中去取cell
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    //判断在重用池中是否获得该标识的cell
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:cellIdentifier];
        self.flag++;
        NSLog(@"cell创建了%ld个",self.flag);
    }
    
    //UITableViewCell设置样式
    //UITableViewCell *cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:nil];
    
    //indexPath里面包含两部分,section和row,当前分区和行标
    NSString *imageName = [NSString stringWithFormat:@"h%ld.jpeg",indexPath.row + 1];
    cell.imageView.image = [UIImage imageNamed:imageName];
    NSString *title = [NSString stringWithFormat:@"section = %ld row = %ld",indexPath.section,indexPath.row];
    
    //设置cell的标题
    cell.textLabel.text = title;
    //设置cell的辅助标题
    cell.detailTextLabel.text = @"描述";
    
    //cell.accessoryType = UITableViewCellAccessoryCheckmark;
    
    if(indexPath.section == 0){
        cell.accessoryType = UITableViewCellStyleSubtitle;
    }
    else if(indexPath.section == 1){
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    }
    else if(indexPath.section == 2){
        cell.accessoryType = UITableViewCellAccessoryDetailButton;
    }
    else{
        cell.accessoryType = UITableViewCellAccessoryDetailDisclosureButton;
    }
    return cell;
}

#pragma mark 返回tableView的分区数,非必须
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return  2;
}

#pragma mark 设置分区头标题
-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    return self.titlearray[section];
}

-(NSString *)tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section{
    return @"分区尾";
}

#pragma mark 设置分区头尾的高度
-(CGFloat)tableView:(UITableView *)tableView estimatedHeightForHeaderInSection:(NSInteger)section{
    return 10;
}

#pragma mark 返回右侧索引
-(NSArray *)sectionIndexTitlesForTableView:(UITableView *)tableView{
    return self.titlearray;
}

#pragma mark  返回自定义分区头尾
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    UIView *aView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 200, 20)];
    aView.backgroundColor = [UIColor greenColor];
    [self.view addSubview:aView];
    [aView release];
    return aView;
}

#pragma mark 返回当前单元格的高度
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section ==1 &&indexPath.row ==0) {
        return 150;
    }
    return 50;
}

#pragma UITableView的点击事件
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    DetailViewController *detail = [[DetailViewController alloc]init];
    [self.navigationController pushViewController:detail animated:YES];
    detail.textField = [NSString stringWithFormat:@"section:%ld,row:%ld",indexPath.section,indexPath.row];
    NSLog(@"section:%ld,row:%ld",indexPath.section,indexPath.row);
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
