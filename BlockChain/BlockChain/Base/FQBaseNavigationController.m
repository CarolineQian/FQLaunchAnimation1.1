
//
//  FQBaseNavigationController.m
//  BlockChain
//
//  Created by 冯倩 on 2017/8/29.
//  Copyright © 2017年 冯倩. All rights reserved.
//

#import "FQBaseNavigationController.h"
#import "FQBaseController.h"

@interface FQBaseNavigationController ()<UIGestureRecognizerDelegate, UINavigationControllerDelegate>

@end

@implementation FQBaseNavigationController
- (void)viewDidLoad
{
    [super viewDidLoad];
    self.delegate = self;
    //interactivePopGestureRecognizer 右滑POP手势
    if ([self respondsToSelector:@selector(interactivePopGestureRecognizer)])
    {
        self.interactivePopGestureRecognizer.delegate = (id<UIGestureRecognizerDelegate>)self;
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

#pragma mark - 重写父类
- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    if ([self respondsToSelector:@selector(interactivePopGestureRecognizer)])
    {
        self.interactivePopGestureRecognizer.enabled = NO;
    }
    [super pushViewController:viewController animated:animated];
}

- (UIViewController *)popViewControllerAnimated:(BOOL)animated
{
    if ([self respondsToSelector:@selector(interactivePopGestureRecognizer)])
    {
        if (self.interactivePopGestureRecognizer.state == UIGestureRecognizerStatePossible)
        {
            self.interactivePopGestureRecognizer.enabled = NO;
        }
    }
    return [super popViewControllerAnimated:animated];
}

- (void)navigationController:(UINavigationController *)navigationController didShowViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    if ([self respondsToSelector:@selector(interactivePopGestureRecognizer)])
    {
        self.interactivePopGestureRecognizer.enabled = YES;
    }
}


#pragma mark - UIGestureRecognizerDelegate

- (BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer
{
    if (gestureRecognizer == self.interactivePopGestureRecognizer)
    {
        FQBaseController *vc = (FQBaseController *)self.topViewController;
        if ([vc respondsToSelector:@selector(isEnableSlidePop)] && ![vc isEnableSlidePop])
        {
            return NO;
        }
        return (self.viewControllers.count>1);
    }
    else
    {
        return YES;
    }
}


@end
