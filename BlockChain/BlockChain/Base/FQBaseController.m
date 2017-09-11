//
//  FQBaseController.m
//  BlockChain
//
//  Created by 冯倩 on 2017/8/29.
//  Copyright © 2017年 冯倩. All rights reserved.
//

#import "FQBaseController.h"
#import "FQReloadController.h"

@interface FQBaseController ()

@end

@implementation FQBaseController
- (instancetype)init
{
    self = [super init];
    if (self)
    {
        self.hidesBottomBarWhenPushed = YES;
    }
    return self;
}
//Xib创建
- (instancetype)initWithCoder:(NSCoder *)coder
{
    self = [super initWithCoder:coder];
    if (self)
    {
        self.hidesBottomBarWhenPushed = YES;
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    _isHiddenNavigationBar = NO;   //默认显示
    _isEnableSlidePop = YES;       //默认右滑返回
    //页面背景色
    self.view.backgroundColor = [UIColor grayColor];
    //监听用户网络状态的变化
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(notificationOfNetworkChanged:) name:@"FQNotificationNetworkChanged" object:nil];
}


- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:_isHiddenNavigationBar animated:animated];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}


#pragma mark - w
- (void)notificationOfNetworkChanged:(NSNotification *)notification
{
    NSLog(@"无网络,请检查网络设置");
}

#pragma mark - Member Functions
- (BOOL)isEnableSlidePop
{
    return _isEnableSlidePop;
}

- (UIButton *)setReturnBarButton
{
    UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 30, 44)];
    [btn setImage:[UIImage imageNamed:@"toast_icon_fail"] forState:UIControlStateNormal];
    btn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    [btn addTarget:self action:@selector(returnBarButtonAction) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *backBtn = [[UIBarButtonItem alloc] initWithCustomView:btn];
    self.navigationItem.leftBarButtonItem = backBtn;
    return btn;
}

- (void)returnBarButtonAction
{
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)popLoginReloadController
{
    FQReloadController *controller = [[FQReloadController alloc]init];
    [self.navigationController pushViewController:controller animated:YES];
}



@end
