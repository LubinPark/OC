//
//  RootViewController.m
//  UI15_数据解析
//
//  Created by dllo on 15/9/17.
//  Copyright (c) 2015年 蓝鸥科技. All rights reserved.
//

#import "RootViewController.h"
#import "Sutdent.h"
#import "GDataXMLNode.h"
#import "Movie.h"
#import "MovieTableViewCell.h"

//遵循代理 SAX解析代理NSXMLParserDelegate
@interface RootViewController ()<NSXMLParserDelegate,UITableViewDelegate,UITableViewDataSource>
/**
 *  创建一个学生数组
 */
@property(nonatomic,retain)NSMutableArray *studentArray;
/**
 *  记录当前节点
 */
@property(nonatomic,copy)NSString  *currentElement;

@property(nonatomic ,retain)NSMutableArray *movieList;

@property (nonatomic,retain)UILabel *nameLabel;

@end

@implementation RootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor orangeColor];
    
    NSArray *array = @[@"SAX解析",@"DOM解析",@"JSON解析"];
    for (int i = 1; i < 4; i++) {
        UIButton *button =[UIButton buttonWithType:UIButtonTypeCustom];
        button.frame = CGRectMake(15 + 120 * (i - 1), 100, 100, 50);
        button.backgroundColor = [UIColor greenColor];
        button.tag = i;
        [button setTitle:array[i - 1] forState:UIControlStateNormal];
        [button addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:button];
    }
}

-(void)buttonAction:(UIButton *)sender{
    switch (sender.tag) {
        case 1:
            //进行sax数据解析
            [self xmlSax];
            break;
        case 2:
            //进行dom数据解析
            [self xmlDom];
            break;
        case 3 :
            //进行json数据解析
            [self json];
            break;
            
        default:
            break;
    }
}

#pragma mark sax 数据解析实现

-(void)xmlSax{
    //设置文件路径
    NSString *path = [[NSBundle mainBundle]pathForResource:@"Students" ofType:@"txt"];
    //读取文件内容
    NSData *data = [NSData dataWithContentsOfFile:path];
#pragma 进行XML数据解析(sax)
    //1创建一个SAX解析工具
    NSXMLParser *xmlParser = [[NSXMLParser alloc]initWithData:data];
    //2.指定xml解析代理为self
    xmlParser.delegate = self;
    //3.开始XML解析
    [xmlParser parse];
}

//第4步,开始解析文件
-(void)parserDidStartDocument:(NSXMLParser *)parser{
    NSLog(@"parser开始解析文件");
    
    //开始解析文件时,初始化学生数组
    self.studentArray = [[NSMutableArray alloc]init];
}

#pragma mark 第5步:开始读节点
-(void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName attributes:(NSDictionary *)attributeDict{
    NSLog(@"开始解析节点,%@",elementName);
    //如果当前节点是stu,说明接下来解析的时一个学生的信息
    if ([elementName isEqualToString:@"stu"]) {
        //创建学生对象
        Sutdent *stu = [[Sutdent alloc]init];
        //加入学生数组
        [self.studentArray addObject:stu];
        [stu release];
    }
    //记录当前节点
    self.currentElement = elementName;
}

#pragma mark 第6步:开始读每个节点内的具体值
-(void)parser:(NSXMLParser *)parser foundCharacters:(NSString *)string{
    NSLog(@"节点间的值%@",string);
    //找到当前对象
    Sutdent *student = [self.studentArray lastObject];
    //判断当前节点为特定值,为特定属性赋值
    /*
    if([self.currentElement isEqualToString:@"number"]){
        student.number = string;
    }else if ([self.currentElement isEqualToString:@"name"]){
        student.name = string;
    }else if ([self.currentElement isEqualToString:@"time"]){
        student.time = string;
    }else{
        student.address = string;
    }*/
    if (![self.currentElement isEqualToString:@"stu"]) {
        [student setValue:string forKey:self.currentElement];
    }
}

#pragma mark 第7步:当前节点结束
-(void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName{
    NSLog(@"当前节点结束%@",elementName);
    self.currentElement = nil;
}

#pragma mark 第8步:当前节点结束
-(void)parserDidEndDocument:(NSXMLParser *)parser{
    NSLog(@"结束解析");
    for (Sutdent *stu in self.studentArray) {
        NSLog(@"%@,%@",stu.name,stu.address);
    }
}

#pragma mark SAX和DAM解析的区别
/*
 Sax:特点:逐行进行解析
     优点:可以读取较大文件
     缺点:使用不灵活,耗时,直到最后一个根节点才结束解析
 
 Dom:特点:将文件转换成树形结构进行解析
     优点:可以快速定位某个节点间的值
     缺点:不能读取较大文件
 */

/*************** XML DOM解析  ***************/
#pragma mark XML DOM解析
-(void)xmlDom{
    //1.设置文件路径
    NSString *path = [[NSBundle mainBundle]pathForResource:@"Students" ofType:@"txt"];
    //2.读取文件内容
    NSData *data = [NSData dataWithContentsOfFile:path];
    //开始解析
    NSError *error =nil;
    //1.创建dom解析工具
    GDataXMLDocument *xmlDom = [[GDataXMLDocument alloc]initWithData:data options:nil error:&error];
    NSLog(@"%@",error);
    //2.找到根节点
    GDataXMLElement *rootElement = xmlDom.rootElement;
    //初始化学生数组
    self.studentArray = [[NSMutableArray alloc]init];

    //NSLog(@"%@",rootElement);
    for (GDataXMLElement *subElement in rootElement.children) {
        if ([subElement.name isEqualToString:@"stu"]) {
            //创建一个学生对象
            Sutdent *stu = [[Sutdent alloc]init];
            for (GDataXMLElement *element in subElement.children) {
                //学生对应属性赋值
                //节点值element.stringValue
                //节点名.element.name
                //当前节点的子节点(数组)ele.children
                [stu setValue:element.stringValue forKey:element.name];
            }
            //将解析之后的学生,添加到学生数组中
            [self.studentArray addObject:stu];
        }
    }
    for (Sutdent *stu in self.studentArray) {
        NSLog(@"%@,%@,在%@,不见不散!",stu.name,stu.time,stu.address);
    }
}


#pragma mark JSON解析(Foundation框架)
-(void)json{
    //设置文件路径
    NSString *path = [[NSBundle mainBundle]pathForResource:@"movielist" ofType:@"txt"];
    //读取文件内容
    NSData *data = [NSData dataWithContentsOfFile:path];
    
    //创建字典用来接收解析后的内容
    NSDictionary *dictionary = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableLeaves error:nil];
    
    //NSLog(@"%@",dictionary);
    self.movieList = [[NSMutableArray alloc]init];
    for (NSDictionary *dic in [dictionary objectForKey:@"result"]) {
        Movie *moive = [[Movie alloc]init];
        [moive setValuesForKeysWithDictionary:dic];
        [self.movieList addObject:moive];
        [moive release];
    }
    
//    self.nameLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 100, 50)];
//    self.nameLabel.backgroundColor = [UIColor grayColor];
//    [self.view addSubview: self.nameLabel];
//    [self.nameLabel release];
    
    UITableView *tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 64, self.view.frame.size.width, self.view.frame.size.height - 64) style:UITableViewStylePlain];
    [self.view addSubview:tableView];
    
    tableView.delegate = self;
    tableView.dataSource = self;
    
    
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.movieList.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *cellIdentify = @"cellIdentify";
    MovieTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentify];
    if (!cell) {
        cell = [[MovieTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentify];
    }
    Movie *movie = [[Movie alloc]init];
    movie = self.movieList[indexPath.row];
    cell.labelText = movie.movieName;

    return cell;
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
