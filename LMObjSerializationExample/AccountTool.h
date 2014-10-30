//
//  AccountTool.h
//  LMObjSerializationExample
//
//  Created by Yangyang on 14/10/30.
//  Copyright (c) 2014年 itbox. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Account.h"
@interface AccountTool : NSObject
/**
 *  存储账号信息
 *
 *  @param account 需要存储的账号
 */
+ (void)saveAccount:(Account *)account;

/**
 *  返回存储的账号信息
 */
+ (Account *)account;
@end
