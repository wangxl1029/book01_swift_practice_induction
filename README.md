《Swift实战入门》第二版，2015年出版。
最初的想法是原原本本的拷贝全书到这个笔记里，但这个做法实在效率太低。
毕竟我们看书的目的是：

- 掌握知识点，并应用于实践；
- 书中资料要做成wikipedia，用于查寻；
- 新版本SDK优于其旧版本的原则；
    * 毕竟成书于几年前，书中的SDK早已过时。
    * 毕竟我们用新版本做应用，所以重点在新版本的SDK如何可用。
    * 所以就不要纠结于旧版本的SDK是啥等等没用的东西。

所以，这个文档是我读书结合实践整理出来的个人笔记和实验代码，以方便工作和分享。

Swift Practice Induction
========================

编译和运行环境
------------
本篇Markdown所有笔者实验代码xcode环境如下。

<html>
<div style="background-color:lightgrey">
xcode &raquo; Building setting &raquo;
<ul>
<li> iOS Deployment Target &raquo; iOS 12.1
<li> Swift Language Version &raquo; Swift 4.2
</ul>
xcode 版本：10.1，如下图。
</div>
<a href="https://imgchr.com/i/FHtIgK"><img src="https://s2.ax1x.com/2019/01/06/FHtIgK.md.png" alt="FHtIgK.png" border="0" /></a>

</html>


备份用的[爱信息图](https://tu.aixinxi.net/index.php)床外链：<http://t1.aixinxi.net/o_1d0gtop5s1tk7edu1skptt11i89a.png-j.jpg>

版本说明
------

### v0.2.0-alpha.2

#### 发布内容

+ 8.4.2 表格控件简单示例

##### 编译说明

有一个编译警告，如下。
> 'UIAlertView' was deprecated in iOS 9.0: UIAlertView is deprecated. Use  UIAlertController with a preferredStyle of UIAlertControllerStyleAlert instead

### v0.2.0-alpha

因为是alpha版本，所以++发布在dev branch++上。

#### 发布内容

+ 8.6.2小节：**导航条**和**导航控制器**示例代码，完整版。请点击展示[图片][jpg04]。
+ tabbed app: 使用segue新增“第三”标签页。请点击展示[图片][jpg05]。

##### 编译说明

有一个编译警告，如下。

> L55 'UIWebView' was deprecated in iOS 12.0: No longer supported; please adopt WKWebView.


### v0.1.0-w.1

w.1表示Wizard dot 1版本。

#### 发布内容

+ 4个新工程，均由iOS app wizard生成。
	- Master/detailed view app: initial codes. 效果点击[竖屏图片][jpg02]，[横屏图片][jpg03]。
	- Page based view app: initial codes.
	- Tabbed app: initial codes.
	- Tabbed app2: 8.8.3 标签页代码实现
+ 1个继承上个版本(v0.1.0)的老工程。
	- Single view app: 新增image view。

##### 功能验证

验证的目标设备：iphone SE模拟器。

### v0.1.0

最初版本。

#### 发布内容

+ Only a single view app project.
	- label
	- button
	- text field
	- text view
	- segmented view
	- slider bar
	- switch

以上发布内容综合效果展示请点击[图片][jpg01]

##### 功能验证

验证的目标设备：iphone SE模拟器。

外链
----

爱信息图床：<https://tu.aixinxi.net/>

- \[jpg01\]: <http://t1.aixinxi.net/o_1d169rl7a14h81blo1q2u13i2dsaa.png-j.jpg>
- \[jpg02\]: <http://t1.aixinxi.net/o_1d16b8jj616qitap18q77c1725f.png-j.jpg>
- \[jpg03\]: <http://t1.aixinxi.net/o_1d16bhi5l49s1bf1h4q419185ba.png-j.jpg>
- \[jpg04\]: <http://t1.aixinxi.net/o_1d16c4m1n19op8kv14rkp8i8f6a.png-j.jpg>
- \[jpg05\]: <http://t1.aixinxi.net/o_1d16cnce4ik3ein1hse5f61n7aa.png-j.jpg>

[jpg01]: http://t1.aixinxi.net/o_1d169rl7a14h81blo1q2u13i2dsaa.png-j.jpg "“v0.1.0 综合效果演示”"
[jpg02]: http://t1.aixinxi.net/o_1d16b8jj616qitap18q77c1725f.png-j.jpg "master-detail view 竖屏展示"
[jpg03]: http://t1.aixinxi.net/o_1d16bhi5l49s1bf1h4q419185ba.png-j.jpg "master-detail view 横屏展示"
[jpg04]: http://t1.aixinxi.net/o_1d16c4m1n19op8kv14rkp8i8f6a.png-j.jpg "导航条和导航控制器展示"
[jpg05]: http://t1.aixinxi.net/o_1d16cnce4ik3ein1hse5f61n7aa.png-j.jpg "新增“第三”标签页"