//
//  FQReloadController.m
//  BlockChain
//
//  Created by 冯倩 on 2017/8/29.
//  Copyright © 2017年 冯倩. All rights reserved.
//

#import "FQReloadController.h"

@interface FQReloadController ()

@end

@implementation FQReloadController

- (instancetype)init
{
    self = [super init];
    if (self)
    {
        self.hidesBottomBarWhenPushed = NO;
        self.title = @"登陆";
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

@end
