//
//  AccountTool.m
//  LMObjSerializationExample
//
//  Created by Yangyang on 14/10/30.
//  Copyright (c) 2014年 itbox. All rights reserved.
//

#import "AccountTool.h"
#define AccountFile [[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject] stringByAppendingPathComponent:@"Account.data"]
@implementation AccountTool
+(void)saveAccount:(Account *)account
{
    [NSKeyedArchiver archiveRootObject:account toFile:AccountFile];
}
+(Account *)account
{
    return [NSKeyedUnarchiver unarchiveObjectWithFile:AccountFile];
}
@end
