#include "AppDelegate.h"
#include "GeneratedPluginRegistrant.h"
#import "SampleViewFactory.h"

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application
    didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
  [GeneratedPluginRegistrant registerWithRegistry:self];
  // Override point for customization after application launch.
  
    [self configMethodChannel];
    [self registerViewFactory];
  return [super application:application didFinishLaunchingWithOptions:launchOptions];
}

- (void)configMethodChannel {
    FlutterMethodChannel *channel = [FlutterMethodChannel methodChannelWithName:@"samples.demo/test" binaryMessenger:(FlutterViewController *)self.window.rootViewController];
    [channel setMethodCallHandler:^(FlutterMethodCall * _Nonnull call, FlutterResult  _Nonnull result) {
        if ([@"openAppMarket" isEqualToString:call.method]) {
            // 打开App Store
            [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"itms-app://itunes.apple.com/cn/app/id387682726"]];
            result(call.arguments);
        } else {
            result(FlutterMethodNotImplemented);
        }
    }];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [channel invokeMethod:@"testInvokeFlutter" arguments:@{@"key" : @"value"} result:^(id  _Nullable result) {
            NSLog(@"%@", result);
        }];
    });
}

- (void)registerViewFactory {
    // 生成注册类
    NSObject<FlutterPluginRegistrar> *registrar = [self registrarForPlugin:@"sample.demo/native_views"];
    SampleViewFactory *viewFactory = [[SampleViewFactory alloc] initWithMessenger:registrar.messenger];
    [registrar registerViewFactory:viewFactory withId:@"sampleView"];
}

@end

#import "NativeViewController.h"

@implementation NativeAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    self.window.backgroundColor = UIColor.whiteColor;
    NativeViewController *viewCtrl = [[NativeViewController alloc] init];
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:viewCtrl];
    self.window.rootViewController = nav;
    [self.window makeKeyAndVisible];
    return YES;
}

@end
