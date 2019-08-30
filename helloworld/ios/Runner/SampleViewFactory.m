//
//  SampleViewFactory.m
//  Runner
//
//  Created by txooo on 2019/8/30.
//  Copyright © 2019 The Chromium Authors. All rights reserved.
//

#import "SampleViewFactory.h"
#import <Flutter/Flutter.h>
#import "SampleViewControl.h"

@class SampleViewControl;

@implementation SampleViewFactory
{
    NSObject<FlutterBinaryMessenger> *_messager;
}

- (instancetype)initWithMessenger:(NSObject<FlutterBinaryMessenger> *)messager {
    if (self = [super init]) {
        _messager = messager;
    }
    return self;
}

- (NSObject<FlutterMessageCodec> *)createArgsCodec {
    return [FlutterStandardMessageCodec sharedInstance];
}

- (nonnull NSObject<FlutterPlatformView> *)createWithFrame:(CGRect)frame viewIdentifier:(int64_t)viewId arguments:(id _Nullable)args {
    SampleViewControl *control = [[SampleViewControl alloc] initWithFrame:frame viewIdentifier:viewId arguments:args binaryMessenger:_messager];
    return control;
};


@end
