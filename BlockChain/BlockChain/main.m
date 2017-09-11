//
//  main.m
//  BlockChain
//
//  Created by 冯倩 on 2017/8/18.
//  Copyright © 2017年 冯倩. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"

int main(int argc, char * argv[])
{
    @autoreleasepool
    {
        @try
        {
            return UIApplicationMain(argc, argv, nil, NSStringFromClass([AppDelegate class]));
        }
        @catch(NSException *exception)
        {
            NSLog(@"exception:%@", exception);
        }
        @finally
        {
            
        }

    }
}
