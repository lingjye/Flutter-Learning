//
//  FlutterViewController+MethodChannel.m
//  Runner
//
//  Created by txooo on 2019/9/17.
//  Copyright © 2019 The Chromium Authors. All rights reserved.
//

#import "FlutterViewController+MethodChannel.h"
#import <objc/runtime.h>
#import "NativeViewController.h"

@implementation FlutterViewController (MethodChannel)
#if 0
+ (void)load {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        [[self class] swizzleMethod:@selector(viewDidLoad) withMethod:@selector(lj_viewDidLoad)];
    });
}

- (void)lj_viewDidLoad {
    [self lj_viewDidLoad];
    FlutterMethodChannel *channel = [FlutterMethodChannel methodChannelWithName:@"samples.flutter/navigation" binaryMessenger:self];
    [channel setMethodCallHandler:^(FlutterMethodCall * _Nonnull call, FlutterResult  _Nonnull result) {
        // 方法名称
        if ([call.method isEqualToString:@"openNativePage"]) {
            // 打开新的原生页面
            NativeViewController *vc = [[NativeViewController alloc] init];
            [self.navigationController pushViewController:vc animated:YES];
            result(@0);
        } else if ([call.method isEqualToString:@"closeFlutterPage"]) {
            // 关闭
            [self.navigationController popViewControllerAnimated:YES];
            result(@0);
        } else {
            result(FlutterMethodNotImplemented);
        }
    }];
}

+ (void)swizzleMethod:(SEL)originalSelector withMethod:(SEL)swizzledSelector {
    Method originalMethod = class_getInstanceMethod(self, originalSelector);
    Method swizzledMethod = class_getInstanceMethod(self, swizzledSelector);
    BOOL didAddMethod = class_addMethod(self, originalSelector, method_getImplementation(swizzledMethod), method_getTypeEncoding(swizzledMethod));
    if (didAddMethod) {
        class_replaceMethod(self, swizzledSelector, method_getImplementation(originalMethod), method_getTypeEncoding(originalMethod));
    }else {
        method_exchangeImplementations(originalMethod, swizzledMethod);
    }
}
#endif
@end
