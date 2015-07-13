title: Python中判断是否为Windows7或更高版本
date: 2015-07-07 16:52:20
categories:
- Python
tags:
- 系统版本判断
---
>原创作品，允许转载。转载时请务必以超链接形式标明文章原始出处、作者信息和本声明，否则将追究法律责任。

```
def is_windows7_orlater():
    import platform
 
    if platform.system() != "Windows":
        return False
    version = platform.win32_ver()
    version_num = version[1]
    try:
        num = int(version_num[0]) * 10 + int(version_num[2])
    except ValueError:
        return False
 
    if num >= 61:
        return True
    return False
```