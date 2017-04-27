//
//  HomeViewController.m
//  Dyzb_UT
//
//  Created by liutao on 17/4/11.
//  Copyright © 2017年 UTOUU. All rights reserved.
//

#import "HomeViewController.h"

// childvc
#import "RecommendViewController.h"
#import "HandGameViewController.h"
#import "AmuseViewController.h"
#import "GameViewController.h"
#import "FunnyViewController.h"
#import "HomeNaviView.h"

@interface HomeViewController ()<HomeNaviViewDelegate>
@property (nonatomic, strong) NSMutableArray  *viewControllers;
@property (nonatomic, strong) NSArray  *meautitles;
@property (nonatomic, strong) HomeNaviView  *homeCustomNavi;

@end

@implementation HomeViewController

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.titleSizeNormal = 15;
        self.titleSizeSelected = 15;
        self.menuViewStyle = WMMenuViewStyleLine;
        self.menuItemWidth = SCREEN_WIDTH / self.meautitles.count;
        self.progressHeight = kH(3.5);
        self.progressWidth  =  (SCREEN_WIDTH / self.meautitles.count)/2.0;
        self.progressColor = RGB(252, 97, 8);
        self.titleColorSelected = RGB(252, 97, 8);
        self.menuHeight = 44;
    }
    return self;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    //设置导航栏透明
    [self.navigationController.navigationBar setBackgroundImage:[UIImage new] forBarMetrics:UIBarMetricsDefault];
    [self.navigationController.navigationBar setShadowImage:[UIImage new]];
    self.navigationController.navigationBar.hidden = YES;
    [self setNaviBar];
    [self setTitleView];
}

- (void)setNaviBar {
 
    [self.view addSubview:self.homeCustomNavi];
}

- (void)setTitleView {

   //
}

- (void)setContentView {


}

#pragma mark - lazyLoad
- (NSMutableArray *)viewControllers {

    if (!_viewControllers) {
        _viewControllers = [NSMutableArray array];
        [_viewControllers addObject:[[RecommendViewController alloc] init]];
        [_viewControllers addObject:[[HandGameViewController alloc] init]];
        [_viewControllers addObject:[[AmuseViewController alloc] init]];
        [_viewControllers addObject:[[GameViewController alloc] init]];
        [_viewControllers addObject:[[FunnyViewController alloc] init]];
    }
    return _viewControllers;
}
- (NSArray *)meautitles {

    if (!_meautitles) {
        _meautitles = @[@"推荐",@"手游",@"娱乐",@"游戏",@"趣玩"];
    }
    return _meautitles;
}

- (HomeNaviView *)homeCustomNavi {
    if (!_homeCustomNavi) {
        _homeCustomNavi = [[HomeNaviView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 64)];
        _homeCustomNavi.delegate = self;
        _homeCustomNavi.backgroundColor = RGB(255, 139, 38);
    }
    return _homeCustomNavi;
}


#pragma mark - Datasource/delegate
- (NSInteger)numbersOfChildControllersInPageController:(WMPageController *)pageController {
    return self.meautitles.count;
}

- (UIViewController *)pageController:(WMPageController *)pageController viewControllerAtIndex:(NSInteger)index {
    return self.viewControllers[index];
}
- (NSString *)pageController:(WMPageController *)pageController titleAtIndex:(NSInteger)index {
    return self.meautitles[index];
}
#pragma mark - HomeNaviDelegate/首页Navi的点击实现
- (void)leftImageViewBtnWith:(HomeNaviView *)homeNaviView {

    NSLog(@"点击斗鱼");

}
- (void)titleViewLeftViewBtnWith:(HomeNaviView *)homeNaviView {


}
- (void)QrcodeBtnWith:(HomeNaviView *)homeNaviView {

}

- (void)gameBtnWith:(HomeNaviView *)homeNaviView {


}

- (void)lockBtnWith:(HomeNaviView *)homeNaviView {


}
@end
