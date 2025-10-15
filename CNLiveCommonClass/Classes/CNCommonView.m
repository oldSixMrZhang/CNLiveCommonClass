//
//  CNCommonView.m
//  CNLiveNetAdd
//
//  Created by 张旭 on 2018/1/9.
//  Copyright © 2018年 cnlive. All rights reserved.
//

#import "CNCommonView.h"
#import "CNThemeManager.h"

@implementation CNCommonView
- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self didInitialized];
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    if (self = [super initWithCoder:aDecoder]) {
        [self didInitialized];
    }
    return self;
}

- (void)didInitialized {
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(handleThemeChangedNotification:) name:CNThemeChangedNotification object:nil];
}

- (void)handleThemeChangedNotification:(NSNotification *)notification {
    NSObject<CNThemeProtocol> *themeBeforeChanged = notification.userInfo[CNThemeBeforeChangedName];
    NSObject<CNThemeProtocol> *themeAfterChanged = notification.userInfo[CNThemeAfterChangedName];
    [self themeBeforeChanged:themeBeforeChanged afterChanged:themeAfterChanged];
}

#pragma mark - <CNChangingThemeDelegate>
- (void)themeBeforeChanged:(NSObject<CNThemeProtocol> *)themeBeforeChanged afterChanged:(NSObject<CNThemeProtocol> *)themeAfterChanged {
    
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
