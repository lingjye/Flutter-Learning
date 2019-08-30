//
//  SampleViewFactory.h
//  Runner
//
//  Created by txooo on 2019/8/30.
//  Copyright © 2019 The Chromium Authors. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol FlutterPlatformViewFactory;
@protocol FlutterBinaryMessenger;
NS_ASSUME_NONNULL_BEGIN

@interface SampleViewFactory : NSObject<FlutterPlatformViewFactory>

- (instancetype)initWithMessenger:(NSObject<FlutterBinaryMessenger> *)messager;

@end

NS_ASSUME_NONNULL_END
