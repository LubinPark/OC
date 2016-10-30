//
//  RootViewController.m
//  UI20_UICollectionView
//
//  Created by 芦彬 on 15/9/24.
//  Copyright (c) 2015年 芦彬. All rights reserved.
//

#import "RootViewController.h"
#import "FirstCollectionReusableView.h"
#import "FirstCollectionViewCell.h"

#warning 注意:UICollectionView需要遵循2个协议UICollectionViewDataSource,UICollectionViewDelegate
@interface RootViewController ()<UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout>

/**
 *  数据源
 */
@property (nonatomic,retain)NSArray *array;

@end

@implementation RootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //开始解析
    [self loadData];
    
    // 创建一个UICollectionView
    [self createACollectionView];
}

#pragma mark 解析数据
- (void)loadData{
    self.array = [NSArray array];
    NSString *str = [[NSBundle mainBundle]pathForResource:@"Data" ofType:@"json"];
    NSData *data = [NSData dataWithContentsOfFile:str];
    self.array = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:nil];
}

#pragma mark 创建一个UICollectionView
- (void)createACollectionView{
    
    //1.创建UICollectionView的布局
    //FlowLayout 网格布局或流式布局
    //UICollectionView的瀑布流(调研内容)
    UICollectionViewFlowLayout *firstFlowLayout = [[UICollectionViewFlowLayout alloc]init];
    
    //单元格最小行间距
    //firstFlowLayout.minimumLineSpacing = 12.5;
    
    //最小的左右间距
    //firstFlowLayout.minimumInteritemSpacing = 5;
    
    //设置单元格大小
    //firstFlowLayout.itemSize = CGSizeMake(self.view.frame.size.width / 2 - 22.5, 250);
    
    //设置水平方向滑动(默认为垂直方向)
    //firstFlowLayout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    
    //firstFlowLayout.sectionInset = UIEdgeInsetsMake(5, 5, 5, 5);
    
    //2.创建UICollectionView
    UICollectionView *firstCollectionView = [[UICollectionView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width - 0, self.view.frame.size.height) collectionViewLayout:firstFlowLayout];
    
    firstCollectionView.backgroundColor = [UIColor whiteColor];
    
    //3.指定代理人
    firstCollectionView.delegate = self;
    firstCollectionView.dataSource = self;
    
    //4.添加到self.view上
    [self.view addSubview:firstCollectionView];
    [firstCollectionView release];
    
    //5.注册单元格
#warning 注意:如果使用自定义的cell,那么注册的应该是自定义的类名 
    //关键字: register
    //参数说明:1.要使用的cell类型  2.重用标识
    [firstCollectionView registerClass:[FirstCollectionViewCell class] forCellWithReuseIdentifier:@"firstCollection"];
    
#pragma mark 注意:使用自定义头尾视图的视图,需要注册自定义类型
    //注册头视图 参数说明:1.要注册的视图类型 2.注册的视图类型(头/尾) 3.重用标识
    //[firstCollectionView registerClass:[UICollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"headerView"];
    [firstCollectionView registerClass:[FirstCollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"headerView"];
    
    //注册尾视图 参数说明:1.要注册的视图类型 2.注册的视图类型(头/尾) 3.重用标识
    [firstCollectionView registerClass:[UICollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:@"footerView"];
}

#pragma mark 返回分区数
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 2;
}

#warning 注意 单元格的点击事件
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    NSLog(@"%ld,%ld",indexPath.section,indexPath.item);
    //这里row 和item一样
}

#pragma mark 返回头视图/尾视图 通过kind判断
- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath{
    if (kind == UICollectionElementKindSectionHeader) {
        //自定义头视图.解开就是基本
        //UICollectionReusableView *resuableView = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"headerView" forIndexPath:indexPath];
        FirstCollectionReusableView *resuableView = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"headerView" forIndexPath:indexPath];
        return resuableView;
    }
    else{
        UICollectionReusableView *resuableView = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:@"footerView" forIndexPath:indexPath];
        resuableView.backgroundColor = [UIColor purpleColor];
        return resuableView;
    }
}
#pragma mark 返回头尾视图的大小
-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section{
    return CGSizeMake(self.view.frame.size.width, 100);
}

#pragma mark  返回为试图的大小
-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForFooterInSection:(NSInteger)section{
    return CGSizeMake(self.view.frame.size.width, 100);
}

#pragma mark 返回最小单元格间距
- (CGFloat) collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section{
    return 5;
}

#pragma mark 返回行间距
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section{
    return 15;
}

#pragma mark 返回单元格大小
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    return CGSizeMake(375/ 2 - 30, 667 / 3);
}

#pragma mark 返回单元格边缘间距
- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section{
    return UIEdgeInsetsMake(20, 20, 20, 20);
}

#warning 必须实现的协议方法:返回单元个数量
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return self.array.count;
}

#warning 必须实现的协议方法:返回单元格
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    FirstCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"firstCollection" forIndexPath:indexPath];
    cell.backgroundColor = [UIColor blackColor];
    
    NSDictionary *dic = [self.array objectAtIndex:indexPath.row];
    cell.pictureURL = dic[@"thumbURL"];
    cell.currentSection = [NSString stringWithFormat:@"section = %ld, row = %ld",indexPath.section,indexPath.row];
    
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
