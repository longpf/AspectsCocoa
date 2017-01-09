//
//  AOPUtility.h
//  Example
//
//  Created by 龙鹏飞 on 2017/1/6.
//  Copyright © 2017年 https://github.com/LongPF/AspectsCocoa. All rights reserved.
//

#import <Foundation/Foundation.h>

@class AOPObserverInfo;

/**
 将IMP转换换成对应的参数个数的方法并执行
 
 @param target         执行对象
 @param sel            方法
 @param imp            实现
 @param args           参数数组
 @param hasReturnValue 返回值
 
 @return 原方法如果有返回值 则返回对应值
 */
id aop_func(id target,SEL sel,IMP imp,NSArray *args,BOOL hasReturnValue);

void aop_block(id block,AOPObserverInfo *info);

@interface AOPUtility : NSObject

@end
