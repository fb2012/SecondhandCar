//
//  FBCarNewsModel.m
//  SecondhandCar
//
//  Created by FBI on 16/6/20.
//  Copyright © 2016年 FBI. All rights reserved.
//

#import "FBCarNewsModel.h"

@implementation FBCarNewsModel

-(instancetype)initWithDict:(NSDictionary *)dict
{
    if(self=[super init])
    {
        self.theDes=[FBUnilts emptyFormateData:dict[@"desc"]];
        self.theImages=[NSMutableArray array];
        
        if([dict[@"imageurls"] isKindOfClass:[NSArray class]])
        {
            for(id theImgs in dict[@"imageurls"])
            {
                if([theImgs isKindOfClass:[NSDictionary class]])
                {
                    [self.theImages addObject:[FBUnilts emptyFormateData: theImgs[@"url"]]];
                    
                }
                
            }
        }
        
        
        self.theSource=[FBUnilts emptyFormateData:dict[@"source"]];
        self.thePubDate=[FBUnilts emptyFormateData:dict[@"link"]];
        self.theContent=[FBUnilts emptyFormateData:dict[@"content"]];
        self.thePubDate=[FBUnilts emptyFormateData:dict[@"pubDate"]];
        self.theTitle=[FBUnilts emptyFormateData:dict[@"title"]];
        self.theAllListImg=[NSMutableArray array];
        if([dict[@"allList"] isKindOfClass:[NSArray class]])
        {
            for(id objImg in dict[@"allList"])
            {
                if([objImg isKindOfClass:[NSDictionary class]])
                {
                    [self.theAllListImg addObject:[FBUnilts emptyFormateData:objImg[@"url"]]];
                    
                }
            }
        }
        
        
    }
    return self;
    
}

+(void)getNewsList:(NSString *)channelID andPage:(NSInteger)page andSuccess:(void(^)(NSArray *resultArr,BOOL isNextpage))success andFail:(void(^)(NSString *errStr,id errObj))fail
{
    if(channelID&&page)
    {
        
        [[FBNetWork installNetWork] postRequestBody:@{@"channelId":channelID,@"page":[NSNumber numberWithInteger:page],@"needContent":@"1",@"needHtml":@"2"} andAction:@"109-35" andSuccess:^(NSDictionary *resultDict) {
            
            NSMutableArray *theTempArr=[NSMutableArray array];
            if([resultDict[@"pagebean"] isKindOfClass:[NSDictionary class]])
            {
                for(NSDictionary *conDict in resultDict[@"pagebean"][@"contentlist"])
                {
                    FBCarNewsModel *carNes=[[FBCarNewsModel alloc]initWithDict:conDict];
                    [theTempArr addObject:carNes];
                }
                success(theTempArr,page<[resultDict[@"pagebean"][@"allPages"] integerValue]);
                
                
            }else
            {
                fail(fbSystemMes,@"");

            }
            
            
        } andFail:^(NSString *errStr, id errorObj) {
            [FBTools showHUDMessage:errStr];
            fail(errStr,errorObj);
        }];
        
    }
}
@end
