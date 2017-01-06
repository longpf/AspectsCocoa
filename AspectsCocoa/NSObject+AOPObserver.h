//
//  NSObject+AOPObserver.h
//  Example
//
//  Created by 龙鹏飞 on 2017/1/6.
//  Copyright © 2017年 https://github.com/LongPF/AspectsCocoa. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface AOPObserverInfo : NSObject

@property (nonatomic, assign) NSObject *observer;
@property (nonatomic) SEL sel;
@property (nonatomic, copy) id block;
@property (nonatomic, copy) NSArray *arguments;

- (instancetype)initWithObserver:(NSObject *)observer sel:(SEL)sel block:(id)block;

@end


@interface NSObject (AOPObserver)

- (void)addObserver:(NSObject *)observer forSelector:(SEL)selector withBlock:(id)block;

@end
