//
//  CNCommonTableViewController.h
//  CNLiveNetAdd
//
//  Created by 张旭 on 2017/12/30.
//  Copyright © 2017年 cnlive. All rights reserved.
//

#import "QMUIKit.h"
#import "CNThemeProtocol.h"

@interface CNCommonTableViewController : QMUICommonTableViewController <CNChangingThemeDelegate>
- (void)setCNAPIErrorEmptyView;//接口错误
- (void)setCNNoNetworkingEmptyView;//无网络连接
- (void)setCNNoDataEmptyView;//没有相关内容
////子类重写  没网络时调用
- (void)cn_noNetworking;
////子类重写  有网络时调用
- (void)cn_wifiOrWWANNetworking;

@end


