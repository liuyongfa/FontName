# FontName
pint font name

打印字体名字
#

•添加.ttf或.otf后，获取字体的时候需要字体的名字

let fontName = UIFont(name: "FZHCJW--GB1-0", size: 42)

但是自定义字体文件的名字"方正黄草字体3.0版"并不一定就是字体的名字"FZHCJW--GB1-0"。

•这个demo可以打印出添加的字体的名字。

1.把字体文件添加到项目中，打开项目的Info窗口，在Custom Target Properties下创建一个新条目"Fonts provided by application"，类型为Array。然后将文件名添加到数组中。

![image](https://github.com/liuyongfa/FontName/blob/master/image_0.png)

2.选中字体文件，Target Membership里不勾选它，(command+R)运行一次，再勾选它，再运行一次。控制台就会打印出字体的名字。

![image](https://github.com/liuyongfa/FontName/blob/master/image_1.png)

•知道了字体的名字后，可以右击字体文件->显示简介->把字体名添加到注释里，或者直接把字体文件的名字"方正黄草字体3.0版.ttf"改为字体的名字"FZHCJW--GB1-0.ttf"，再添加到项目里。
