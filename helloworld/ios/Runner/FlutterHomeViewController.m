//
//  FlutterHomeViewController.m
//  Runner
//
//  Created by txooo on 2019/9/17.
//  Copyright © 2019 The Chromium Authors. All rights reserved.
//

#import "FlutterHomeViewController.h"
#import "NativeViewController.h"

@interface FlutterHomeViewController ()

@end

@implementation FlutterHomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
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

@end
