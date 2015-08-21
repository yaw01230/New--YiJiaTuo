//
//  BaseViewController.m
//  YJT--yaw
//
//  Created by yangyawei on 15/8/21.
//  Copyright (c) 2015年 yangyawei. All rights reserved.
//

#import "BaseViewController.h"
#import "Header.h"
@interface BaseViewController ()

@end

@implementation BaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.is_Show_nav_bar_right_select_menu = 0;
    self.backButton_title_width = 44 ;
    self.is_Go_HomeVC_num = 0 ;
    [self installTabBarStyleAndAjust];
     [self.view setBackgroundColor:RGBA(235, 235, 235, 1.0)];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self addNavlMenu];
}
#pragma  mark 更改tabBar风格 并且修正 ios6  7  8 兼容性

-(void)installTabBarStyleAndAjust
{
    
    if ([self respondsToSelector:@selector(setEdgesForExtendedLayout:)])
    {
        self.edgesForExtendedLayout = UIRectEdgeBottom;
        self.extendedLayoutIncludesOpaqueBars = NO;
        self.modalPresentationCapturesStatusBarAppearance = NO;
        self.tabBarController.tabBar.translucent = YES;          //设置为透明 self.edgesForExtendedLayout = UIRectEdgeBottom;  才起作用
    }
    
    self.navBar.translucent = NO;
    
    if ([[[UIDevice currentDevice] systemVersion] compare:@"7.0" options:NSNumericSearch] != NSOrderedAscending)
    {
        self.navBar.barStyle = UIBarStyleDefault;
        self.navBar.barStyle = UIStatusBarStyleLightContent;//or UIBarStyleBlackTranslucent
        [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent];
        
        self.tabBarController.tabBar.tintColor = [UIColor colorWithRed:0.204 green:0.596 blue:0.859 alpha:0.6];
        [self.tabBarController.tabBar setSelectedImageTintColor: [UIColor colorWithRed:0.204 green:0.596 blue:0.859 alpha:0.7]];
        
        [[UITabBarItem appearance] setTitleTextAttributes:
         [NSDictionary dictionaryWithObjectsAndKeys:
          [UIColor blackColor], UITextAttributeTextColor,
          [UIFont fontWithName:@"ProximaNova-Semibold" size:0.0], UITextAttributeFont,
          nil]
                                                 forState:UIControlStateHighlighted];
        
        [[UITabBarItem appearance] setTitleTextAttributes:
         [NSDictionary dictionaryWithObjectsAndKeys:
          [UIColor blackColor], UITextAttributeTextColor,
          [UIFont fontWithName:@"ProximaNova-Semibold" size:0.0], UITextAttributeFont,
          nil]
                                                 forState:UIControlStateNormal];
    }
    else
    {
        self.tabBarController.tabBar.superview.backgroundColor = [UIColor colorWithRed:0.204 green:0.596 blue:0.859 alpha:1];
        [self.tabBarController.tabBar setSelectedImageTintColor: [UIColor colorWithRed:0.204 green:0.596 blue:0.859 alpha:0.7]];
        
        [[UITabBarItem appearance] setTitleTextAttributes:
         [NSDictionary dictionaryWithObjectsAndKeys:
          [UIColor blackColor], UITextAttributeTextColor,
          [UIFont fontWithName:@"ProximaNova-Semibold" size:0.0], UITextAttributeFont,
          nil]
                                                 forState:UIControlStateSelected];
        
        [[UITabBarItem appearance] setTitleTextAttributes:
         [NSDictionary dictionaryWithObjectsAndKeys:
          [UIColor blackColor], UITextAttributeTextColor,
          [UIFont fontWithName:@"ProximaNova-Semibold" size:0.0], UITextAttributeFont,
          nil]
                                                 forState:UIControlStateNormal];
    }
    
    //{{更改 tabbar 背景色为白色   tabbar   ios6背景颜色修正
    UIImage *bgImg = [[UIImage alloc] init];
    [self.tabBarController.tabBar setBackgroundImage:bgImg];
    //[self.tabBarController.tabBar setShadowImage:bgImg];    //ios6 7 8 顶部阴影颜色
    
    
    
    if ([[[UIDevice currentDevice] systemVersion] compare:@"7.0"] == NSOrderedAscending)
    {
        [[UITabBar appearance] setSelectedImageTintColor:[UIColor colorWithRed:127.0/255.0 green:186.0/255.0 blue:235.0/255.0 alpha:1.0]];
        [[UITabBar appearance] setSelectionIndicatorImage:bgImg];
        //上面两个是清除item的背景色跟选中背景色
    }

    
    __weak UIViewController *me       = self;
    __weak UINavigationBar *curNavBar = self.navBar;
    [self adjustNavBar:(UINavigationBar*)curNavBar UIC:(UIViewController *)me is_UIView:false];
}

#pragma mark initLeftNavgitation  -- custom
- (void) addNavlMenu
{
    //当此值定义为1 时不初始化下拉菜单
    if (self.is_Show_nav_bar_right_select_menu == 1)
    {
        if (_backButton)
        {
            _backButton.hidden = YES;
            [_backButton setTitle:(self.navBarBackTitle ? self.navBarBackTitle : @"") forState:UIControlStateNormal];
        }
        
        return;
    }
    
    if (self.navBar)
    {
        UINavigationItem *UINavitem = [[UINavigationItem alloc] initWithTitle:self.navBarTitle];
        
        self.UINavitem = UINavitem;
        
        //导航下拉菜单的按钮  一下自定义导航栏按钮  实现io7 兼容
        if(_backButton)
        {
            
        }
        else
        {
            UIButton * backButton = [UIButton buttonWithType:UIButtonTypeCustom];
            backButton.frame = CGRectMake(0, 0, self.backButton_title_width, 44);
            _backButton      = backButton;
        }
        
        if (self.is_Show_nav_bar_right_select_menu == 0)
        {
            _backButton.hidden = NO;
            [_backButton setImage:[UIImage imageNamed:@"barbuttonItem_back"] forState:UIControlStateNormal];
            [_backButton setImage:[UIImage imageNamed:@"barbuttonItem_back"] forState:UIControlStateSelected];
            [_backButton setImage:[UIImage imageNamed:@"barbuttonItem_back"] forState:UIControlStateHighlighted];
            [_backButton setTitle:self.navBarBackTitle forState:UIControlStateNormal];
        }
        else
        {
            _backButton.hidden = YES;
            [_backButton setTitle:self.navBarBackTitle  forState:UIControlStateNormal];
        }
        
        [_backButton setTitleEdgeInsets:UIEdgeInsetsMake(0, 0, 0, 0)];
        [_backButton.titleLabel setFont:[UIFont boldSystemFontOfSize:18.0]];
        [_backButton setTitleColor:[UIColor colorWithRed:233.0/255.0 green:220.0/255.0 blue:207.0/255.0 alpha:1.0]
                          forState:UIControlStateNormal];
        
        [_backButton addTarget:self action:@selector(navLeftBtnAction:) forControlEvents:UIControlEventTouchUpInside];
        UIBarButtonItem *backNavigationItem = [[UIBarButtonItem alloc] initWithCustomView:_backButton];
        backNavigationItem.tintColor = [UIColor colorWithRed:74/255.0 green:74/255.0 blue:74/255.0 alpha:1.0];
        
        // 调整 leftBarButtonItem 在 iOS7 下面的位置
        if(([[[UIDevice currentDevice] systemVersion] floatValue]>=7.0?20:0))
        {
            UIBarButtonItem *negativeSpacer = [[UIBarButtonItem alloc]
                                               initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace
                                               target:nil action:nil];
            
            negativeSpacer.width         = -10;
            self.UINavitem.leftBarButtonItems = @[negativeSpacer, backNavigationItem];
        }
        else
        {
            UIBarButtonItem *negativeSpacer = [[UIBarButtonItem alloc]
                                               initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace
                                               target:nil action:nil];
            
            negativeSpacer.width         = 0;
            self.UINavitem.leftBarButtonItem  = backNavigationItem;
        }
        
    }
    [self.navBar pushNavigationItem:self.UINavitem animated:NO];

    
}

#pragma  mark  initNavBar  修正导航栏
//修正导航栏
 -(void)adjustNavBar:(UINavigationBar*)navBar UIC:(UIViewController *)me  is_UIView:(BOOL)ok
{
    navBar.tintColor = [UIColor whiteColor];
    
    if(IsIOS7)
    {
        navBar.barTintColor = [UIColor blueColor];
    }
    
    if ([[[UIDevice currentDevice] systemVersion] doubleValue]>=7.0)
    {
        
        UIEdgeInsets padding_brand_lanel = UIEdgeInsetsMake(20, 0, 0, 0); //偏移50像素放增加汽车按钮
        [navBar mas_updateConstraints:^(MASConstraintMaker *make) {
            
            make.top.equalTo(me.view.mas_top).with.offset(padding_brand_lanel.top);
            
        }];
        
        
        UIView *statusBarView  = [[UIView alloc] initWithFrame:CGRectMake(0, -20, [UIScreen mainScreen].bounds.size.width, 20)];
        statusBarView.backgroundColor = RGBA(27, 29, 40, 1.0);
        
        if (!ok)
        {
            [navBar addSubview:statusBarView];
        }
        navBar.tintColor = [UIColor whiteColor];
        [navBar setBarTintColor:RGBA(27, 29, 40, 1.0)];
        
        [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent];
        
        NSShadow *shadow = [[NSShadow alloc] init];
        shadow.shadowColor = [UIColor colorWithRed:0.0 green:0.0 blue:0.0 alpha:0.8];
        shadow.shadowOffset = CGSizeMake(0, 1);
        [[UINavigationBar appearance] setTitleTextAttributes: [NSDictionary dictionaryWithObjectsAndKeys:
                                                               [UIColor colorWithRed:245.0/255.0 green:245.0/255.0 blue:245.0/255.0 alpha:1.0], NSForegroundColorAttributeName,
                                                               shadow, NSShadowAttributeName,
                                                               [UIFont fontWithName:@"HelveticaNeue-CondensedBlack" size:21.0], NSFontAttributeName, nil]];
        
    }
    else
    {//ios6
        
        if (navBar)
        {
            navBar.tintColor = RGBA(27, 29, 40, 1.0);
            
            UIEdgeInsets padding_brand_lanel = UIEdgeInsetsMake(0, 0, 0, 0); //偏移50项目放增加汽车按钮
            
            [navBar mas_updateConstraints:^(MASConstraintMaker *make) {
                make.height.equalTo(@44);
                make.top.equalTo(me.view.mas_top).with.offset(padding_brand_lanel.top);
                
            }];
            
            [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleBlackOpaque];
            
            
        }
        
        
    }
    
    me.tabBarController.tabBar.backgroundColor = [UIColor whiteColor];
    
}
/*
 *  头部导航栏的左边按钮的默认实现
 *  @pragram 
 *  title  页面的导航名
 */

-(void)updateNavBarTitle:(NSString*) title
{
    self.navBarTitle = title;
}

#pragma mark -- jump VC
/*
 *  头部导航栏的左边按钮的默认实现
 *  0 dismissVC
 *  1 跳转到 首页
 *  2 跳转到 个人中心
 */
-(void)navLeftBtnAction:(UIButton *)sender
{

    if (self.is_Go_HomeVC_num == 0)
    {
        if ([self respondsToSelector:@selector(presentingViewController)])
            
        {
            [self dismissViewControllerAnimated:NO completion:nil];
        }
        else
        {
            [self dismissViewControllerAnimated:NO completion:nil];
        }
        
    }
    else if (self.is_Go_HomeVC_num == 1)
    {
       [[NSNotificationCenter defaultCenter] postNotificationName:@"home_view" object:nil];
    }
    else
    {
        [[NSNotificationCenter defaultCenter] postNotificationName:@"MyCenterVC" object:nil];
    }
    
}


#pragma  mark UITableViewDelegate&& UITableViewDatasource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 6;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cellIndentifier = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIndentifier];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIndentifier];
    }
    cell.textLabel.text = [NSString stringWithFormat:@"cell-%ld-%ld",indexPath.section,indexPath.row];
    return cell;
}

//{{修正分割线不是左对齐  ios7 8 兼容

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    if ([tableView respondsToSelector:@selector(setSeparatorInset:)]) {
        
        [tableView setSeparatorInset:UIEdgeInsetsZero];
        
    }
    
    if ([tableView respondsToSelector:@selector(setLayoutMargins:)]) {
        
        [tableView setLayoutMargins:UIEdgeInsetsZero];
        
    }
    
    if ([cell respondsToSelector:@selector(setSeparatorInset:)]) {
        
        [cell setSeparatorInset:UIEdgeInsetsZero];
        
    }
    
    if ([cell respondsToSelector:@selector(setLayoutMargins:)]) {
        
        [cell setLayoutMargins:UIEdgeInsetsZero];
        
    }
    
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
