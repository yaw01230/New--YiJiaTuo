//
//  ManagedTypesTableViewCell.h
//  YJT--yaw
//
//  Created by yangyawei on 15/8/21.
//  Copyright (c) 2015年 yangyawei. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ManagedTypesTableViewCell : UITableViewCell

@property (strong, nonatomic) IBOutlet UIImageView *MTImageV;
@property (strong, nonatomic) IBOutlet UILabel *MTType;
@property (strong, nonatomic) IBOutlet UILabel *MTContext;
@property (strong, nonatomic) IBOutlet UILabel *JianTouLabel;
@end
