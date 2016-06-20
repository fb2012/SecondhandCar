//
//  FBCarNewsViewController.m
//  SecondhandCar
//
//  Created by FBI on 16/6/17.
//  Copyright © 2016年 FBI. All rights reserved.
//

#import "FBCarNewsViewController.h"
#import "FBCarNewsModel.h"
@interface FBCarNewsViewController ()
@property(strong,nonatomic)NSMutableArray *theDataArr;
@property(assign,nonatomic)NSInteger thePage;

@end

@implementation FBCarNewsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.thePage=1;
    self.theDataArr=[NSMutableArray array];
    
    [self addRefreshHead]; 
    [self addRefresFooder];
    
    [self.tableView.mj_header beginRefreshing];
    
    
    // Do any additional setup after loading the view.
}

-(void)requestHeaderData 
{
    self.thePage=1;
    
    [self reqeustData];
    
}
-(void)requestFooderData
{
    [self reqeustData];
}
-(void)reqeustData
{
    __weak FBCarNewsViewController *carNews=self;
    
    [FBCarNewsModel getNewsList:@"5572a108b3cdc86cf39001d3" andPage:_thePage andSuccess:^(NSArray *resultArr, BOOL isNextpage) {
        if(carNews.thePage==1)
        {
            [carNews.theDataArr removeAllObjects];
            [carNews.theDataArr addObjectsFromArray:resultArr];
            
        }else
        {
            [carNews.theDataArr addObjectsFromArray:resultArr];
            
        }

        if(isNextpage)
        {
            carNews.thePage++;
            
        }else
        {
            [carNews.tableView.mj_footer endRefreshingWithNoMoreData];
        }
        
        dispatch_async(dispatch_get_main_queue(), ^{
           
            [carNews.tableView.mj_header endRefreshing];
            [carNews.tableView.mj_footer endRefreshing];
            
            [carNews.tableView reloadData];
            ;
        });
        
        ;
    } andFail:^(NSString *errStr, id errObj) {
        ;    [carNews.tableView.mj_header endRefreshing];
        [carNews.tableView.mj_footer endRefreshing];
    }];
    
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
