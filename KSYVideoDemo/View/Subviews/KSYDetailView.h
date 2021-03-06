//
//  KSYDetailView.h
//  KSYVideoDemo
//
//  Created by 孙健 on 15/12/23.
//  Copyright © 2015年 kingsoft. All rights reserved.
//  MVC 设计模式 M：模型 V：视图 C：控制器

#import <UIKit/UIKit.h>
#import "KSYCommentView.h"
@interface KSYDetailView : UIView<UITableViewDataSource,UITableViewDelegate>
#pragma mark 属性
@property (nonatomic, strong) NSMutableArray *models;
@property (nonatomic, strong) NSMutableArray *modelsCells;
@property (nonatomic, strong) UISegmentedControl *kSegmentedCTL;
@property (nonatomic, strong) UITableView * kTableView;
@property (nonatomic, strong) KSYCommentView *commtenView;
@property (nonatomic, copy) void (^showCommentView)(NSInteger selectedSegmentIndex,CGFloat contentoffsetY);

- (void)resetTextFrame;
@end
