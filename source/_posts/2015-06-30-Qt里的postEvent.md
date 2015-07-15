title: Qt里的postEvent
date: 2015-06-30 20:32:29
categories:
- Qt
tags:
- postEvent
---
>【转】原创作品，允许转载。转载时请务必以超链接形式标明文章原始出处、作者信息和本声明，否则将追究法律责任。
>[http://blog.csdn.net/dreamtdp/article/details/7545620](http://blog.csdn.net/dreamtdp/article/details/7545620 "http://blog.csdn.net/dreamtdp/article/details/7545620")

呵呵，转载了这么多别人的关于Event方面的文章，我也来说说两三句吧

前几天一直被这个postEvent给困扰着，所以主要讲解postEvent的个人理解吧，随便稍微提一下其他的实现机制。

Qt中抛消息有：信号和槽、postEvent、sentEvent等机制，sentEvent只支持同步的。postEvent可以实现异步的，其机制是将消息发送到消息队列中，消息队列又会把这些消息都抛出(当然要实现该功能我们也可以用信号和槽机制，将connect函数的最后一个参数设置为Qt::QueuedConnection即可)。

言归正传，上段我们说到消息队列把消息抛出来，我们该如何去捕获该消息呢？我们只要实现父类中的event()或者customEvent()函数即可，在里面实现我们自己的处理，在此建议采用customEvent()。

以下是一个简单的实例：
``` cpp
#include <QWidget>
#include <QEvent>
 
const QEvent::Type CustomEvent_Login = (QEvent::Type)5001;//建议用5000以上唯一的标识
 
class PostEvent : public QWidget
{
Q_OBJECT
 
public:
PostEvent(QWidget *parent = 0);
~PostEvent();
 
private:
void customEvent(QEvent *e); //该函数是父类QWidget的虚函数
 
};
 
PostEvent::PostEvent(QWidget *parent)
{
QApplication::postEvent(this, new QEvent(CustomEvent_Login));
//该函数实现将自定义的消息发送到队列，且new QEvent(CustomEvent_Login))只能动态分配，原因请看Qt的帮助文档中的postEvent函数说明。
}
 
void PostEvent::customEvent(QEvent *e)
{
if (e->type() == CustomEvent_Login) //捕获消息
{
QMessageBox msgBox;
msgBox.setText("The document has been modified.");
msgBox.exec();
}
}
```

呵呵，就这样吧 本人一开始犯了一个很白痴的错误，即把customEvent函数当作用户可以自定义的函数，殊不知是父类中的虚函数，所以一直捕获不到消息。好了，以上只是一个简单的关于postEvent的一个应用，如果想了解更多的消息机制请阅读其他关于event的文章。
