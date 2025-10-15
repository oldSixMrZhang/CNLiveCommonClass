//
//  CNThemeManager.m
//  CNLiveNetAdd
//
//  Created by 张旭 on 2017/12/30.
//  Copyright © 2017年 cnlive. All rights reserved.
//

#import "CNThemeManager.h"

NSString *const CNThemeChangedNotification = @"CNThemeChangedNotification";
NSString *const CNThemeBeforeChangedName = @"CNThemeBeforeChangedName";
NSString *const CNThemeAfterChangedName = @"CNThemeAfterChangedName";

@implementation CNThemeManager
+ (instancetype)sharedInstance {
    static dispatch_once_t onceToken;
    static CNThemeManager *instance = nil;
    dispatch_once(&onceToken,^{
        instance = [[super allocWithZone:NULL] init];
    });
    return instance;
}

+ (id)allocWithZone:(struct _NSZone *)zone{
    return [self sharedInstance];
}

- (void)setCurrentTheme:(NSObject<CNThemeProtocol> *)currentTheme {
    BOOL isThemeChanged = _currentTheme != currentTheme;
    NSObject<CNThemeProtocol> *themeBeforeChanged = nil;
    if (isThemeChanged) {
        themeBeforeChanged = _currentTheme;
    }
    _currentTheme = currentTheme;
    if (isThemeChanged) {
        [currentTheme setupConfigurationTemplate];
        [[NSNotificationCenter defaultCenter] postNotificationName:CNThemeChangedNotification object:self userInfo:@{CNThemeBeforeChangedName: themeBeforeChanged ?: [NSNull null], CNThemeAfterChangedName: currentTheme ?: [NSNull null]}];
    }
}

@end
