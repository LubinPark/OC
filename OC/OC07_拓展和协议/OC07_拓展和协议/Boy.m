//
//  Boy.m
//  OC07_拓展和协议
//

#import "Boy.h"

@implementation Boy 

-(void) sendMarryInformation{
    
    Girl *girl = [[Girl alloc]init];
    
    //5签订协议
    girl.delegate = self;
    [girl receiveMarrayInformation];
}

//6女孩得监督你去赚钱
-(void)makeMoney{
    NSLog(@"努力赚钱!");
}

-(void)cook{
    NSLog(@"IXN");
}

@end
