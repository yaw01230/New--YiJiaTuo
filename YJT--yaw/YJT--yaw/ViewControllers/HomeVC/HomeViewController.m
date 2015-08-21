//
//  HomeViewController.m
//  YJT--yaw
//
//  Created by yangyawei on 15/8/21.
//  Copyright (c) 2015年 yangyawei. All rights reserved.
//

#import "HomeViewController.h"
#import "ManagedTypesViewController.h"
#import "EarlyEducationViewController.h"
#import "WebViewController.h"
#import "GoodInfomationViewController.h"
#import "Header.h"
@interface HomeViewController ()
@property (strong, nonatomic) IBOutlet UITableView *MTableView;

@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self updateNavBarTitle:@"首页"];
    self.is_Show_nav_bar_right_select_menu =1 ;
    [self.view setBackgroundColor:RGBA(235, 235, 235, 1.0)];
    [self registerStoryboardViewSwitchNotification];
    [self setupCustomTableViewHeader];
}
- (void)setupCustomTableViewHeader
{
    UIView * headView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, Swidth, 300)];
    //headView.backgroundColor = RGBA(235, 235, 235, 1.0);
    DLog(@"%f",Swidth);
    self.MTableView.tableHeaderView = headView ;
    
    UIButton * managedBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [managedBtn setBackgroundColor:[UIColor orangeColor]];
    [managedBtn setTitle:@"托管" forState:UIControlStateNormal];
    [managedBtn addTarget:self action:@selector(presentManagedTypeVC) forControlEvents:UIControlEventTouchUpInside];
    [headView addSubview:managedBtn];
    [managedBtn mas_updateConstraints:^(MASConstraintMaker *make) {
        make.height.equalTo(@150);
        make.left.equalTo(headView.mas_left).with.offset(10);
        make.right.equalTo(headView.mas_centerX).with.offset(-5);
        make.top.equalTo(headView.mas_top).with.offset(10);
    }];
    
    UIButton * earlyEduBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [earlyEduBtn setBackgroundColor:[UIColor orangeColor]];
    [earlyEduBtn setTitle:@"早教" forState:UIControlStateNormal];
    [earlyEduBtn addTarget:self action:@selector(presentEarlyEduVC) forControlEvents:UIControlEventTouchUpInside];
    [headView addSubview:earlyEduBtn];
    [earlyEduBtn mas_updateConstraints:^(MASConstraintMaker *make) {
        make.height.equalTo(@150);
        make.left.equalTo(headView.mas_centerX).with.offset(5);
        make.top.equalTo(headView.mas_top).with.offset(10);
        make.right.equalTo(headView.mas_right).with.offset(-10);
    }];
    
    
    CGFloat btnWidth = (Swidth-30)/3 ;
    UIButton * advertise_firstBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [advertise_firstBtn setBackgroundColor:[UIColor orangeColor]];
    [advertise_firstBtn setTitle:@"托管1" forState:UIControlStateNormal];
    [advertise_firstBtn addTarget:self action:@selector(presentWebVC) forControlEvents:UIControlEventTouchUpInside];
    [headView addSubview:advertise_firstBtn];
    [advertise_firstBtn mas_updateConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(@(btnWidth));
        make.left.equalTo(headView.mas_left).with.offset(10);
        make.top.equalTo(managedBtn.mas_bottom).with.offset(10);
        make.bottom.equalTo(headView.mas_bottom).with.offset(-10);
    }];
    UIButton * advertise_SecondBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [advertise_SecondBtn setBackgroundColor:[UIColor orangeColor]];
    [advertise_SecondBtn setTitle:@"托管2" forState:UIControlStateNormal];
    [advertise_SecondBtn addTarget:self action:@selector(presentWebVC) forControlEvents:UIControlEventTouchUpInside];
    [headView addSubview:advertise_SecondBtn];
    [advertise_SecondBtn mas_updateConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(@(btnWidth));
        make.left.equalTo(advertise_firstBtn.mas_right).with.offset(10);
        make.top.equalTo(managedBtn.mas_bottom).with.offset(10);
        make.bottom.equalTo(headView.mas_bottom).with.offset(-10);
    }];
    UIButton * advertise_thirdBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [advertise_thirdBtn setBackgroundColor:[UIColor orangeColor]];
    [advertise_thirdBtn setTitle:@"托管3" forState:UIControlStateNormal];
    [advertise_thirdBtn addTarget:self action:@selector(presentWebVC) forControlEvents:UIControlEventTouchUpInside];
    [headView addSubview:advertise_thirdBtn];
    [advertise_thirdBtn mas_updateConstraints:^(MASConstraintMaker *make) {
        //make.width.equalTo(@(btnWidth));
        make.left.equalTo(advertise_SecondBtn.mas_right).with.offset(10);
        make.top.equalTo(managedBtn.mas_bottom).with.offset(10);
        make.bottom.equalTo(headView.mas_bottom).with.offset(-10);
        make.right.equalTo(headView.mas_right).with.offset(-10);
    }];
    
}

#pragma mark -- UIButton methods

- (void)presentManagedTypeVC
{
    ManagedTypesViewController * MTVC = [[ManagedTypesViewController alloc] init ];
    [self presentViewController:MTVC animated:NO completion:nil];
}

- (void)presentEarlyEduVC
{
    EarlyEducationViewController * EEVC = [[EarlyEducationViewController alloc] init ];
    [self presentViewController:EEVC animated:NO completion:nil];
}

- (void)presentWebVC
{
    WebViewController * WVC = [[WebViewController alloc] init ];
    [self presentViewController:WVC animated:NO completion:nil];
}

- (void)presentManagedInfoVC
{
    GoodInfomationViewController * GIVC = [[GoodInfomationViewController alloc] init ];
    [self presentViewController:GIVC animated:NO completion:nil];
}

#pragma mark jumpHomeVC  MyCenterVC

- (void)registerStoryboardViewSwitchNotification
{
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(storyboardViewControllerSwitch_home:) name:@"home_view" object:nil];     //主页我的界面
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(storyboardViewControllerSwitch_our:) name:@"MyCenterVC" object:nil];      //我的界面
}


//主页我的界面
-(void)storyboardViewControllerSwitch_home:(NSNotification*) notification
{
    [self navLeftBtnAction:nil];  //关闭 服务搜索自动完成
    [self.tabBarController setSelectedIndex:0];
}

//我的界面
-(void)storyboardViewControllerSwitch_our:(NSNotification*) notification
{
    [self navLeftBtnAction:nil];  //关闭 服务搜索自动完成
    [self.tabBarController setSelectedIndex:3];
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
