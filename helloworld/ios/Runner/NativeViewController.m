//
//  NativeViewController.m
//  Runner
//
//  Created by txooo on 2019/9/17.
//  Copyright © 2019 The Chromium Authors. All rights reserved.
//

#import "NativeViewController.h"
#import <Flutter/Flutter.h>
#import "FlutterHomeViewController.h"

@interface NativeViewController ()

@end

@implementation NativeViewController

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:NO animated:YES];
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    [self.navigationController setNavigationBarHidden:YES animated:YES];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationItem.title = @"原生";
    
    self.view.backgroundColor = UIColor.whiteColor;
    
    UIButton *nextButton = ({
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        [button setTitle:@"前往Flutter" forState:UIControlStateNormal];
        [button setBackgroundColor:UIColor.redColor];
        [button addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
        button.frame = CGRectMake(100, 100, 100, 50);
        button;
    });
    [self.view addSubview:nextButton];
}

- (void)buttonClick:(UIButton *)button {
//    FlutterViewController *flutterViewCtrl = [[FlutterViewController alloc] init];
    FlutterHomeViewController *flutterViewCtrl = [[FlutterHomeViewController alloc] init];
    // 初始化路由
    [flutterViewCtrl setInitialRoute:@"defaultPage"];
    [self.navigationController pushViewController:flutterViewCtrl animated:YES];
    [self.navigationController setNavigationBarHidden:YES animated:NO];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
