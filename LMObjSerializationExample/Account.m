//
//  Account.m
//  LMObjSerializationExample
//
//  Created by Yangyang on 14/10/30.
//  Copyright (c) 2014年 itbox. All rights reserved.
//

#import "Account.h"
#import "LMObjSerialization.h"
@implementation Account
/**
 *  从文件中解析对象的时候调
 */
- (id)initWithCoder:(NSCoder *)decoder
{
    if (self = [super init]) {
        [LMObjSerialization decodeWithCoder:decoder obj:self];
    }
    return self;
}


/**
 *  将对象写入文件的时候调用
 */
- (void)encodeWithCoder:(NSCoder *)encoder
{
    [LMObjSerialization encodeWithCoder:encoder obj:self];
}

- (NSString *)description
{
    return [LMObjSerialization descriptionWithObj:self];
}
@end
