//
//  Account.h
//  LMObjSerializationExample
//
//  Created by Yangyang on 14/10/30.
//  Copyright (c) 2014年 itbox. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Account : NSObject
/**
 *  身份证号
 */
@property(nonatomic,copy)NSString *idCardNo;
/**
 *  姓名
 */
@property(nonatomic,copy)NSString *realName;
/**
 *  memberId
 */
@property(nonatomic,copy)NSString *memberId;
/**
 *  token
 */
@property(nonatomic,copy)NSString *token;
@end
