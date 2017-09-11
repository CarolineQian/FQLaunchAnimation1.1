//
//  FQBaseController.h
//  BlockChain
//
//  Created by 冯倩 on 2017/8/29.
//  Copyright © 2017年 冯倩. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FQBaseController : UIViewController
{
    BOOL        _isHiddenNavigationBar; //是否隐藏navigation
    BOOL        _isEnableSlidePop;    //是否允许右滑返回
}

//是否允许右滑返回
- (BOOL)isEnableSlidePop;
//自定义返回按钮不包含文字
- (UIButton *)setReturnBarButton;
//自定义返回按钮的点击事件
- (void)returnBarButtonAction;
//弹出登陆注册页面
- (void)popLoginReloadController;

@end
