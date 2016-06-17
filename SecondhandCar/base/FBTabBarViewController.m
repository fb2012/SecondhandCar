//
//  FBTabBarViewController.m
//  SecondhandCar
//
//  Created by FBI on 16/6/17.
//  Copyright © 2016年 FBI. All rights reserved.
//

#import "FBTabBarViewController.h"
#import "FBNavigationViewController.h"
#import "FBMysViewController.h"
#import "FBCarsViewController.h"
#import "FBCarNewsViewController.h"

@interface FBTabBarViewController ()

@end

@implementation FBTabBarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    FBCarNewsViewController *carNews=[[FBCarNewsViewController alloc]init];
    FBNavigationViewController *navCarnews=[[FBNavigationViewController alloc]initWithRootViewController:carNews];
    navCarnews.title=@"车动态";
    
    FBCarsViewController *car=[[FBCarsViewController alloc]init];
    FBNavigationViewController *navCars=[[FBNavigationViewController alloc]initWithRootViewController:car];
    navCars.title=@"车来了";
    
    
    FBMysViewController *mys=[[FBMysViewController alloc]init];
    FBNavigationViewController *navMys=[[FBNavigationViewController alloc]initWithRootViewController:mys];
    navMys.title=@"我的车";
    self.viewControllers=@[navCarnews,navCars,navMys];
    
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
