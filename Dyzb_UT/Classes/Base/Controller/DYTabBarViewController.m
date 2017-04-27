//
//  DYTabBarViewController.m
//  Dyzb_UT
//
//  Created by liutao on 17/4/11.
//  Copyright © 2017年 UTOUU. All rights reserved.
//

#import "DYTabBarViewController.h"
#import "HomeViewController.h"
#import "FindViewController.h"
#import "FollowViewController.h"
#import "LiveViewController.h"
#import "UserViewController.h"


@interface DYTabBarViewController ()

@end

@implementation DYTabBarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self initUI];
}

- (void)initUI {

    UINavigationController *pHomeNavController = [[UINavigationController alloc] initWithRootViewController:[HomeViewController new]];
    pHomeNavController.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"首页" image:[[UIImage imageNamed:@"btn_home_normal"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] selectedImage:[[UIImage imageNamed:@"btn_home_selected"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];

    UINavigationController *pLiveViewController = [[UINavigationController alloc] initWithRootViewController:[LiveViewController new]];
    pLiveViewController.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"直播" image:[[UIImage imageNamed:@"btn_column_normal"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] selectedImage:[[UIImage imageNamed:@"btn_column_selected"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
    
    UINavigationController *pFollowViewController = [[UINavigationController alloc] initWithRootViewController:[FollowViewController new]];
    pFollowViewController.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"关注" image:[[UIImage imageNamed:@"btn_live_normal"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] selectedImage:[[UIImage imageNamed:@"btn_live_selected"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
    
    UINavigationController *pFindViewController = [[UINavigationController alloc] initWithRootViewController:[FindViewController new]];
    pFindViewController.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"发现" image:[[UIImage imageNamed:@"icon_news_normal"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] selectedImage:[[UIImage imageNamed:@"icon_news_clickable"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
    
    UINavigationController *pUserViewController = [[UINavigationController alloc] initWithRootViewController:[UserViewController new]];
    pUserViewController.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"我的" image:[[UIImage imageNamed:@"btn_user_normal"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] selectedImage:[[UIImage imageNamed:@"btn_user_selected"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];

    self.viewControllers = @[pHomeNavController,pLiveViewController,pFollowViewController,pFindViewController,pUserViewController];

    self.tabBar.translucent = NO;
    self.selectedIndex = 0;
}


@end
