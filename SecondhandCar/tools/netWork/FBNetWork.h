//
//  FBNetWork.h
//  SecondhandCar
//
//  Created by FBI on 16/6/17.
//  Copyright © 2016年 FBI. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FBNetWork : NSObject


+(instancetype)installNetWork;
/**
 *  post请求
 *
 *  @param body    参数
 *  @param action  接口名
 */
-(void)postRequestBody:(NSDictionary *)body andAction:(NSString *)action andSuccess:(void(^)(NSDictionary *resultDict))success andFail:(void(^)(NSString *errStr,id errorObj))fail;

@end
