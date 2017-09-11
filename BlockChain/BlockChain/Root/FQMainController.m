//
//  FQMainController.m
//  BlockChain
//
//  Created by 冯倩 on 2017/8/29.
//  Copyright © 2017年 冯倩. All rights reserved.
//

#import "FQMainController.h"
#import "FQBaseNavigationController.h"
#import "HomePageViewController.h"
#import "SettingController.h"

#import "FQActivateView.h"

@interface FQMainController ()
{
    HomePageViewController *_homeVC;
    FQBaseNavigationController *_nav1;
    
    SettingController *_setVC;
    FQBaseNavigationController *_nav2;
}

@end

@implementation FQMainController

- (instancetype)init
{
    self = [super init];
    if (self)
    {
        //设置底部tabBar
        self.tabBar.barTintColor = [UIColor whiteColor];
        self.tabBar.tintColor = [UIColor redColor];
        
        _homeVC = [[HomePageViewController alloc] init];
        _nav1 = [[FQBaseNavigationController alloc] initWithRootViewController:_homeVC];
        [_nav1.tabBarItem setImage:[UIImage imageNamed:@"toast_icon_fail"]];
        [_nav1.tabBarItem setSelectedImage:[UIImage imageNamed:@"toast_icon_success"] ];
        
        
        
        _setVC = [[SettingController alloc] init];
        _nav2 = [[FQBaseNavigationController alloc] initWithRootViewController:_setVC];
        [_nav2.tabBarItem setImage:[UIImage imageNamed:@"toast_icon_fail"]];
        [_nav2.tabBarItem setSelectedImage:[UIImage imageNamed:@"toast_icon_success"] ];
        
        
        
        [self setViewControllers:@[_nav1,_nav2]];
    }
     return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    

    FQActivateView *view = [[FQActivateView alloc] initWithFrame:self.view.bounds];
    [self.view addSubview:view];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

@end
