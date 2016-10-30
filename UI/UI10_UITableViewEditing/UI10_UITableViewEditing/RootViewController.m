//
//  RootViewController.m
//  UI10_UITableViewEditing
//

#import "RootViewController.h"
#import "Contact.h"
@interface RootViewController ()<UITableViewDelegate,UITableViewDataSource>

@end

@implementation RootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.sectionArray = [NSMutableArray array];
    
    self.tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, 375, 667) style:UITableViewStyleGrouped];
    [self.view addSubview:self.tableView];
    
    Contact *contant1 = [Contact contactWithName:@"张三" andPhoneNumber:@"13004790001"];
    Contact *contant2 = [Contact contactWithName:@"李四" andPhoneNumber:@"13004790002"];
    
    self.array = [NSMutableArray arrayWithObjects:contant1, contant2, nil];
    [contant1 release];
    [contant2 release];
    [self.sectionArray addObject:self.array];
    
    Contact *contant3 = [Contact contactWithName:@"王五" andPhoneNumber:@"13004790003"];
    Contact *contant4 = [Contact contactWithName:@"赵六" andPhoneNumber:@"13004790004"];
    Contact *contant5 = [Contact contactWithName:@"小七" andPhoneNumber:@"13004790005"];

    //第二个分组
    NSMutableArray *secondArray = [[NSMutableArray alloc]initWithObjects:contant3, contant4, contant5,nil];
    
    [contant3 release];
    [contant4 release];
    [contant5 release];
    
    [self.sectionArray addObject:secondArray];
    
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    
    [secondArray release];
    [self.tableView release];
    // Do any additional setup after loading the view.
}

#pragma mark 返回当前分组下的行数
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    //获得当前分组下的成员数组
    NSArray *arr =[self.sectionArray objectAtIndex:section];
    return arr.count;
//    return [self.secondArray[section] count];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *cellIdentifier = @"cellIdentifier";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle
                                     reuseIdentifier:cellIdentifier];
    }
    //获得当前分组
    NSArray *arr = [self.sectionArray objectAtIndex:indexPath.section];
    //获得当前分组内的当前联系人
    //Contact *contact = (Contact *)self.array[indexPath.row];
    Contact *contact = (Contact *)[arr objectAtIndex:indexPath.row];
    
    cell.textLabel.text = contact.name;
    cell.detailTextLabel.text = contact.phoneNumber;
    
    //添加编辑按钮 UIViewController内只有的自带editButtonItem按钮
    self.navigationItem.rightBarButtonItem = self.editButtonItem;

    return cell;
    
}
#pragma mark 第一步:让TableView进入编辑状态
-(void)setEditing:(BOOL)editing animated:(BOOL)animated{
    NSLog(@"进入编辑");
    //第一步:让TableView进入编辑状态
    [self.tableView setEditing:YES animated:YES];
}
#pragma mark 第二步:指定某行是否可以编辑
-(BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath{
    //指定第一行可编辑,第二行不可编辑
//    if (indexPath.row == 0) {
//        return YES;
//    }
//    else{
//        return NO;
//    }
    return YES;
}

#pragma mark 第三步:指定某行的编辑样式
-(UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row == 1) {
        //制定每个分区内第2行为插入样式
        return UITableViewCellEditingStyleInsert;
    }
    return UITableViewCellEditingStyleDelete;
}

#pragma mark  第四步:让TableView进入编辑状态
//参数:第一个参数:当前tableView
//             :当前的编辑样式( UITableViewCellEditingStyleNone,
//                           UITableViewCellEditingStyleDelete,
//                           UITableViewCellEditingStyleInsert)
-(void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath{
    //判断编辑样式
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        //进入删除编辑模式
#pragma mark 先删除数据,再更改UI
        //NSMutableArray *arr =[self.sectionArray objectAtIndex:indexPath.section];
        //移除当前分组内的成员 index.row
        [[self.sectionArray objectAtIndex:indexPath.section] removeObjectAtIndex:indexPath.row];
        //[self.array removeObjectAtIndex:indexPath.row];
        [self.tableView deleteRowsAtIndexPaths:[NSArray arrayWithObjects:indexPath, nil] withRowAnimation:UITableViewRowAnimationMiddle];
    }
    else{
        NSLog(@"非删除模式");
        //添加数据 添加新联系人信息
        Contact *contact = [[Contact alloc]initWithName:@"小吧" andPhoneNumber:@"13004790006"];
        //获得当前分组
        NSMutableArray *arr = [self.sectionArray objectAtIndex:indexPath.section];
        [arr addObject:contact];
        
        //插入的修改UI方法
        [self.tableView insertRowsAtIndexPaths:[NSArray arrayWithObjects:indexPath, nil] withRowAnimation:UITableViewRowAnimationLeft];
    }
}


#pragma  mark (移动)第二步,指定某行是否可移动
-(BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath{
    return YES;
}

#pragma mark (移动)第三步:移动实现
//参数说明:1.当前tableView
//        2.要移动的行sourceIndexPath
//        3.移动到的行toIndexPath
-(void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)sourceIndexPath toIndexPath:(NSIndexPath *)destinationIndexPath{
    //先进行数据交换
    [self.array exchangeObjectAtIndex:sourceIndexPath.row withObjectAtIndex:destinationIndexPath.row];

    //更改UI
    [self.tableView moveRowAtIndexPath:sourceIndexPath toIndexPath:destinationIndexPath];
}

#pragma mark 监测跨区交换
- (NSIndexPath *)tableView:(UITableView *)tableView targetIndexPathForMoveFromRowAtIndexPath:(NSIndexPath *)sourceIndexPath toProposedIndexPath:(NSIndexPath *)proposedDestinationIndexPath{
    //判断当前移动的是否是相同区
    if (sourceIndexPath.section == proposedDestinationIndexPath.section) {
        //为相同区
        //返回目标位置
        return proposedDestinationIndexPath;
    }
    else{
        //如果不在相同区,那么返回现在的位置
        return  sourceIndexPath;
    }
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 2;
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
