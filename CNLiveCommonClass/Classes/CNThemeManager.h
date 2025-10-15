//
//  CNThemeManager.h
//  CNLiveNetAdd
//
//  Created by 张旭 on 2017/12/30.
//  Copyright © 2017年 cnlive. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CNThemeProtocol.h"

// 当主题发生变化时，会发送这个通知
extern NSString *const CNThemeChangedNotification;

// 主题发生改变前的值，类型为 NSObject<CNThemeProtocol>，可能为 NSNull
extern NSString *const CNThemeBeforeChangedName;

// 主题发生改变后的值，类型为 NSObject<CNThemeProtocol>，可能为 NSNull
extern NSString *const CNThemeAfterChangedName;

/**
 *  QMUI Demo 的皮肤管理器，当需要换肤时，请为 currentTheme 赋值；当需要获取当前皮肤时，可访问 currentTheme 属性。
 *  可通过监听 CNThemeChangedNotification 通知来捕获换肤事件，默认地，CNCommonViewController 及 CNCommonTableViewController 均已支持响应换肤，其响应方法是通过 CNChangingThemeDelegate 接口来实现的。
 */
@interface CNThemeManager : NSObject
@property(nonatomic, strong) NSObject<CNThemeProtocol> *currentTheme;

+ (instancetype)sharedInstance;

@end
