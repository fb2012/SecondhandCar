//
//  FBCarNewsModel.h
//  SecondhandCar
//
//  Created by FBI on 16/6/20.
//  Copyright © 2016年 FBI. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FBCarNewsModel : NSObject
@property(strong,nonatomic)NSString *theTitle;
@property(strong,nonatomic)NSString *theContent;
@property(strong,nonatomic)NSString *thePubDate;
@property(strong,nonatomic)NSMutableArray *theImages;
@property(strong,nonatomic)NSString *theDes;
@property(strong,nonatomic)NSString *theSource;
@property(strong,nonatomic)NSString *link;
@property(strong,nonatomic)NSMutableArray *theAllListImg;

-(instancetype)initWithDict:(NSDictionary *)dict;


+(void)getNewsList:(NSString *)channelID andPage:(NSInteger)page andSuccess:(void(^)(NSArray *resultArr,BOOL isNextpage))success andFail:(void(^)(NSString *errStr,id errObj))fail;

@end
