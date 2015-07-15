title: "Qt中如何进行DEBUG和使用cout,cin等"
date: 2015-06-28 21:00:49
categories:
- Qt
tags:
- debug
- cout
- cin
---
>【转】原创作品，允许转载。转载时请务必以超链接形式标明文章原始出处、作者信息和本声明，否则将追究法律责任。
>[http://socol.iteye.com/blog/719500](http://socol.iteye.com/blog/719500 "http://socol.iteye.com/blog/719500")

如果想输出DEBUG信息：
``` cpp
qDebug() << "Date:" << QDate::currentDate();  
qDebug() << "Types:" << QString("String") << QChar('x') << QRect(0, 10, 50, 40);  
qDebug() << "Custom coordinate type:" << coordinate;  
```
<br>
如果想使用，COUT/IN需要使用QTextStream的重载
``` cpp
#include <QApplication>  
#include <QTextStream>  
 
int main(int argc, char *argv[])  
{  
    QApplication app(argc, argv);  
    QTextStream out(stdout)；  
    out << "is QTextStream out " << endl;  
    return app.exec();  
}
```
