//
//  Boy.h
//  OC07_拓展和协议
//

#import <Foundation/Foundation.h>
#import "Girl.h"
@interface Boy : NSObject <GirlDelegate>

-(void)sendMarryInformation;

@end
