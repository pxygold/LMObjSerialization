//
//  LMObjSerialization.h
//  Runtime
//
//  Created by Yangyang on 14/10/29.
//  Copyright (c) 2014年 itbox. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LMObjSerialization : NSObject
/**
 *  通过类名来创建一个属性数组
 *
 *  @param Obj 类名
 *
 *  @return 属性数组
 */
+ (NSArray *)attributeArrayWithClass:(Class)Obj;

/**
 *  从文件中解析对象的时候调用
 *
 *  @param obj     对象
 */
+ (void)encodeWithCoder:(NSCoder *)encoder obj:(NSObject *)obj;

/**
 *  将对象写入文件的时候调用
 *
 *  @param obj     对象
 */
+ (void)decodeWithCoder:(NSCoder *)decoder obj:(NSObject *)obj;

/**
 *  打印对象的具体信息
 *
 *  @param obj 对象
 *
 *  @return 信息字符串
 */
+ (NSString *)descriptionWithObj:(NSObject *)obj;
@end
