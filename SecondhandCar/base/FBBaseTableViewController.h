//
//  FBBaseTableViewController.h
//  SecondhandCar
//
//  Created by FBI on 16/6/17.
//  Copyright © 2016年 FBI. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MJRefresh.h"

@interface FBBaseTableViewController : UITableViewController



-(void)addRefreshHead;
-(void)addRefresFooder;
-(void)requestHeaderData;

-(void)requestFooderData;

@end
