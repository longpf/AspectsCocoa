AspectsCocoa
==============

[![License MIT](https://img.shields.io/badge/license-MIT-green.svg?style=flat)](https://raw.githubusercontent.com/AspectsCocoa/AspectsCocoa/master/LICENSE)&nbsp;
[![CocoaPods](http://img.shields.io/cocoapods/v/AspectsCocoa.svg?style=flat)](http://cocoapods.org/?q= AspectsCocoa)&nbsp;
[![Support](https://img.shields.io/badge/support-iOS%206%2B%20-red.svg?style=flat)](https://www.apple.com/nl/ios/)&nbsp;

一个简单实现AOP的库

什么是AOP?
===============

**AOP: Aspect Oriented Programming 面向切面编程。**

面向切面编程(也叫面向方面)：Aspect Oriented Programming(AOP),是目前软件开发中的一个热点。利用AOP可以对业务逻辑的各个部分进行隔离，从而使得业务逻辑各部分之间的耦合度降低，提高程序的可重用性，同时提高了开发的效率。　　
AOP是OOP的延续，是（Aspect Oriented Programming）的缩写，意思是面向切面（方面）编程。　　

[详细可以参看这里>>](http://www.jianshu.com/p/a833d114099a)  


如何使用?
===============

**添加 :**

```

[self.label addObserver:self forSelector:@selector(setText:) withBlock:^(AOPObserverInfo *info,NSString *text){

        NSLog(@"text = %@",text);

}];
 
    
[self.label addObserver:self forSelector:@selector(drawTextInRect:) withBlock:^(AOPObserverInfo *info,NSValue *rectValue){
        
        NSLog(@"rectValue = %@",rectValue);
        
 }];

```

**移除 :**


`[self.label removeObserver:self forSelector:@selector(setText:)];`

**or**

`[self.label removeObserver:self];`


[详细可以参看demo>>](https://github.com/LongPF/AspectsCocoa)

安装
===============

### CocoaPods
`pod 'AspectsCocoa'`

### 手动
将**AspectsCocoa**文件夹拖到项目中




实现原理
===============

[可以参看我的博客>>](http://longpengfei.com/2017/01/10/AspectsCocoa/)


其他
===============

如果大家发现什么错误,建议可以联系我 QQ466142249