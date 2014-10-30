//
//  LMObjSerialization.m
//  Runtime
//
//  Created by Yangyang on 14/10/29.
//  Copyright (c) 2014年 itbox. All rights reserved.
//

#import "LMObjSerialization.h"
#import <objc/runtime.h>
@implementation LMObjSerialization

+ (NSArray *)attributeArrayWithClass:(Class)Obj
{
    NSMutableArray *attributeArr = [NSMutableArray array];
    
    unsigned int count = 0;
    
    // 1.获得类中的所有的成员变量
    Ivar *ivars =  class_copyIvarList([Obj class], &count);
    
    // 2.遍历所有的成员变量
    for (int i = 0; i < count; i++) {
        Ivar ivar = ivars[i];
        
        NSString *propertyName = [NSString stringWithUTF8String:ivar_getName(ivar)];
        if ([propertyName hasPrefix:@"_"]) {
            propertyName = [propertyName stringByReplacingCharactersInRange:NSMakeRange(0, 1) withString:@""];
        }
        [attributeArr addObject:propertyName];
    }
    // 3.释放内存
    free(ivars);
    
    if ([Obj superclass] != [NSObject class]) {
        [attributeArr addObjectsFromArray:[self attributeArrayWithClass:[Obj superclass]]];
    }
    return [attributeArr copy];
}

+ (void)encodeWithCoder:(NSCoder *)encoder obj:(NSObject *)obj
{

    NSArray *attributeArr = [self attributeArrayWithClass:[obj class]];
    
    for (NSString *attribute in attributeArr) {
        SEL sel = NSSelectorFromString(attribute);
        if ([obj respondsToSelector:sel]) {
            [encoder encodeObject:[obj performSelector:sel] forKey:attribute];
        }
    }
}

+ (void)decodeWithCoder:(NSCoder *)decoder obj:(NSObject *)obj
{
    NSArray *attributeArr = [self attributeArrayWithClass:[obj class]];
    
    for (NSString *attribute in attributeArr) {
        SEL sel = [self createSetName:attribute];
        if ([obj respondsToSelector:sel]) {
            [obj performSelector:sel withObject:[decoder decodeObjectForKey:attribute]];
        }
    }
}

+ (SEL) createSetName:(NSString *)key
{
    NSString *capital = [[key substringToIndex:1] uppercaseString];
    NSString *setterSelStr = [NSString stringWithFormat:@"set%@%@:",capital,[key substringFromIndex:1]];
    return NSSelectorFromString(setterSelStr);
}

+ (NSString *)descriptionWithObj:(NSObject *)obj
{
    NSString *str = @"";
    NSArray *attributeArr = [self attributeArrayWithClass:[obj class]];
    
    for (NSString *attribute in attributeArr) {
        SEL sel = NSSelectorFromString(attribute);
        if ([obj respondsToSelector:sel]) {
            str = [str stringByAppendingString:[NSString stringWithFormat:@"%@ = %@,",attribute,[obj performSelector:sel]]];
        }
    }
    return [str substringToIndex:str.length - 1];
}
@end
