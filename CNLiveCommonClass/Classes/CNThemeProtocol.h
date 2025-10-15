//
//  CNThemeProtocol.h
//  CNLiveNetAdd
//
//  Created by 张旭 on 2017/12/30.
//  Copyright © 2017年 cnlive. All rights reserved.
//


#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

/// 所有主题均应实现这个协议，规定了 QMUI Demo 里常用的几个关键外观属性
@protocol CNThemeProtocol <NSObject>

@required
/// 来自于 QMUIConfigurationTemplate 里的自带方法，用于应用配置表里的设置
- (void)setupConfigurationTemplate;
- (UIColor *)themeTintColor;
- (UIColor *)themeListTextColor;
- (UIColor *)themeCodeColor;
- (UIColor *)themeGridItemTintColor;
- (NSString *)themeName;

@end

/// 所有能响应主题变化的对象均应实现这个协议，目前主要用于 CNCommonViewController 及 CNCommonTableViewController
@protocol CNChangingThemeDelegate <NSObject>

@required
- (void)themeBeforeChanged:(NSObject<CNThemeProtocol> *)themeBeforeChanged afterChanged:(NSObject<CNThemeProtocol> *)themeAfterChanged;

@end
