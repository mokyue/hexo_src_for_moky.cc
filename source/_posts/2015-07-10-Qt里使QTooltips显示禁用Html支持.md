title: Qt里使QTooltips显示禁用Html支持
date: 2015-07-10 11:05:19
categories:
- PyQt
tags:
- QTooltips
- 禁用Html支持
---
>原创作品，允许转载。转载时请务必以超链接形式标明文章原始出处、作者信息和本声明，否则将追究法律责任。
``` python
info = "<p>text</p>"
labelInfo.setToolTip(info.replace("<", "&amp;lt;"))
```
<br>
还有个小窍门，默认的QTooltips如果显示宋体，而你想把它设置为微软雅黑的话，可以用下面的方法:
``` python
info = "<p>text</p>"
labelInfo.setToolTip("<pre style=\"font-family: \'Microsoft Yahei\';\">%s</pre>" % info.replace("<", "&amp;lt;"))
```
