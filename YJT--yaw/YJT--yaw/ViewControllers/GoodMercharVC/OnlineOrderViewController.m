//
//  OnlineOrderViewController.m
//  YJT--yaw
//
//  Created by yangyawei on 15/8/21.
//  Copyright (c) 2015年 yangyawei. All rights reserved.
//

#import "OnlineOrderViewController.h"

@interface OnlineOrderViewController ()
@property (strong, nonatomic) IBOutlet UINavigationBar *navBar;

@end

@implementation OnlineOrderViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self updateNavBarTitle:@"在线预约"];
    self.navBarBackTitle = @"返回个人中心 ";
    self.backButton_title_width = 150 ;
    self.is_Go_HomeVC_num = 3 ;
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
