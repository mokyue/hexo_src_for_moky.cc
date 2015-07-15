title: 拦截Qt关闭窗口的CloseEvent
date: 2015-06-26 21:11:55
categories:
- Qt
tags:
- CloseEvent
- 关闭窗口
---
>【转】原创作品，允许转载。转载时请务必以超链接形式标明文章原始出处、作者信息和本声明，否则将追究法律责任。
>[http://blog.csdn.net/vah101/article/details/6133728](http://blog.csdn.net/vah101/article/details/6133728 "http://blog.csdn.net/vah101/article/details/6133728")

QDialog类下有一个虚函数
`void QDialog::closeEvent (  QCloseEvent   *  e   )  [virtual protected]`

通过实现closeEvent函数，就可以以对关闭窗口消息进行拦截，比如程序还没有完成工作时，可以弹出警告窗口，即使用户确认退出操作

在头文件中，需要加入#include <QCloseEvent>：
``` cpp
#ifndef TEST_H
#define TEST_H
 
#include <QDialog>
#include <QCloseEvent>
 
class ClientTest : public QDialog
{
    Q_OBJECT
 
public:
    ClientTest();
    void closeEvent(QCloseEvent *event);
//后边的具体实现省略
//...
};
#endif
```
<br>
在cpp文件中，对closeEvent函数进行实现：
``` cpp
void ClientTest::closeEvent(QCloseEvent *event)
{
    QMessageBox::StandardButton button;
    button = QMessageBox::question(this, tr("退出程序"),
        QString(tr("警告：程序有一个任务正在运行中，是否结束操作退出?")),
        QMessageBox::Yes | QMessageBox::No);
 
    if (button == QMessageBox::No) {
        event->ignore();  //忽略退出信号，程序继续运行
    }
    else if (button == QMessageBox::Yes) {
        event->accept();  //接受退出信号，程序退出
    }
}
```
