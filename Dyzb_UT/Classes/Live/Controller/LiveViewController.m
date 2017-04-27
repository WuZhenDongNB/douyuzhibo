//
//  LiveViewController.m
//  Dyzb_UT
//
//  Created by liutao on 17/4/11.
//  Copyright © 2017年 UTOUU. All rights reserved.
//

#import "LiveViewController.h"
#import "WMPageController.h"
#import "CommendLiveViewController.h"
@interface LiveViewController ()

@end

@implementation LiveViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self bulidNavigationBarView];
  
    
}
-(instancetype)init{
    self = [super init];
    
    
    if (self ) {
        self = [self addPageController];
        
    }return self;
    
}
- (void)bulidNavigationBarView
{
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"head_crown_24x24"] style:UIBarButtonItemStylePlain target:self action:@selector(rightBarClick)];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"search_15x14"] style:UIBarButtonItemStylePlain target:self action:@selector(leftBarClick)];

}
- (void)rightBarClick{
    
}
- (void)leftBarClick{
    
}
-(LiveViewController *)addPageController{
    // 1.5
    NSMutableArray *salesVCs = [[NSMutableArray alloc] init];
    NSMutableArray *salesVCTitles = [[NSMutableArray alloc] init];
    for (int i = 0; i < 2; i++) {
        Class vcClass;
        NSString *title;
        switch (i) {
            case 0:
                vcClass = [CommendLiveViewController class];
                title = @"推荐";
                break;
            case 1:
                vcClass = [CommendLiveViewController class];
                title = @"关注";
                break;
        }
        [salesVCs addObject:vcClass];
        [salesVCTitles addObject:title];
    }
    
    
    
  LiveViewController *salesVC = [[LiveViewController alloc] initWithViewControllerClasses:salesVCs andTheirTitles:salesVCTitles];
    
    //在导航栏上展示
    salesVC.progressHeight = 3;
    salesVC.menuHeight = 44;
    salesVC.menuViewStyle = WMMenuViewStyleLine;
    salesVC.titleSizeSelected = 18;
    salesVC.titleSizeNormal = 18;
    salesVC.titleColorSelected = [UIColor colorWithRed:8/255.0 green:206/255.0 blue:109/255.0 alpha:1];
    salesVC.menuViewContentMargin = 0;
    salesVC.showOnNavigationBar = YES;
    salesVC.menuBGColor = [UIColor clearColor];
    return salesVC;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
