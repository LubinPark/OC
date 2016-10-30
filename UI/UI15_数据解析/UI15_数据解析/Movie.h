//
//  Movie.h
//  UI15_数据解析
//

#import <Foundation/Foundation.h>

@interface Movie : NSObject

@property (nonatomic,copy)NSString *movieName;

//首页下面滚动视图接口：http://mapi.damai.cn/proj/HotProj.aspx?cityid=852&source=10099&version=50101

//电影院的接口        http://movieapi.m.damai.cn/Movie/Show/GetCinema.aspx?beginTime=15-09-17%2000%3A00%3A00&cityID=852&distID=0&endTime=15-09-18%2000%3A00%3A00&filmID=1013975&lat=38.88339817914116&lng=121.5447935591803&source=10099&type=0&version=50200
@end
