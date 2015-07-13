title: PyQt中利用winapi禁用系统默认阴影
date: 2015-07-08 16:48:48
categories:
- PyQt
tags:
- winapi
- 禁用阴影
---
>原创作品，允许转载。转载时请务必以超链接形式标明文章原始出处、作者信息和本声明，否则将追究法律责任。

```
def enableWindowShadow(hWnd, bool_enabled):
    import ctypes
    GCL_STYLE = (-26)
    CS_DROPSHADOW = 0x00020000
    hWnd = ctypes.c_long(self.winId())
    class_style = ctypes.windll.user32.GetClassLongA(hWnd, GCL_STYLE)
    if bool_enabled:
        class_style |= CS_DROPSHADOW
    else:
        class_style &= ~CS_DROPSHADOW
    ctypes.windll.user32.SetClassLongA(hWnd, GCL_STYLE, class_style)
```
