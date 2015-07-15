title: 程序员修炼之道之Visual Studio的TODO用法
date: 2015-06-29 20:47:02
categories:
- 杂类
tags:
- TODO
- Visual Studio
---
>【转】原创作品，允许转载。转载时请务必以超链接形式标明文章原始出处、作者信息和本声明，否则将追究法律责任。
>[http://blog.sina.com.cn/s/blog_681fac2801014flm.html](http://blog.sina.com.cn/s/blog_681fac2801014flm.html "http://blog.sina.com.cn/s/blog_681fac2801014flm.html")

经常使用eclipse的TODO，用于标识出还未完成的的任务，如:`//TODO`

这时eclipse中就会在代码行右边打上一个蓝色标记，方便你下次看到还未完成的地方。（还有//FIXME 也可以）

Visual Studio也提供//TODO标记，不过不会在右边标记处明显标识，需要你选择view进行查看。方法如下：

1.首先在你还未完成的地方打上TODO标记，以下方式均可：
1. //TODO:还有未完成的代码
2. //todo:something to do.
3. //Todo something
以上方式Visual Studio都能识别

2.选择 view, Task List进行查看整个工程的todo。也可以使用快捷键Ctrl+W,T  如下：
![](http://i.imgur.com/4HGzqrm.jpg)

一定要选择comments才能看到
![](http://i.imgur.com/sXP29CD.jpg)
