//
//  FBDefineObject.h
//  SecondhandCar
//
//  Created by FBI on 16/6/17.
//  Copyright © 2016年 FBI. All rights reserved.
//

#import <Foundation/Foundation.h>
#ifdef DEBUG
#define DLog(fmt, ...) NSLog((@"%s [Line %d] " fmt), __PRETTY_FUNCTION__, __LINE__, ##__VA_ARGS__);
#else
#define DLog(...)
#endif

static NSString  *hostURL=@"https://route.showapi.com/";
static NSString *appID=@"19285";
static NSString *appSecret=@"31596ceab92740179ce84c1662be6eba";

@interface FBDefineObject : NSObject

@end
