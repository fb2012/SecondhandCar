//
//  FBNetWork.m
//  SecondhandCar
//
//  Created by FBI on 16/6/17.
//  Copyright © 2016年 FBI. All rights reserved.
//

#import "FBNetWork.h"
#import "AFNetworking.h"
#import <CommonCrypto/CommonDigest.h>
@implementation FBNetWork
+(instancetype)installNetWork
{
    static FBNetWork *install=nil;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        install=[[FBNetWork alloc]init];
    });
    return install;
    
}
/**
 *  post请求
 *
 *  @param body    参数
 *  @param action  接口名
 */
-(void)postRequestBody:(NSDictionary *)body andAction:(NSString *)action andSuccess:(void(^)(NSDictionary *resultDict))success andFail:(void(^)(NSString *errStr,id errorObj))fail
{
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.responseSerializer = [AFJSONResponseSerializer serializer];
    manager.requestSerializer=[AFJSONRequestSerializer serializer];
    [manager.requestSerializer setTimeoutInterval:60];
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithArray:@[@"text/plain",@"text/json",@"text/javascript",@"application/json",@"text/html"]];
    
    
    [manager POST:[NSString stringWithFormat:@"%@%@",hostURL,action] parameters:[self paramsPin:body] progress:^(NSProgress * _Nonnull uploadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        DLog(@"response==%@",responseObject);
        
        success(responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        DLog(@"error=%@",error.description);
        
        fail(error.description,@"");
    }];

    
    
    
}

-(NSDictionary *)paramsPin:(NSDictionary *)params
{
    NSMutableDictionary *theTemp=[NSMutableDictionary dictionaryWithCapacity:2];
    if(params)
    {
        [theTemp setDictionary:params];
    }
    [theTemp setObject:appID forKey:@"showapi_appid"];
    [theTemp setObject:[self showapi_timestamp] forKey:@"showapi_timestamp"];

    //签名
    NSString *theSign=[self dictionUtils:theTemp];
    theSign=[self md5HexDigest:theSign];
    if(theSign)
    {
        [theTemp setObject:theSign forKey:@"showapi_sign"];
    }else
    {
        [theTemp setObject:appSecret forKey:@"showapi_sign"];

    }
    

    
    return theTemp;
}
-(NSString *)showapi_timestamp
{
    
    NSString *theTime=@"20161114142239";
    NSDateFormatter *theDateFormat=[[NSDateFormatter alloc]init];
    theDateFormat.dateFormat=@"yyyyMMddHHmmss";
    
    theTime= [theDateFormat stringFromDate:[NSDate date]];
    if(theTime)
    return theTime;
    
    return @"20161114142239";
    
    
    
    
}

-(NSString *)dictionUtils:(NSDictionary *)params
{
    NSString *theTempStr=@"";
   NSArray *theArr=[[params allKeys] sortedArrayUsingSelector:@selector(compare:)];
   for(NSString *dictKey in theArr)
   {
       
       theTempStr=[NSString stringWithFormat:@"%@%@%@",theTempStr,dictKey,params[dictKey]];
   }
    return [NSString stringWithFormat:@"%@%@",theTempStr,appSecret];
    
    
    
}
- (NSString *)md5HexDigest:(NSString*)input
{
    const char* str = [input UTF8String];
    unsigned char result[CC_MD5_DIGEST_LENGTH];
    CC_MD5(str, (int)strlen(str), result);
    NSMutableString *ret = [NSMutableString stringWithCapacity:CC_MD5_DIGEST_LENGTH*2];//
    
    for(int i = 0; i<CC_MD5_DIGEST_LENGTH; i++) {
        [ret appendFormat:@"%2s",result];
    }
    return ret;
}
@end
