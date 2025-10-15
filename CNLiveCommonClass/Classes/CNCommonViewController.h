//
//  CNCommonViewController.h
//  CNLiveNetAdd
//
//  Created by 张旭 on 2017/12/30.
//  Copyright © 2017年 cnlive. All rights reserved.
//

#import "CNThemeProtocol.h"
#import "QMUICommonViewController.h"

@interface CNCommonViewController : QMUICommonViewController <CNChangingThemeDelegate>
@property (nonatomic, assign) NSInteger netStatus;//当前网络状态

- (void)setCNAPIErrorEmptyView;//接口错误
- (void)setCNNoNetworkingEmptyView;//无网络连接
- (void)setCNNoDataEmptyView;//没有相关内容
////子类重写  没网络时调用
- (void)cn_noNetworking;
////子类重写  有网络时调用
- (void)cn_wifiOrWWANNetworking;

@end
