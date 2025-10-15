//
//  CNCommonTableViewController.m
//  CNLiveNetAdd
//
//  Created by 张旭 on 2017/12/30.
//  Copyright © 2017年 cnlive. All rights reserved.
//

#import "CNCommonTableViewController.h"
//#import "CNAttentionViewController.h"
//#import "CNMineHomeController.h"
#import "QMUIKit.h"
#import "CNThemeManager.h"
#import "CNLiveBaseKit.h"

@interface CNCommonTableViewController ()

@end

@implementation CNCommonTableViewController
- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
//    if ([self isKindOfClass:[CNAttentionViewController class]] || [self isKindOfClass:[CNMineHomeController class]]) {
//        self.tabBarController.tabBar.hidden = NO;
//    }else{
//
//        self.tabBarController.tabBar.hidden = YES;
//    }
//    self.navigationController.interactivePopGestureRecognizer.delegate = (id)self;
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    [UIView setAnimationsEnabled:YES];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
//    [self p_startNetworkMonitoring];
}

- (void)didInitialize {
    [super didInitialize];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(handleThemeChangedNotification:) name:CNThemeChangedNotification object:nil];
}


- (void)initSubviews {
    [super initSubviews];
    if (@available(iOS 11.0, *)) {
        self.tableView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
    } else {
        self.automaticallyAdjustsScrollViewInsets = NO;
    }
    self.tableView.top = kNavigationBarHeight;
    self.tableView.height = KScreenHeight - kNavigationBarHeight - kVerticalTabBarTotalHeight;
}

- (void)setCNNoNetworkingEmptyView {
    self.emptyView.backgroundColor = [UIColor whiteColor];
    self.emptyView.actionButton.backgroundColor = UIColorMake(0, 194, 0);
    self.emptyView.actionButton.layer.masksToBounds = YES;
    self.emptyView.actionButton.layer.cornerRadius = 6;
    self.emptyView.imageViewInsets = UIEdgeInsetsMake(0, 0, 15, 0);
    self.emptyView.textLabelInsets = UIEdgeInsetsMake(0, 0, 14, 0);
    self.emptyView.detailTextLabelInsets = UIEdgeInsetsMake(0, 0, 16, 0);
    [self.emptyView setTextLabelFont:UIFontMake(17)];
    [self.emptyView setDetailTextLabelFont:UIFontMake(13)];
    [self.emptyView setTextLabelTextColor:UIColorMake(102, 102, 102)];
    [self.emptyView setDetailTextLabelTextColor:UIColorMake(153, 153, 153)];
}

- (void)setCNAPIErrorEmptyView {
    self.emptyView.actionButton.backgroundColor = UIColorMake(0, 194, 0);
    self.emptyView.actionButton.layer.masksToBounds = YES;
    self.emptyView.actionButton.layer.cornerRadius = 6;
    self.emptyView.imageViewInsets = UIEdgeInsetsMake(0, 0, 15, 0);
    self.emptyView.textLabelInsets = UIEdgeInsetsMake(0, 0, 14, 0);
    self.emptyView.detailTextLabelInsets = UIEdgeInsetsMake(0, 0, 16, 0);
    [self.emptyView setTextLabelFont:UIFontMake(17)];
    [self.emptyView setDetailTextLabelFont:UIFontMake(13)];
    [self.emptyView setTextLabelTextColor:UIColorMake(102, 102, 102)];
    [self.emptyView setDetailTextLabelTextColor:UIColorMake(153, 153, 153)];
}

- (void)setCNNoDataEmptyView {
    [self.emptyView setTextLabelFont:UIFontMake(17)];
    [self.emptyView setTextLabelTextColor:UIColorMake(102, 102, 102)];
    self.emptyView.imageViewInsets = UIEdgeInsetsMake(0, 0, 36, 0);
    
}

- (UIStatusBarStyle)preferredStatusBarStyle {
    return UIStatusBarStyleDefault;
    
}

- (BOOL)shouldAutorotate {
    return NO;
}

- (UIImage *)navigationBarBackgroundImage {
    return [self imageWithColor:[UIColor whiteColor]];
}
- (UIImage *)imageWithColor:(UIColor *)color {
    return [self imageWithColor:color size:CGSizeMake(1, 1)];
}

- (UIImage *)imageWithColor:(UIColor *)color size:(CGSize)size {
    if (color == nil) {
        return nil;
    }
    CGRect rect=CGRectMake(0.0f, 0.0f, size.width, size.height);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    UIImage *theImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return theImage;
    
}
- (UIInterfaceOrientationMask)supportedOrientationMask {
    return UIInterfaceOrientationMaskPortrait;
    
}

- (BOOL)forceEnableInteractivePopGestureRecognizer {
    return YES;
    
}
///// 开始网络监控
//- (void)p_startNetworkMonitoring
//{
//    weakself
//    AFNetworkReachabilityManager *manager = [AFNetworkReachabilityManager sharedManager];
//    [manager setReachabilityStatusChangeBlock:^(AFNetworkReachabilityStatus status) {
//        if (status == AFNetworkReachabilityStatusUnknown || status == AFNetworkReachabilityStatusNotReachable) {
//            [weakSelf cn_noNetworking];//没网
//        }else
//        {//有网
//            [weakSelf cn_wifiOrWWANNetworking];
//        }
////        [self.tableView reloadData];
//    }];
//    [manager startMonitoring];
//}

- (void)cn_noNetworking {//子类重写
    
}

- (void)cn_wifiOrWWANNetworking {//子类重写
    
}

- (void)handleThemeChangedNotification:(NSNotification *)notification {
    NSObject<CNThemeProtocol> *themeBeforeChanged = notification.userInfo[CNThemeBeforeChangedName];
    themeBeforeChanged = [themeBeforeChanged isKindOfClass:[NSNull class]] ? nil : themeBeforeChanged;
    
    NSObject<CNThemeProtocol> *themeAfterChanged = notification.userInfo[CNThemeAfterChangedName];
    themeAfterChanged = [themeAfterChanged isKindOfClass:[NSNull class]] ? nil : themeAfterChanged;
    
    [self themeBeforeChanged:themeBeforeChanged afterChanged:themeAfterChanged];
}

#pragma mark - <CNChangingThemeDelegate>
- (void)themeBeforeChanged:(NSObject<CNThemeProtocol> *)themeBeforeChanged afterChanged:(NSObject<CNThemeProtocol> *)themeAfterChanged {
    [self.tableView reloadData];
}

@end
