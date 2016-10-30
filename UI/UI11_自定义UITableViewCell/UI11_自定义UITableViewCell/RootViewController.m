//
//  RootViewController.m
//  UI11_自定义UITableViewCell
//

#import "RootViewController.h"
#import "FirstTableViewCell.h"
#import "SecondTableViewCell.h"
#import "Contact.h"

@interface RootViewController ()<UITableViewDelegate,UITableViewDataSource>
/**
 *  通常将UITableView设置成属性,以便后期对tableView进行刷新操作(reloadData)
 */
@property(nonatomic, retain) UITableView *tableView;
/**
 *  总的大字典存储所有的数据.以后用到的所有数据都在这取
 */
@property(nonatomic, retain) NSDictionary *addressBookDic;

@property(nonatomic, retain) NSArray *sectionArry;

@end

@implementation RootViewController

-(void)dealloc{
    [_tableView release];
    [_addressBookDic release];
    [_sectionArry release];
    [super dealloc];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    //找到文件路径
    NSString *path = [[NSBundle mainBundle] pathForResource:@"Class25ContactList" ofType:@"plist"];
    //解析文件数据,文件解析出来跟数据是数据结构是什么,就创建什么类型用来接收
    self.addressBookDic = [[NSMutableDictionary alloc]initWithDictionary:[NSDictionary dictionaryWithContentsOfFile:path]];

    //获取所有key值 然后将得到的数据进行升序排序,然后转换成可变数组
    self.sectionArry = [[[NSMutableArray alloc]initWithArray:[self.addressBookDic allKeys]]sortedArrayUsingSelector:@selector(compare:)];
    
    self.tableView  = [[UITableView alloc]initWithFrame:self.view.frame style:UITableViewStyleGrouped];
    [self.view addSubview:self.tableView];
    
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
}

#pragma mark    返回分组数
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return self.sectionArry.count;
}

#pragma mark 分组标题
-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    return [self.sectionArry objectAtIndex:section];
}

#pragma mark    必须实现的方法:返回每个分区的行数
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    //获得当前通讯录字典中的每个分组
    NSArray *array = [self.addressBookDic objectForKey:[self.sectionArry objectAtIndex:section]];
    return array.count;
}

#pragma mark    必须实现的方法:返回每行的单元格(cell)
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    FirstTableViewCell *firstCell = [FirstTableViewCell firstTableViewCellWithTable:tableView];
    SecondTableViewCell *secondCell = [SecondTableViewCell secondTableViewCellWithTable:tableView];
    
    //解析数据,获得每一条联系人信息
    NSArray *array = [self.addressBookDic objectForKey:[self.sectionArry objectAtIndex:indexPath.section]];
    
    //获得分组下单个联系人字典
    NSDictionary *dic = [array objectAtIndex:indexPath.row];
    
    //通过联系人字典,获得联系人对象
    Contact *contact = [Contact contactWithDictionary:dic];

    [self.view addSubview:firstCell];
    [self.view addSubview:secondCell];
    
    if ([contact.gender isEqualToString:@"女"]) {
        secondCell.contact =contact;
        return secondCell;
    }
    else{
        firstCell.contact = contact;
        return firstCell;
    }
}

#warning 重要:返回当前行高
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    //解析数据,获得每一条联系人信息
    NSArray *array = [self.addressBookDic objectForKey:[self.sectionArry objectAtIndex:indexPath.section]];
    
    //获得分组下单个联系人字典
    NSDictionary *dic = [array objectAtIndex:indexPath.row];
    
    //通过联系人字典,获得联系人对象
    Contact *contact = [Contact contactWithDictionary:dic];
    
    CGFloat height = [SecondTableViewCell heightOfLabel:contact.hobby andTextFont:[UIFont systemFontOfSize:17] andLabelWidth:200];
    return 115 + height;
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
