//
//  FBUnilts.m
//  SecondhandCar
//
//  Created by FBI on 16/6/20.
//  Copyright © 2016年 FBI. All rights reserved.
//

#import "FBUnilts.h"

@implementation FBUnilts
+(NSString *)emptyFormateData:(id)obj
{
    if (obj == nil || obj == [NSNull null] ||
        ([obj isKindOfClass:[NSString class]] && [obj length] == 0))
    {
        return @"";
    }
    else if ([obj isKindOfClass:[NSNumber class]])
    {
        return [obj stringValue];
    }
    return obj;
    
}
@end
