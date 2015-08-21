//
//  ManagedTypesTableViewCell.m
//  YJT--yaw
//
//  Created by yangyawei on 15/8/21.
//  Copyright (c) 2015年 yangyawei. All rights reserved.
//

#import "ManagedTypesTableViewCell.h"
#import "Header.h"
@implementation ManagedTypesTableViewCell

- (void)awakeFromNib {
    // Initialization code
    self.contentView.backgroundColor = RGBA(235, 235, 235, 1.0) ;
    self.JianTouLabel.text = @"Dark0921";
    self.JianTouLabel.font = [UIFont boldSystemFontOfSize:14];
    [self.JianTouLabel sizeToFit];
    self.JianTouLabel.backgroundColor = [UIColor clearColor];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
