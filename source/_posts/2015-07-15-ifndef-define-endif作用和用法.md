title: ifndef/define/endif作用和用法
date: 2015-07-15 20:14:06
categories:
- C++
tags:
- ifndef
- define
- endif
---
>【转】原创作品，允许转载。转载时请务必以超链接形式标明文章原始出处、作者信息和本声明，否则将追究法律责任。
>[http://blog.sina.com.cn/s/blog_6398cade0100hi69.html](http://blog.sina.com.cn/s/blog_6398cade0100hi69.html "http://blog.sina.com.cn/s/blog_6398cade0100hi69.html")

**问题**：ifndef/define/endif”主要目的是防止头文件的重复包含和编译,偶只知道这个概念不懂的是怎么个用法,和为什么要用它\~~高手请指点一下\~~谢谢~~~!!!

**用法**：
.h文件，如下：
``` cpp
#ifndef XX_H
#define XX_H
...
#endif
```
这样如果有两个地方都包含这个头文件，就不会出现两次包含的情况 。。
因为在第二次包含时 XX_H 已经有定义了，所以就不再 include了
``` cpp
#ifndef GRAPHICS_H // 防止graphics.h被重复引用
#define GRAPHICS_H
 
#include <math.h> // 引用标准库的头文件
…
#include “myheader.h” // 引用非标准库的头文件
…
void Function1(…); // 全局函数声明
…
class Box // 类结构声明
{
…
};
#endif
```

那是指你建立多个文件时，多个文件里都包含这个头文件
给你举个例子，再顺便分析一下：
假设你的工程里面有4个文件，分别是a.cpp,b.h,c.h,d.h。
a.cpp的头部是：
``` cpp
#include "b.h "
#include "c.h "
```

b.h和c.h的头部都是:
``` cpp
#include "d.h "
```
而d.h里面有class D的定义。

这样一来，
编译器编译a.cpp的时候，先根据#include "b.h "去编译b.h这个问题，再根据b.h里面的#include "d.h "，去编译d.h的这个文件，这样就把d.h里面的class D编译了；
然后再根据a.cpp的第二句#include "c.h "，去编译c.h，最终还是会找到的d.h里面的class D，但是class D之前已经编译过了，所以就会报重定义错误。

加上ifndef/define/endif，就可以防止这种重定义错误。

A.h 里
``` cpp
#ifndef A_H
#define A_H
...
#endif
```
B.h 和 C.h都include "A.h "

D.h里
``` cpp
include "B.h "
include "C.h "
```

在预编译的过程中，执行到include "C.h "时会因为在上一句的时候已经定义了A_H这个宏，所以此时的的
的ifndef条件不满足，也就不会再一次包含A.h，起到了防止重复引用头文件的效果。

1.比如你有两个C文件，这两个C文件都include了同一个头文件。而编译时，这两个C文件要一同编译成一个可运行文件，于是问题来了，大量的声明冲突。 还是把头文件的内容都放在#ifndef和#endif中吧。
不管你的头文件会不会被多个文件引用，你都要加上这个。
一般格式是这样的：
``` cpp
#ifndef <标识>
#define <标识>
......
......
#endif <标识>
```

在理论上来说可以是自由命名的，但每个头文件的这个“标识”都应该是唯一的。标识的命名规则一般是头文件名全大写，前后加下划线，并把文件名中的“.”也变成下划线，如：stdio.h
``` cpp
#ifndef _STDIO_H_
#define _STDIO_H_
......
#endif
```

2.在#ifndef中定义变量出现的问题（一般不定义在#ifndef中）。
``` cpp
#ifndef AAA
#define AAA
...
int i;
...
#endif
```

里面有一个变量定义在vc中链接时就出现了i重复定义的错误，而在c中成功编译。
**原因**：
1. 当你第一个使用这个头的.cpp文件生成.obj的时候，int i 在里面定义了当另外一个使用这个的.cpp再次[单独]生成.obj的时候，int i 又被定义然后两个obj被另外一个.cpp也include 这个头的，连接在一起，就会出现重复定义.
2. 把源程序文件扩展名改成.c后，VC按照C语言的语法对源程序进行编译，而不是C++。在C语言中，若是遇到多个int i，则自动认为其中一个是定义，其他的是声明。
3. C语言和C++语言连接结果不同，可能（猜测）时在进行编译的时候，C++语言将全局变量默认为强符号，所以连接出错。C语言则依照是否初始化进行强弱的判断的。

**参考解决方法**：
1. 把源程序文件扩展名改成.c。
2. 推荐解决方案： .h中只声明 extern int i;
在.cpp中定义
``` cpp
#ifndef __X_H__
#define __X_H__
extern int i;
#endif //__X_H__ int i;
```
注意问题：变量一般不要定义在.h文件中。
