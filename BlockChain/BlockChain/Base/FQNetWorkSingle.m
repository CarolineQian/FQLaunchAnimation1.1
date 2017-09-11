//
//  FQNetWorkSingle.m
//  BlockChain
//
//  Created by 冯倩 on 2017/8/29.
//  Copyright © 2017年 冯倩. All rights reserved.
//

#import "FQNetWorkSingle.h"

@implementation FQNetWorkSingle

+ (instancetype)defaultManager
{
    static FQNetWorkSingle *instance = nil;
    static dispatch_once_t onceToken;
    
    dispatch_once( &onceToken,
                  ^{
                      instance = [[self alloc] init];
                  });
    return instance;
}


@end
