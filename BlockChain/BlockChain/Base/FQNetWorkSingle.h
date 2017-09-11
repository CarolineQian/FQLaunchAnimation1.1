//
//  FQNetWorkSingle.h
//  BlockChain
//
//  Created by 冯倩 on 2017/8/29.
//  Copyright © 2017年 冯倩. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AFNetworking.h"

@interface FQNetWorkSingle : NSObject
@property (nonatomic, assign) AFNetworkReachabilityStatus currentNetworkStatus;
@property (nonatomic, assign) AFNetworkReachabilityStatus oldNetworkStatus;

+ (instancetype)defaultManager;

@end
