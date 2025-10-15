//
//  CNCommonListViewController.m
//  CNLiveNetAdd
//
//  Created by 张旭 on 2018/1/3.
//  Copyright © 2018年 cnlive. All rights reserved.
//

#import "CNCommonListViewController.h"

@interface CNCommonListViewController ()

@end

@implementation CNCommonListViewController
- (instancetype)initWithStyle:(UITableViewStyle)style {
    if (self = [super initWithStyle:style]) {
        [self initDataSource];
    }
    return self;
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    [UIView setAnimationsEnabled:YES];
}
#pragma mark - <QMUITableViewDataSource,QMUITableViewDelegate>
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return [self.dataSource count];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [[self orderedDictionaryInSection:section] count];
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    return [self titleForSection:section];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *identifierNormal = @"cellNormal";
    QMUITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifierNormal];
    if (!cell) {
        cell = [[QMUITableViewCell alloc] initForTableView:self.tableView withStyle:UITableViewCellStyleSubtitle reuseIdentifier:identifierNormal];
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    }
    NSString *keyName = [self keyNameAtIndexPath:indexPath];
    cell.textLabel.text = keyName;
    cell.detailTextLabel.text = (NSString *)[[self orderedDictionaryInSection:indexPath.section] objectForKey:keyName];
    
    cell.textLabel.font = UIFontMake(15);
    cell.detailTextLabel.font = UIFontMake(13);
    
    [cell updateCellAppearanceWithIndexPath:indexPath];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [self.tableView qmui_clearsSelection];
    NSString *keyName = [self keyNameAtIndexPath:indexPath];
    [self didSelectCellWithTitle:keyName];
    [self.tableView qmui_clearsSelection];
}

#pragma mark - DataSource
- (NSString *)titleForSection:(NSInteger)section {
    return [[self.dataSource allKeys] objectAtIndex:section];
}

- (QMUIOrderedDictionary *)orderedDictionaryInSection:(NSInteger)section {
    return [self.dataSource objectForKey:[self titleForSection:section]];
}

- (NSString *)keyNameAtIndexPath:(NSIndexPath *)indexPath {
    return [[self orderedDictionaryInSection:indexPath.section] allKeys][indexPath.row];
}

@end

@implementation CNCommonTableViewController (UISubclassingHooks)
- (void)initDataSource {
    
}

- (void)didSelectCellWithTitle:(NSString *)title {
    
}

@end
