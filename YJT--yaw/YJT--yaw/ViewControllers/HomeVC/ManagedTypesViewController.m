//
//  ManagedTypesViewController.m
//  YJT--yaw
//
//  Created by yangyawei on 15/8/21.
//  Copyright (c) 2015年 yangyawei. All rights reserved.
//

#import "ManagedTypesViewController.h"
#import "ManagedTypesTableViewCell.h"
#import "Header.h"
#import "ManagedViewController.h"
@interface ManagedTypesViewController ()
@property (strong, nonatomic) IBOutlet UINavigationBar *navBar;

@property (strong, nonatomic) IBOutlet UITableView *MTtableView;
@end

@implementation ManagedTypesViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self updateNavBarTitle:@"托管类型"];
    self.view.backgroundColor = RGBA(235, 235, 235, 1.0);
    self.is_Go_HomeVC_num = 1 ;
    [self setupCustomCell];
}

- (void)setupCustomCell
{
    self.MTtableView.separatorStyle = UITableViewCellSeparatorStyleNone ;
    
    [self.MTtableView registerNib:[UINib nibWithNibName:@"ManagedTypesTableViewCell" bundle:nil] forCellReuseIdentifier:@"ManagedTypesTableViewCell"];
}

#pragma tableVIew delegate
- (NSInteger) numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1 ;
}
- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 11 ;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    //    ManagedTypesTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ManagedTypesTableViewCell"];
    //    CGSize cellSize = [cell.contentView systemLayoutSizeFittingSize:UILayoutFittingCompressedSize];
    //return cellSize.height + 1;
    return 125 ;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    ManagedTypesTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ManagedTypesTableViewCell"];
    //cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator ;
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    ManagedViewController * MVC = [[ManagedViewController alloc] init ];
    [self presentViewController:MVC animated:NO completion:nil];
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
