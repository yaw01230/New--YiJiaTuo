//
//  GoodMercharViewController.m
//  YJT--yaw
//
//  Created by yangyawei on 15/8/21.
//  Copyright (c) 2015年 yangyawei. All rights reserved.
//

#import "GoodMercharViewController.h"
#import "ManagedTypesViewController.h"
#import "Header.h"
@interface GoodMercharViewController ()

@property (strong, nonatomic) IBOutlet UITableView *GMTableView;
@end

@implementation GoodMercharViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self updateNavBarTitle:@"优秀商家"];
    self.is_Go_HomeVC_num = 1 ;
    [self.view setBackgroundColor:RGBA(235, 235, 235, 1.0)];
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
