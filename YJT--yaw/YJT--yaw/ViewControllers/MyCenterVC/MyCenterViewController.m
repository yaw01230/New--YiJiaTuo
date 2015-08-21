//
//  MyCenterViewController.m
//  YJT--yaw
//
//  Created by yangyawei on 15/8/21.
//  Copyright (c) 2015年 yangyawei. All rights reserved.
//

#import "MyCenterViewController.h"
#import "Header.h"
#import "OnlineOrderViewController.h"
#import "MyEvaluationViewController.h"
@interface MyCenterViewController ()

@end

@implementation MyCenterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self updateNavBarTitle:@"个人中心"];

    self.is_Go_HomeVC_num = 1 ;
    [self initMyCenterView];
}

- (void)initMyCenterView
{
    UIView * myView = [UIView new];
    myView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:myView];
    [myView mas_updateConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view.mas_left).with.offset(0);
        make.top.equalTo(self.navBar.mas_bottom).with.offset(0);
        make.height.equalTo(@190);
        make.right.equalTo(self.view.mas_right).with.offset(0);
    }];
    
    UIButton * imageBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    imageBtn.layer.cornerRadius = 55 ;
    [imageBtn setBackgroundColor:[UIColor orangeColor]] ;
    //[imageBtn setImage:[UIImage imageNamed:@"b27_icon_star_yellow"] forState:UIControlStateNormal];
    [myView addSubview:imageBtn];
    [imageBtn mas_updateConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(@105);
        make.height.equalTo(@105);
        make.left.equalTo(myView.mas_left).with.offset(45);
        make.top.equalTo(myView.mas_top).with.offset(45);
    }];
    
    UILabel * nameLabel = [UILabel new];
    nameLabel.text = @"name:yangyawei";
    [myView addSubview:nameLabel];
    [nameLabel mas_updateConstraints:^(MASConstraintMaker *make) {
        make.height.equalTo(@30);
        make.left.equalTo(imageBtn.mas_right).with.offset(30);
        make.top.equalTo(myView.mas_top).with.offset(70);
        make.right.equalTo(myView.mas_right).with.offset(10);
    }];
    
    UILabel * numberLabei = [UILabel new];
    numberLabei.text = @"name:yangyawei";
    [myView addSubview:numberLabei];
    [numberLabei mas_updateConstraints:^(MASConstraintMaker *make) {
        make.height.equalTo(@30);
        make.left.equalTo(imageBtn.mas_right).with.offset(30);
        make.top.equalTo(nameLabel.mas_bottom).with.offset(10);
        make.right.equalTo(myView.mas_right).with.offset(10);
    }];
    
    UIButton * myOrderBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    myOrderBtn.layer.borderWidth = 1.0 ;
    myOrderBtn.layer.borderColor = [[UIColor blackColor]CGColor];
    [myOrderBtn.layer setMasksToBounds:YES] ;
    [myOrderBtn setBackgroundColor:[UIColor whiteColor]];
    [myOrderBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [myOrderBtn addTarget:self action:@selector(GoOnlineOrderVC) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:myOrderBtn];
    [myOrderBtn mas_updateConstraints:^(MASConstraintMaker *make) {
        make.height.equalTo(@60);
        make.left.equalTo(self.view.mas_left).with.offset(60);
        make.top.equalTo(myView.mas_bottom).with.offset(70);
        make.right.equalTo(self.view.mas_right).with.offset(-60);
    }];
    
    UIButton * orderBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    orderBtn.layer.borderWidth = 1.0 ;
    orderBtn.layer.borderColor = [[UIColor blackColor]CGColor];
    [orderBtn.layer setMasksToBounds:YES] ;
    [orderBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [orderBtn addTarget:self action:@selector(GoMyEvaluationVC) forControlEvents:UIControlEventTouchUpInside];
    [orderBtn setBackgroundColor:[UIColor whiteColor]];
    [self.view addSubview:orderBtn];
    [orderBtn mas_updateConstraints:^(MASConstraintMaker *make) {
        make.height.equalTo(@60);
        make.left.equalTo(self.view.mas_left).with.offset(60);
        make.top.equalTo(myOrderBtn.mas_bottom).with.offset(1);
        make.centerX.equalTo(self.view.mas_centerX);
    }];
    
    UIImageView * myOrderIV = [UIImageView new];
    myOrderIV.image = [UIImage imageNamed:@"btn_close_normal"];
    [myOrderBtn addSubview:myOrderIV];
    [myOrderIV mas_updateConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(myOrderBtn.mas_centerY);
        make.right.equalTo(myOrderBtn.mas_centerX).with.offset(-30);
    }];
    
    UILabel * myOrderLabel = [UILabel new];
    myOrderLabel.text = @"我的订单" ;
    myOrderLabel.font = Font_20 ;
    [myOrderBtn addSubview:myOrderLabel];
    [myOrderLabel mas_updateConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(myOrderBtn.mas_centerX).with.offset(-25);
        make.centerY.equalTo(myOrderBtn.mas_centerY);
    }];
    
    
    UIImageView * orderIV = [UIImageView new];
    orderIV.image = [UIImage imageNamed:@"btn_close_normal"];
    [orderBtn addSubview:orderIV];
    [orderIV mas_updateConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(orderBtn.mas_centerY);
        make.right.equalTo(orderBtn.mas_centerX).with.offset(-30);
    }];
    
    UILabel * orderLabel = [UILabel new];
    orderLabel.text = @"待评价" ;
    orderLabel.font = Font_20 ;
    orderLabel.textAlignment = NSTextAlignmentCenter ;
    [orderBtn addSubview:orderLabel];
    [orderLabel mas_updateConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(orderBtn.mas_centerX).with.offset(-25);
        make.centerY.equalTo(orderBtn.mas_centerY);
    }];
    
}

- (void)GoOnlineOrderVC
{
    OnlineOrderViewController * OOVC = [[OnlineOrderViewController alloc] init ];
    [self presentViewController:OOVC animated:NO completion:nil];
}

- (void)GoMyEvaluationVC
{
    MyEvaluationViewController * MEVC = [[MyEvaluationViewController alloc] init ];
    [self presentViewController:MEVC animated:NO completion:nil];
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
