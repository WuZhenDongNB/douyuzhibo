//
//  PlayerViewController.m
//  Dyzb_UT
//
//  Created by liutao on 17/4/18.
//  Copyright © 2017年 UTOUU. All rights reserved.
//

#import "PlayerViewController.h"
#import "FMGVideoPlayView.h"
#import "YFViewPager.h"
#define HLS_URL @"http://dlhls.cdn.zhanqi.tv/zqlive/"
@interface PlayerViewController ()<FMGVideoPlayViewDelegate>
@property (nonatomic, weak) FMGVideoPlayView *playView;
@property (nonatomic, weak) YFViewPager *pageView;

@end

@implementation PlayerViewController

- (void)viewDidLoad
{
    self.view.backgroundColor = [UIColor whiteColor];
    [self setupPlayView];
    [self setupPageView];
}

- (void)setupPlayView
{
    FMGVideoPlayView *playView = [FMGVideoPlayView videoPlayView];
    self.playView = playView;
    playView.delegate = self;
//    NSString *timeStr = [NSString stringWithFormat:@"%f", (double)[[NSDate date] timeIntervalSince1970]];
//    NSURL *videoUrl = [NSURL URLWithString:[NSString stringWithFormat:@"%@%@.m3u8",HLS_URL,
//                                            @"76068_G5jGr"]];
    playView.urlString = [NSString stringWithFormat:@"%@%@.m3u8",HLS_URL,
                          @"199791_W3kdy"];
//        playView.urlString = [NSString stringWithFormat:@"http://wvideo.spriteapp.cn/video/2016/0328/56f8ec01d9bfe_wpd.mp4"];
    [self.view addSubview:playView];
    playView.Onlines.text = [NSString stringWithFormat:@"%ld",self.roomModel.online];
    // 设置显示位置（竖屏时）
    playView.frame = CGRectMake(0, 20, SCREEN_WIDTH, SCREEN_WIDTH*9/16);
    // 指定一个作为播放的控制器
    playView.contrainerViewController = self;
}

- (void)setupPageView
{
    NSArray *titles = @[@"聊天", @"主播", @"排行"];
    UIWebView *webView = [[UIWebView alloc] init];
    UIView *orangeView = [[UIView alloc] init];
    orangeView.backgroundColor = [UIColor whiteColor];
    UIView *whiteView = [[UIView alloc] init];
    whiteView.backgroundColor = [UIColor whiteColor];
    dispatch_async(dispatch_get_global_queue(0, DISPATCH_QUEUE_PRIORITY_DEFAULT), ^{
        [webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"http://www.xunions.cn"]]];
    });
    NSArray *views = @[webView, whiteView, orangeView];
    
    YFViewPager *pageView = [[YFViewPager alloc] initWithFrame:CGRectMake(0,SCREEN_WIDTH * 9 / 16+20, SCREEN_WIDTH ,SCREEN_HEIGHT-SCREEN_WIDTH * 9 / 16-20)
                                                        titles:titles
                                                         icons:nil
                                                 selectedIcons:nil
                                                         views:views];
    self.pageView = pageView;
    [self.view addSubview:pageView];
    
    // 设置点击操作
    [pageView didSelectedBlock:^(id viewPager, NSInteger index) {
        switch (index) {
            case 0:
            {
                NSLog(@"点击第一个菜单");
            }
                break;
            case 1:
            {
                NSLog(@"点击第二个菜单");
            }
                break;
            case 2:
            {
                NSLog(@"点击第三个菜单");
            }
                break;
                
            default:
                break;
        }
    }];
}

- (void)backAction
{
    self.playView = nil;
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)shareAction
{
    NSLog(@"share");
}



@end
