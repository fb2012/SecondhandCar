//
//  FBTools.m
//  SecondhandCar
//
//  Created by FBI on 16/6/20.
//  Copyright © 2016年 FBI. All rights reserved.
//

#import "FBTools.h"
#import "MBProgressHUD/MBProgressHUD.h"

@implementation FBTools
+(void)showHUD:(NSString *)mes
{
     [MBProgressHUD showHUDAddedTo:[UIApplication sharedApplication].keyWindow animated:YES];
   ;
    
}
+(void)hideHUD
{
    //MBProgressHUD *hud=[[UIApplication sharedApplication].keyWindow viewWithTag:1999999];
    dispatch_async(dispatch_get_main_queue(), ^{
        [MBProgressHUD hideHUDForView:[UIApplication sharedApplication].keyWindow animated:YES];
    });
}

+(void)showHUDMessage:(NSString *)mes
{
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:[UIApplication sharedApplication].keyWindow animated:YES];
    hud.mode = MBProgressHUDModeText;
    hud.label.text = mes;
    [hud hideAnimated:YES afterDelay:1];

}
@end
