title: 解决 Python ConfigParser 的文件编码问题
date: 2015-07-03 21:32:25
categories:
- Python
tags:
- ConfigParser
- 文件编码
---
>【转】原创作品，允许转载。转载时请务必以超链接形式标明文章原始出处、作者信息和本声明，否则将追究法律责任。
>[http://laochake.iteye.com/blog/443704](http://laochake.iteye.com/blog/443704 "http://laochake.iteye.com/blog/443704")

配置文件编码为UTF-8，内容如下：
Cfg.ini代码:
``` ini
[section1]  
p1=中文字符串  
```

如果用`config.readfp(open('cfg.ini'))`，会出现乱码问题

因为open函数不能指定编码，所以改用`codecs.open`，指定编码为utf-8，在eclipse pydev下测试通过。

但因为UTF-8文本文件有两种格式：`带BOM`和`不带BOM`

而windows 记事本保存时只支持带BOM格式，为了兼容用记事本编辑过的文件能被正确读取，
最好把编码指定为`utf-8-sig`，完整的代码如下：
``` python
import codecs  
import ConfigParser  
 
cfgfile="cfg.ini"  
config = ConfigParser.ConfigParser()  
config.readfp(codecs.open(cfgfile, "r", "utf-8-sig"))  
p1 = config.get("section1","p1")  
print p1
```
