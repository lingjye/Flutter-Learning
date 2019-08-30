//
//  SampleViewControl.m
//  Runner
//
//  Created by txooo on 2019/8/30.
//  Copyright © 2019 The Chromium Authors. All rights reserved.
//

#import "SampleViewControl.h"

@implementation SampleViewControl
{
    UIView *_templcateView;
    FlutterMethodChannel *_channel;
}

- (instancetype)initWithFrame:(CGRect)frame viewIdentifier:(int64_t)viewIdentifier arguments:(id)args binaryMessenger:(NSObject<FlutterBinaryMessenger> *)messenger {
    if (self = [super init]) {
        _templcateView = [[UIView alloc] init];
        _templcateView.backgroundColor = [UIColor redColor];
        _channel = [FlutterMethodChannel methodChannelWithName:[NSString stringWithFormat:@"sample.demo/native_views_%lld", viewIdentifier] binaryMessenger:messenger];
        __weak __typeof__(self) weakSelf = self;
        [_channel setMethodCallHandler:^(FlutterMethodCall * _Nonnull call, FlutterResult  _Nonnull result) {
            [weakSelf onMethodCall:call result:result];
        }];
        
    }
    return self;
}

- (void)onMethodCall:(FlutterMethodCall *)call result:(FlutterResult)result {
    // 如果方法名匹配
    if ([call.method isEqualToString:@"changeBackgroundColor"]) {
        // 修改视图背景
        _templcateView.backgroundColor = [UIColor blueColor];
//        result(@[@"OK"]);
        result(@0);
    } else {
        // 不支持
        result(FlutterMethodNotImplemented);
    }
}

- (UIView *)view {
    return _templcateView;
}

@end
