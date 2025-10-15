//
//  CNCommonListViewController.h
//  CNLiveNetAdd
//
//  Created by 张旭 on 2018/1/3.
//  Copyright © 2018年 cnlive. All rights reserved.
//  列表类型的tableView

#import "CNCommonTableViewController.h"

@interface CNCommonListViewController : CNCommonTableViewController
@property(nonatomic, strong) QMUIOrderedDictionary *dataSource;

@end

@interface CNCommonListViewController (UISubclassingHooks)
//子类继承,可以不调 super
- (void)initDataSource;
- (void)didSelectCellWithTitle:(NSString *)title;

@end
