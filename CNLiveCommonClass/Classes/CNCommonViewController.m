//
//  CNCommonViewController.m
//  CNLiveNetAdd
//
//  Created by 张旭 on 2017/12/30.
//  Copyright © 2017年 cnlive. All rights reserved.
//

#import "CNCommonViewController.h"
#import <CNLiveRequestBastKit/CNLiveNetworking.h>
#import "QMUIKit.h"
#import "CNThemeManager.h"

@interface CNCommonViewController ()

@end

@implementation CNCommonViewController
#pragma mark - Life Cycle
- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    [UIView setAnimationsEnabled:YES];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self p_startNetworkMonitoring];
}

- (void)initSubviews {
    [super initSubviews];
    self.automaticallyAdjustsScrollViewInsets = NO;
}

- (void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];

}

#pragma mark - UI
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

#pragma mark - Network Monitoring
- (void)p_startNetworkMonitoring {
    __weak typeof(self) weakSelf = self;
    [CNLiveNetworking networkStatusWithBlock:^(CNLiveNetworkStatusType status) {
        if (status == CNLiveNetworkStatusUnknown || status == CNLiveNetworkStatusNotReachable) {
            weakSelf.netStatus = status;
            [weakSelf cn_noNetworking];//没网
        }else
        {//有网
            weakSelf.netStatus = status;
            [weakSelf cn_wifiOrWWANNetworking];
        }
    }];
    
//    AFNetworkReachabilityManager *manager = [AFNetworkReachabilityManager sharedManager];
//    [manager setReachabilityStatusChangeBlock:^(AFNetworkReachabilityStatus status) {
//        if (status == AFNetworkReachabilityStatusUnknown || status == AFNetworkReachabilityStatusNotReachable) {
//            weakSelf.netStatus = status;
//            [weakSelf cn_noNetworking];//没网
//        }else
//        {//有网
//            weakSelf.netStatus = status;
//            [weakSelf cn_wifiOrWWANNetworking];
//        }
//    }];
//    [manager startMonitoring];
}

- (void)cn_noNetworking {//子类重写
    
}

- (void)cn_wifiOrWWANNetworking {//子类重写
    
}

- (void)didInitialize {
    [super didInitialize];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(handleThemeChangedNotification:) name:CNThemeChangedNotification object:nil];
}

- (void)handleThemeChangedNotification:(NSNotification *)notification {
    NSObject<CNThemeProtocol> *themeBeforeChanged = notification.userInfo[CNThemeBeforeChangedName];
    NSObject<CNThemeProtocol> *themeAfterChanged = notification.userInfo[CNThemeAfterChangedName];
    [self themeBeforeChanged:themeBeforeChanged afterChanged:themeAfterChanged];
}

#pragma mark - Navigation Delegate
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

#pragma mark - System Delegate
- (BOOL)shouldAutorotate {
    return NO;
}
- (UIInterfaceOrientationMask)supportedOrientationMask {
    return UIInterfaceOrientationMaskPortrait;
}

- (UIStatusBarStyle)preferredStatusBarStyle {
    return UIStatusBarStyleDefault;
}

- (BOOL)forceEnableInteractivePopGestureRecognizer {
    return YES;
}

#pragma mark - CNChangingThemeDelegate
- (void)themeBeforeChanged:(NSObject<CNThemeProtocol> *)themeBeforeChanged afterChanged:(NSObject<CNThemeProtocol> *)themeAfterChanged {
    
}

@end
