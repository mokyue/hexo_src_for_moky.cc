title: 自定义QScrollBar样式
date: 2015-05-11 12:36:25
categories:
- Qt
tags:
- PyQt
- QSS
- QScrollBar
---
>原创作品，允许转载。转载时请务必以超链接形式标明文章原始出处、作者信息和本声明，否则将追究法律责任。

QScrollBar是Qt日常开发里使用得比较频繁的一个控件，默认的系统样式已经无法满足开发需求，所以我们就需要定义QSS样式自定义QScrollBar的样式了。QScrollBar主要由handle、add-line、sub-line、add-page、sub-page、up-arrow和down-arrow几部分组成，以下为常用的QScrollBar样式设置。

``` css
QScrollBar
{
    background: transparent;
    width: 8px;
}
QScrollBar::handle {
    background-color: #6c7bad;
    border-radius: 4px;
}
QScrollBar::handle:hover {
    background-color: #6a7fc5;
}
QScrollBar::handle:pressed {
    background-color: #5b75cb;
}
QScrollBar::add-line, QScrollBar::sub-line {
    background: transparent;
    height: 0px;
    width: 0px;
}
QScrollBar::add-page, QScrollBar::sub-page {
    background: transparent;
}
QScrollBar::up-arrow, QScrollBar::down-arrow {
    background: transparent;
    height: 0px;
    width: 0px;
}
```

运行结果：
![QScrollBar-qss.png](QScrollBar-qss.png)

<br>
还有一种是半透明效果的:
``` css
QScrollBar:vertical {
    background: rgba(0,0,0,100);
    width: 10px;
}
QScrollBar::handle:vertical {
    background: rgba(255,255,255,180);
    min-height: 70px;
	border-radius: 5px;
}
QScrollBar::handle:vertical:hover {
    background: rgba(255,255,255,255);
}
QScrollBar::handle:vertical:pressed {
    background: rgba(255,255,255,200);
}
QScrollBar::add-line:vertical {
    background: none;
}

QScrollBar::sub-line:vertical {
    background: none;
}

QScrollBar::add-page:vertical,
QScrollBar::sub-page:vertical {
    background: none;
}
```

运行结果：
![QScrollBar-qss2.png](QScrollBar-qss2.png)
