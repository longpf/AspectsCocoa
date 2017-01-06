//
//  NSObject+AOPObserver.m
//  Example
//
//  Created by 龙鹏飞 on 2017/1/6.
//  Copyright © 2017年 https://github.com/LongPF/AspectsCocoa. All rights reserved.
//

#import "NSObject+AOPObserver.h"
#import <objc/runtime.h>
#import "AOPUtility.h"

static NSString *const kAOPClassPrefix = @"SRACNotifying_";
static void * kAOPAssociatedObserversKey = &kAOPAssociatedObserversKey;

@implementation NSObject (AOPObserver)

#pragma mark - interface methods

- (void)addObserver:(NSObject *)observer forSelector:(SEL)selector withBlock:(id)block
{
    
    Method method = class_getInstanceMethod([self class], selector);
    if (!method) {
        method = class_getClassMethod([self class], selector);
    }
    if (!method) {
        NSAssert(!method, @"方法不存在");
        return;
    }
    
    __block IMP imp = method_getImplementation(method);
    Class clazz = object_getClass(self);
    NSString *clazzName = NSStringFromClass(clazz);
    
    if (![clazzName hasPrefix:kAOPClassPrefix]) {
        clazz = [self makeSRACClassWithOriginalClassName:clazzName];
        //修改isa指针
        object_setClass(self, clazz);
    }
    
    //查看生成的中间类是否有要监听的方法
    if (![self hasSelector:selector]) {
        
        //返回类型
        char returnType[512] = {};
        method_getReturnType(method, returnType, 512);
        
        //判断是否有返回值
        __block BOOL hasReturnValue = strcmp(returnType, @encode(void)) != 0;
        
        //获取method参数个数
        __block int numberOfArgs = method_getNumberOfArguments(method);
        
        const char *types = method_getTypeEncoding(method);
        __block typeof(selector) sselector = selector;
        
        class_addMethod(clazz, selector, imp_implementationWithBlock(^(id target, ...){
            
            
            //计数用，否则va_list 若传过来的不含有nil，则越界
            int counter = numberOfArgs - 1;
            
            //把参数都存到数组里面
            __autoreleasing NSMutableArray *args = [NSMutableArray array];
            
            va_list arguments;
            
            if (target) {
                
                [args addObject:target];
                counter --;
                va_start(arguments, target);
                
                
#define ARGUMENT_NUMBER_TYPE(type)    \
do { \
type val = 0; \
val = va_arg(arguments,type); \
[args addObject:@(val)]; \
} while (0)
                
#define ARGUMENT_VALUE_TYPE(type,actualType)      \
do { \
actualType val; \
val = va_arg(arguments,actualType); \
NSValue *value = [NSValue value:&val withObjCType:type]; \
if (value) {\
[args addObject:value]; \
} \
} while (0);
                
                for (int i = 2; counter -- >= 0; i++) {
                    
                    char argType[512] = {};
                    method_getArgumentType(method, i, argType, 512);
                    
                    if (strcmp(argType, @encode(id)) == 0 || strcmp(argType, @encode(Class)) == 0) {
                        id arg = va_arg(arguments, id);
                        [args addObject:arg];
                    } else if (strcmp(argType, @encode(char)) == 0) {
                        ARGUMENT_NUMBER_TYPE(int);
                    } else if (strcmp(argType, @encode(int)) == 0) {
                        ARGUMENT_NUMBER_TYPE(int);
                    } else if (strcmp(argType, @encode(short)) == 0) {
                        ARGUMENT_NUMBER_TYPE(int);
                    } else if (strcmp(argType, @encode(long)) == 0) {
                        ARGUMENT_NUMBER_TYPE(long);
                    } else if (strcmp(argType, @encode(long long)) == 0) {
                        ARGUMENT_NUMBER_TYPE(long long);
                    } else if (strcmp(argType, @encode(unsigned char)) == 0) {
                        ARGUMENT_NUMBER_TYPE(int);
                    } else if (strcmp(argType, @encode(unsigned int)) == 0) {
                        ARGUMENT_NUMBER_TYPE(unsigned int);
                    } else if (strcmp(argType, @encode(unsigned short)) == 0) {
                        ARGUMENT_NUMBER_TYPE(int);
                    } else if (strcmp(argType, @encode(unsigned long)) == 0) {
                        ARGUMENT_NUMBER_TYPE(unsigned long);
                    } else if (strcmp(argType, @encode(unsigned long long)) == 0) {
                        ARGUMENT_NUMBER_TYPE(unsigned long long);
                    } else if (strcmp(argType, @encode(float)) == 0) {
                        ARGUMENT_NUMBER_TYPE(double);
                    } else if (strcmp(argType, @encode(double)) == 0) {
                        ARGUMENT_NUMBER_TYPE(double);
                    } else if (strcmp(argType, @encode(BOOL)) == 0) {
                        ARGUMENT_NUMBER_TYPE(int);
                    } else if (strcmp(argType, @encode(char *)) == 0) {
                        ARGUMENT_NUMBER_TYPE(const char *);
                    } else if (strcmp(argType, @encode(void (^)(void))) == 0) {
                        __unsafe_unretained id block = nil;
                        block = va_arg(arguments, id);
                        [args addObject:[block copy]];
                    }else if (strcmp(argType, @encode(CGPoint)) == 0) {
                        ARGUMENT_VALUE_TYPE(argType,CGPoint);
                    }else if (strcmp(argType, @encode(CGSize)) == 0) {
                        ARGUMENT_VALUE_TYPE(argType,CGSize);
                    }else if (strcmp(argType, @encode(CGRect)) == 0){
                        ARGUMENT_VALUE_TYPE(argType,CGRect);
                    }
                    else if (strcmp(argType, @encode(UIEdgeInsets)) == 0) {
                        ARGUMENT_VALUE_TYPE(argType,UIEdgeInsets);
                    }
                    
                    
                }
#undef ARGUMENT_VALUE_TYPE
                
#undef ARGUMENT_NUMBER_TYPE
                
                
                
                
                va_end(arguments);
            }
            
            id returnValue = nil;
            
            if (!hasReturnValue) {
                
                srac_func(target, sselector, imp, args, NO);
                
            }else{
                
                returnValue = srac_func(target, sselector, imp, args, YES);
                
            }
            
            NSMutableArray *observers = objc_getAssociatedObject(self, kAOPAssociatedObserversKey);
            for (AOPObserverInfo *info in observers) {
                if (sel_isEqual(info.sel, sselector)) {
                    info.arguments = args;
                    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
                        srac_block(info.block, info);
                    });
                }
            }
            
            return returnValue;
            
        }), types);
    }
    
    //将observer信息存起来
    AOPObserverInfo *info = [[AOPObserverInfo alloc] initWithObserver:observer sel:selector block:block];
    NSMutableArray *observers = objc_getAssociatedObject(self, kAOPAssociatedObserversKey);
    if (!observers) {
        observers = [NSMutableArray array];
        objc_setAssociatedObject(self, (__bridge const void *)(kAOPAssociatedObserversKey), observers, OBJC_ASSOCIATION_RETAIN);
    }
    [observers addObject:info];
    
}


#pragma mark - tool


- (Class)makeSRACClassWithOriginalClassName:(NSString *)originalClassName
{
    //查看是否中间类是否生成过
    NSString *sracClassName = [kAOPClassPrefix stringByAppendingString:originalClassName];
    Class sracClass = NSClassFromString(sracClassName);
    
    if (sracClass) {
        return sracClass;
    }
    
    //没有的话,生成中间类
    Class originClass = NSClassFromString(originalClassName);
    if (!originClass) {
        NSAssert(!originClass, @"参数 originalClassName 有问题");
        return nil;
    }
    sracClass = objc_allocateClassPair(originClass, sracClassName.UTF8String, 0);
    
    //修改class方法 隐藏这个类
    Method classMethod = class_getInstanceMethod(originClass, @selector(class));
    const char *types = method_getTypeEncoding(classMethod);
    class_addMethod(sracClass, @selector(class), imp_implementationWithBlock(^(id target,SEL sel){
        return class_getSuperclass(object_getClass(target));
    }), types);
    
    //告诉runtime 这个类的存在
    objc_registerClassPair(sracClass);
    
    return sracClass;
}

- (BOOL)hasSelector:(SEL)selector
{
    Class clazz = object_getClass(self);
    unsigned int methodCount = 0;
    Method *methodList = class_copyMethodList(clazz, &methodCount);
    for (unsigned int i = 0; i < methodCount; i++) {
        SEL thisSelector = method_getName(methodList[i]);
        if (thisSelector == selector) {
            free(methodList);
            return YES;
        }
    }
    return NO;
}



@end

@implementation AOPObserverInfo

- (instancetype)initWithObserver:(NSObject *)observer sel:(SEL)sel block:(id)block
{
    if (self = [super init]) {
        _observer = observer;
        _sel = sel;
        _block = block;
    }
    return self;
}

- (void)dealloc
{
    if (_observer) {
        [_observer release];
    }
    if (_block) {
        [_block release];
    }
    [super dealloc];
}


@end

