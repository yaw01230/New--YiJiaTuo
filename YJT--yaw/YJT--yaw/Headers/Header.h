//
//  Header.h
//  YiJiaTuo
//
//  Created by yangyawei on 15/8/13.
//  Copyright (c) 2015年 yangyawei. All rights reserved.
//

#ifndef YiJiaTuo_Header_h
#define YiJiaTuo_Header_h

#import "HomeViewController.h"
#import "GoodMercharViewController.h"
#import "MyCenterViewController.h"
#import "ShareViewController.h"
#import "FontHeader.h"
#import "Masonry.h"



/** 统一输出日志 */
#ifdef DEBUG //调试阶段
#define DLog(...) NSLog(__VA_ARGS__)
#else       //发布阶段
#define DLog(...)
#endif

//判断是否为ios7.0
#define IsIOS7 ([[[UIDevice currentDevice] systemVersion] doubleValue] < 7.1 ? YES : NO)
//判断是否为ios8
#define IsIOS8 ([[[UIDevice currentDevice] systemVersion] floatValue] >=8.0 ? YES : NO)
//判断是否为iPhone5之后的设备
#define IsIphone5_later ([UIScreen mainScreen].bounds.size.height > 480 ? YES : NO)
//设备的高
#define SHeight [UIScreen mainScreen].bounds.size.height
#define Swidth [UIScreen mainScreen].bounds.size.width
//颜色设置
#define RGBA(R/*红*/,G/*绿*/,B/*蓝*/,A/*透明*/) [UIColor colorWithRed:R/255.f green:G/255.f blue:B/255.f alpha:A]
//application单例
#define app [UIApplication sharedApplication].delegate

#endif
