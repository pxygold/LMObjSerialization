//
//  main.m
//  LMObjSerializationExample
//
//  Created by Yangyang on 14/10/30.
//  Copyright (c) 2014年 itbox. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AccountTool.h"
int main(int argc, const char * argv[]) {
    @autoreleasepool {
        Account *account = [[Account alloc] init];
        account.memberId = @"10000";
        account.token = @"OERWQSASFASG";
        account.idCardNo = @"1234567890";
        account.realName = @"小明";
        
        [AccountTool saveAccount:account];
        
        NSLog(@"%@",[AccountTool account]);
    }
    return 0;
}
