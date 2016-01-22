//
//  ViewController.m
//  监测网络状态12-11
//
//  Created by dc004 on 15/12/11.
//  Copyright © 2015年 gang. All rights reserved.
//

#import "ViewController.h"
//引入第三方框架
#import "AFNetworking.h"
@interface ViewController ()


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self checkNetWorkStates];


}
-(void)checkNetWorkStates{
    //1.我们得创建一个用于测试的url
    NSURL *url = [NSURL URLWithString:@"http://www.apple.com"];
    //2.建立一个操作管理
    AFHTTPRequestOperationManager *operationManager = [[AFHTTPRequestOperationManager alloc]initWithBaseURL:url];
    //3.根据不同的网络状态  去做相应处理
    [operationManager.reachabilityManager setReachabilityStatusChangeBlock:^(AFNetworkReachabilityStatus status) {
        switch (status) {
            case AFNetworkReachabilityStatusNotReachable:
                NSLog(@"网络未发现");
                break;
            case AFNetworkReachabilityStatusReachableViaWiFi:
                NSLog(@"通过wifi连接");
                break;
            case AFNetworkReachabilityStatusReachableViaWWAN:
                NSLog(@"通过2G/3G/4G连接");
                break;
            case AFNetworkReachabilityStatusUnknown:
                NSLog(@"不明");
                break;
            default:
                break;
        }
    }];
    //开始监控
    [operationManager.reachabilityManager startMonitoring];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
