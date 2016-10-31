
//
//  Student.m
//  OC10_高级内存管理
//

#import "Student.h"

@implementation Student

@synthesize name =_name;
@synthesize sex = _sex;
@synthesize number = _number;

-(void)dealloc{
    NSLog(@"Student注销成功");
    
    //对属性进行释放时,使用下划线加属性名
    [_sex release];
    [_number release];
    
    //切记:一定要调用父类的dealloc 的方法, 并且写到最后一行
    [super dealloc];
}

-(NSString *)name{
    return _name;
}

-(void)setName:(NSString *)name{
    _name = name;
}


-(NSString *)sex{
    return [[_name retain]autorelease];
}

-(void)setSex:(NSString *)sex{
    if (_sex != sex) {
        [_sex release];
        _sex = [sex copy];
    }
}

-(NSString *)number{
    return [[_number retain]autorelease];
}

-(void)setNumber:(NSString *)number{
    if (_number !=number) {
        [_number release];
        _number = [number retain];
    }
}

-(id)initWithName:(NSString *)name andSex:(NSString *)sex andNumber:(NSString *)number{
    self = [super init];
    if (self) {
        _name = name;
        _sex = sex;
        _number = number;
    }
    return self;
}

+(Student *)studentWithName:(NSString *)name andSex:(NSString *)sex andNumber:(NSString *)number{
    Student *student = [[Student alloc]initWithName:name andSex:sex andNumber:number];
    return [student autorelease];
}

-(void)showMyPhone:(Mobile *)mobile{
    [mobile show];
}

@end
