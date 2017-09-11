//
//  FQActivateButton.h
//  BlockChain
//
//  Created by 冯倩 on 2017/8/31.
//  Copyright © 2017年 冯倩. All rights reserved.
//

#import <UIKit/UIKit.h>

@class FQActivateButton;
@protocol FQActivateButtonDelegate <NSObject>
@optional
- (void)fqActivateButton:(FQActivateButton *)button didEndTimer:(NSDate *)end;
- (void)fqActivateButton:(FQActivateButton *)button didClickedTimer:(NSDate *)clicked;
@end


@interface FQActivateButton : UIButton
@property (nonatomic, weak) id<FQActivateButtonDelegate> delegate;
- (void)startTimer;
@end
