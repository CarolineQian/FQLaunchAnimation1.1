//
//  FQActivateButton.m
//  BlockChain
//
//  Created by 冯倩 on 2017/8/31.
//  Copyright © 2017年 冯倩. All rights reserved.
//

#import "FQActivateButton.h"
#import "YYKit.h"


@implementation FQActivateButton
{
    CADisplayLink   *_displayLink;
    NSDate          *_endTimeData;
    CGFloat         _proress;
    
    //
    NSInteger       _animationDuration;     //动画时长
    CGFloat         _lineWidth;             //线宽度
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        _animationDuration = 10.f;
        _lineWidth = 2.f;
        _proress = 0;
        
        
        self.backgroundColor = [UIColor greenColor];
        self.titleLabel.font = [UIFont systemFontOfSize:18];
        [self setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [self setTitleColor:[UIColor lightGrayColor] forState:UIControlStateHighlighted];
        [self addTarget:self action:@selector(btnAction:) forControlEvents:UIControlEventTouchUpInside];
    }
    return self;
}

- (void)drawRect:(CGRect)rect
{
    CGFloat radius = (self.frame.size.width > self.frame.size.height ? self.frame.size.height : self.frame.size.width) / 2 - _lineWidth;
    
    UIBezierPath *round = [UIBezierPath bezierPath];
    round.lineWidth = _lineWidth;
    [round addArcWithCenter:CGPointMake(self.frame.size.width / 2, self.frame.size.height / 2) radius:radius startAngle:0 endAngle:M_PI * 2 clockwise:YES];
    [[UIColor blackColor] setStroke];
    [round stroke];
    
    UIBezierPath *progress = [UIBezierPath bezierPath];
    progress.lineWidth = _lineWidth;
    [progress addArcWithCenter:CGPointMake(self.frame.size.width / 2, self.frame.size.height / 2) radius:radius startAngle:-M_PI / 2 + (M_PI * 2 * _proress) endAngle:-M_PI / 2 + M_PI * 2 clockwise:YES];
    [[UIColor yellowColor] setStroke];
    [progress stroke];
}

#pragma mark - 外部调用
- (void)startTimer
{
    NSDate *now = [NSDate date];
    _endTimeData = [now dateByAddingSeconds:_animationDuration];
    NSLog(@"_endTimeData是%f",_endTimeData.timeIntervalSince1970);
    _displayLink = [CADisplayLink displayLinkWithTarget:self selector:@selector(displayLinkEvent)];
    [_displayLink addToRunLoop:[NSRunLoop mainRunLoop] forMode:NSRunLoopCommonModes];
}

- (void)displayLinkEvent
{
    NSDate *now = [NSDate date];
    NSTimeInterval current = _endTimeData.timeIntervalSince1970 - now.timeIntervalSince1970;

    if (current >= 0)
    {
        NSLog(@"_endTimeData是%f",_endTimeData.timeIntervalSince1970);
        NSLog(@"now是%f",now.timeIntervalSince1970);
        NSLog(@"~~~~~~~%f",current);
        [self setTitle:[NSString stringWithFormat:@"%0.0fs",current] forState:UIControlStateNormal];
        _proress = (_animationDuration - current) / _animationDuration;
        [self setNeedsDisplay];
    }
    else
    {
        [self stopTimer];
        if (_delegate && [_delegate respondsToSelector:@selector(fqActivateButton:didEndTimer:)])
        {
            [_delegate fqActivateButton:self didEndTimer:now];
        }
    }
}

- (void)btnAction:(UIButton *)sender
{
    [self stopTimer];
        if (_delegate && [_delegate respondsToSelector:@selector(fqActivateButton:didClickedTimer:)])
        {
            [_delegate fqActivateButton:self didClickedTimer:[NSDate date]];
        }
}

#pragma mark - 内部
- (void)stopTimer
{
    if (_displayLink)
        [_displayLink invalidate];
    _displayLink = nil;
}




@end
