//
//  BaseViewController.h
//  YJT--yaw
//
//  Created by yangyawei on 15/8/21.
//  Copyright (c) 2015年 yangyawei. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BaseViewController : UIViewController <UITableViewDataSource,UITableViewDelegate>

@property (strong , nonatomic) UINavigationBar * navBar ;

@property (nonatomic, strong)  NSString* navBarTitle;
@property (nonatomic, strong)  NSString* navBarBackTitle;
@property (nonatomic, strong)  UINavigationItem *UINavitem;
@property (nonatomic, assign) NSInteger is_Show_nav_bar_right_select_menu;
@property (nonatomic, assign) NSInteger backButton_title_width;
@property (nonatomic, strong) UIButton * backButton;
@property (nonatomic, assign) NSInteger is_Go_HomeVC_num;


-(void)updateNavBarTitle:(NSString*) title;  //设置导航栏标题

-(void)navLeftBtnAction:(UIButton *)sender;


@end
