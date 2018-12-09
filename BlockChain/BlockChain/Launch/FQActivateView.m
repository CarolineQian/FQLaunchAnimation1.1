//
//  FQActivateView.m
//  BlockChain
//
//  Created by 冯倩 on 2017/8/31.
//  Copyright © 2017年 冯倩. All rights reserved.
//

#import "FQActivateView.h"
#import "FQActivateButton.h"

#define ScreenWidth     [[UIScreen mainScreen] bounds].size.width
#define ScreenHeight    [[UIScreen mainScreen] bounds].size.height

@interface FQActivateView()<FQActivateButtonDelegate>

@end


@implementation FQActivateView
{
    UIImageView *_advertView;
    FQActivateButton    *_timerButton;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        _advertView = [[UIImageView alloc] initWithFrame:self.bounds];
        _advertView.backgroundColor = [UIColor yellowColor];
        [self addSubview:_advertView];
        
        _timerButton = [[FQActivateButton alloc] initWithFrame:CGRectMake(ScreenWidth - 15 - 35, 20, 35, 35)];
        _timerButton.delegate = self;
        [self addSubview:_timerButton];
        [_timerButton startTimer];
    }
    return self;
}


#pragma mark - FQActivateButtonDelegate
- (void)fqActivateButton:(FQActivateButton *)button didEndTimer:(NSDate *)end
{
    [self removeFromSuperview];
}
- (void)fqActivateButton:(FQActivateButton *)button didClickedTimer:(NSDate *)clicked
{
    [self removeFromSuperview];
}


@end
