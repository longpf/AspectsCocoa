//
//  AOPUtility.m
//  Example
//
//  Created by 龙鹏飞 on 2017/1/6.
//  Copyright © 2017年 https://github.com/LongPF/AspectsCocoa. All rights reserved.
//

#import "AOPUtility.h"
#import "NSObject+AOPObserver.h"

inline id srac_func(id target,SEL sel,IMP imp,NSArray *args,BOOL hasReturnValue){
    
    switch (args.count) {
        case 1:
            if (hasReturnValue) {
                id (*func)(id target,SEL sel) = (void *)imp;
                return func(target,sel);
            }else{
                void (*func)(id target, SEL sel) = (void *)imp;
                func(target,sel);
            }
            break;
        case 2:
            if (hasReturnValue) {
                id (*func) (id target,SEL sel, ...) = (void *)imp;
                return func(target,sel,args[1]);
            }else{
                void (*func) (id target,SEL sel, ...) = (void *)imp;
                func(target,sel,args[1]);
            }
            break;
        case 3:
            if (hasReturnValue) {
                id (*func) (id target,SEL sel, ...) = (void *)imp;
                return func(target,sel,args[1],args[2]);
            }else{
                void (*func) (id target,SEL sel, ...) = (void *)imp;
                func(target,sel,args[1],args[2]);
            }
            break;
        case 4:
            if (hasReturnValue) {
                id (*func) (id target,SEL sel, ...) = (void *)imp;
                return func(target,sel,args[1],args[2],args[3]);
            }else{
                void (*func) (id target,SEL sel, ...) = (void *)imp;
                func(target,sel,args[1],args[2],args[3]);
            }
            break;
        case 5:
            if (hasReturnValue) {
                id (*func) (id target,SEL sel, ...) = (void *)imp;
                return func(target,sel,args[1],args[2],args[3],args[4]);
            }else{
                void (*func) (id target,SEL sel, ...) = (void *)imp;
                func(target,sel,args[1],args[2],args[3],args[4]);
            }
            break;
        case 6:
            if (hasReturnValue) {
                id (*func) (id target,SEL sel, ...) = (void *)imp;
                return func(target,sel,args[1],args[2],args[3],args[4],args[5]);
            }else{
                void (*func) (id target,SEL sel, ...) = (void *)imp;
                func(target,sel,args[1],args[2],args[3],args[4],args[5]);
            }
            break;
        case 7:
            if (hasReturnValue) {
                id (*func) (id target,SEL sel, ...) = (void *)imp;
                return func(target,sel,args[1],args[2],args[3],args[4],args[5],args[6]);
            }else{
                void (*func) (id target,SEL sel, ...) = (void *)imp;
                func(target,sel,args[1],args[2],args[3],args[4],args[5],args[6]);
            }
            break;
        case 8:
            if (hasReturnValue) {
                id (*func) (id target,SEL sel, ...) = (void *)imp;
                return func(target,sel,args[1],args[2],args[3],args[4],args[5],args[6],args[7]);
            }else{
                void (*func) (id target,SEL sel, ...) = (void *)imp;
                func(target,sel,args[1],args[2],args[3],args[4],args[5],args[6],args[7]);
            }
            break;
        case 9:
            if (hasReturnValue) {
                id (*func) (id target,SEL sel, ...) = (void *)imp;
                return func(target,sel,args[1],args[2],args[3],args[4],args[5],args[6],args[7],args[8]);
            }else{
                void (*func) (id target,SEL sel, ...) = (void *)imp;
                func(target,sel,args[1],args[2],args[3],args[4],args[5],args[6],args[7],args[8]);
            }
            break;
        case 10:
            if (hasReturnValue) {
                id (*func) (id target,SEL sel, ...) = (void *)imp;
                return func(target,sel,args[1],args[2],args[3],args[4],args[5],args[6],args[7],args[8],args[9]);
            }else{
                void (*func) (id target,SEL sel, ...) = (void *)imp;
                func(target,sel,args[1],args[2],args[3],args[4],args[5],args[6],args[7],args[8],args[9]);
            }
            break;
        case 11:
            if (hasReturnValue) {
                id (*func) (id target,SEL sel, ...) = (void *)imp;
                return func(target,sel,args[1],args[2],args[3],args[4],args[5],args[6],args[7],args[8],args[9],args[10]);
            }else{
                void (*func) (id target,SEL sel, ...) = (void *)imp;
                func(target,sel,args[1],args[2],args[3],args[4],args[5],args[6],args[7],args[8],args[9],args[10]);
            }
            break;
        case 12:
            if (hasReturnValue) {
                id (*func) (id target,SEL sel, ...) = (void *)imp;
                return func(target,sel,args[1],args[2],args[3],args[4],args[5],args[6],args[7],args[8],args[9],args[10],args[11]);
            }else{
                void (*func) (id target,SEL sel, ...) = (void *)imp;
                func(target,sel,args[1],args[2],args[3],args[4],args[5],args[6],args[7],args[8],args[9],args[10],args[11]);
            }
            break;
        case 13:
            if (hasReturnValue) {
                id (*func) (id target,SEL sel, ...) = (void *)imp;
                return func(target,sel,args[1],args[2],args[3],args[4],args[5],args[6],args[7],args[8],args[9],args[10],args[11],args[12]);
            }else{
                void (*func) (id target,SEL sel, ...) = (void *)imp;
                func(target,sel,args[1],args[2],args[3],args[4],args[5],args[6],args[7],args[8],args[9],args[10],args[11],args[12]);
            }
            break;
        case 14:
            if (hasReturnValue) {
                id (*func) (id target,SEL sel, ...) = (void *)imp;
                return func(target,sel,args[1],args[2],args[3],args[4],args[5],args[6],args[7],args[8],args[9],args[10],args[11],args[12],args[13]);
            }else{
                void (*func) (id target,SEL sel, ...) = (void *)imp;
                func(target,sel,args[1],args[2],args[3],args[4],args[5],args[6],args[7],args[8],args[9],args[10],args[11],args[12],args[13]);
            }
            break;
        case 15:
            if (hasReturnValue) {
                id (*func) (id target,SEL sel, ...) = (void *)imp;
                return func(target,sel,args[1],args[2],args[3],args[4],args[5],args[6],args[7],args[8],args[9],args[10],args[11],args[12],args[13],args[14]);
            }else{
                void (*func) (id target,SEL sel, ...) = (void *)imp;
                func(target,sel,args[1],args[2],args[3],args[4],args[5],args[6],args[7],args[8],args[9],args[10],args[11],args[12],args[13],args[14]);
            }
            break;
        case 16:
            if (hasReturnValue) {
                id (*func) (id target,SEL sel, ...) = (void *)imp;
                return func(target,sel,args[1],args[2],args[3],args[4],args[5],args[6],args[7],args[8],args[9],args[10],args[11],args[12],args[13],args[14],args[15]);
            }else{
                void (*func) (id target,SEL sel, ...) = (void *)imp;
                func(target,sel,args[1],args[2],args[3],args[4],args[5],args[6],args[7],args[8],args[9],args[10],args[11],args[12],args[13],args[14],args[15]);
            }
            break;
        case 17:
            if (hasReturnValue) {
                id (*func) (id target,SEL sel, ...) = (void *)imp;
                return func(target,sel,args[1],args[2],args[3],args[4],args[5],args[6],args[7],args[8],args[9],args[10],args[11],args[12],args[13],args[14],args[15],args[16]);
            }else{
                void (*func) (id target,SEL sel, ...) = (void *)imp;
                func(target,sel,args[1],args[2],args[3],args[4],args[5],args[6],args[7],args[8],args[9],args[10],args[11],args[12],args[13],args[14],args[15],args[16]);
            }
            break;
        case 18:
            if (hasReturnValue) {
                id (*func) (id target,SEL sel, ...) = (void *)imp;
                return func(target,sel,args[1],args[2],args[3],args[4],args[5],args[6],args[7],args[8],args[9],args[10],args[11],args[12],args[13],args[14],args[15],args[16],args[17]);
            }else{
                void (*func) (id target,SEL sel, ...) = (void *)imp;
                func(target,sel,args[1],args[2],args[3],args[4],args[5],args[6],args[7],args[8],args[9],args[10],args[11],args[12],args[13],args[14],args[15],args[16],args[17]);
            }
            break;
        case 19:
            if (hasReturnValue) {
                id (*func) (id target,SEL sel, ...) = (void *)imp;
                return func(target,sel,args[1],args[2],args[3],args[4],args[5],args[6],args[7],args[8],args[9],args[10],args[11],args[12],args[13],args[14],args[15],args[16],args[17],args[18]);
            }else{
                void (*func) (id target,SEL sel, ...) = (void *)imp;
                func(target,sel,args[1],args[2],args[3],args[4],args[5],args[6],args[7],args[8],args[9],args[10],args[11],args[12],args[13],args[14],args[15],args[16],args[17],args[18]);
            }
            break;
        case 20:
            if (hasReturnValue) {
                id (*func) (id target,SEL sel, ...) = (void *)imp;
                return func(target,sel,args[1],args[2],args[3],args[4],args[5],args[6],args[7],args[8],args[9],args[10],args[11],args[12],args[13],args[14],args[15],args[16],args[17],args[18],args[19]);
            }else{
                void (*func) (id target,SEL sel, ...) = (void *)imp;
                func(target,sel,args[1],args[2],args[3],args[4],args[5],args[6],args[7],args[8],args[9],args[10],args[11],args[12],args[13],args[14],args[15],args[16],args[17],args[18],args[19]);
            }
            break;
        case 21:
            if (hasReturnValue) {
                id (*func) (id target,SEL sel, ...) = (void *)imp;
                return func(target,sel,args[1],args[2],args[3],args[4],args[5],args[6],args[7],args[8],args[9],args[10],args[11],args[12],args[13],args[14],args[15],args[16],args[17],args[18],args[19],args[20]);
            }else{
                void (*func) (id target,SEL sel, ...) = (void *)imp;
                func(target,sel,args[1],args[2],args[3],args[4],args[5],args[6],args[7],args[8],args[9],args[10],args[11],args[12],args[13],args[14],args[15],args[16],args[17],args[18],args[19],args[20]);
            }
            break;
            
            
        default:
            break;
    }
    
    
    
    return nil;
    
    
};


inline void srac_block(id block,AOPObserverInfo *info){
    
    NSArray *args = info.arguments;
    
    void(^_block)(AOPObserverInfo *,...) = info.block;
    
    switch (args.count) {
        case 1:
            _block(info);
            break;
        case 2:
            _block(info,args[1]);
            break;
        case 3:
            _block(info,args[1],args[2]);
            break;
        case 4:
            _block(info,args[1],args[2],args[3]);
            break;
        case 5:
            _block(info,args[1],args[2],args[3],args[4]);
            break;
        case 6:
            _block(info,args[1],args[2],args[3],args[4],args[5]);
            break;
        case 7:
            _block(info,args[1],args[2],args[3],args[4],args[5],args[6]);
            break;
        case 8:
            _block(info,args[1],args[2],args[3],args[4],args[5],args[6],args[7]);
            break;
        case 9:
            _block(info,args[1],args[2],args[3],args[4],args[5],args[6],args[7],args[8]);
            break;
        case 10:
            _block(info,args[1],args[2],args[3],args[4],args[5],args[6],args[7],args[8],args[9]);
            break;
        case 11:
            _block(info,args[1],args[2],args[3],args[4],args[5],args[6],args[7],args[8],args[9],args[10]);
            break;
        case 12:
            _block(info,args[1],args[2],args[3],args[4],args[5],args[6],args[7],args[8],args[9],args[10],args[11]);
            break;
        case 13:
            _block(info,args[1],args[2],args[3],args[4],args[5],args[6],args[7],args[8],args[9],args[10],args[11],args[12]);
            break;
        case 14:
            _block(info,args[1],args[2],args[3],args[4],args[5],args[6],args[7],args[8],args[9],args[10],args[11],args[12],args[13]);
            break;
        case 15:
            _block(info,args[1],args[2],args[3],args[4],args[5],args[6],args[7],args[8],args[9],args[10],args[11],args[12],args[13],args[14]);
            break;
        case 16:
            _block(info,args[1],args[2],args[3],args[4],args[5],args[6],args[7],args[8],args[9],args[10],args[11],args[12],args[13],args[14],args[15]);
            break;
        case 17:
            _block(info,args[1],args[2],args[3],args[4],args[5],args[6],args[7],args[8],args[9],args[10],args[11],args[12],args[13],args[14],args[15],args[16]);
            break;
        case 18:
            _block(info,args[1],args[2],args[3],args[4],args[5],args[6],args[7],args[8],args[9],args[10],args[11],args[12],args[13],args[14],args[15],args[16],args[17]);
            break;
        case 19:
            _block(info,args[1],args[2],args[3],args[4],args[5],args[6],args[7],args[8],args[9],args[10],args[11],args[12],args[13],args[14],args[15],args[16],args[17],args[18]);
            break;
        case 20:
            _block(info,args[1],args[2],args[3],args[4],args[5],args[6],args[7],args[8],args[9],args[10],args[11],args[12],args[13],args[14],args[15],args[16],args[17],args[18],args[19]);
            break;
        case 21:
            _block(info,args[1],args[2],args[3],args[4],args[5],args[6],args[7],args[8],args[9],args[10],args[11],args[12],args[13],args[14],args[15],args[16],args[17],args[18],args[19],args[20]);
            break;
            
        default:
            break;
    }
    
    
}


@implementation AOPUtility

@end
