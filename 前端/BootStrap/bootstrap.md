# BootStrap

## 1.介绍

**Bootstrap**是一组用于网站和网络应用程序开发的开源前端（所谓“前端”，指的是展现给最终用户的界面。与之对应的“后端”是在服务器上面运行的代码）框架，包括HTML、CSS及JavaScript的框架，提供字体排印、窗体、按钮、导航及其他各种组件及Javascript扩展，旨在使动态网页]和Web应用的开发更加容易。

源码下载网址：https://github.com/twbs/bootstrap/archive/v3.4.1.zip

## 2.使用

拷贝文件夹到项目目录。

## 3.布局容器和栅格网格系统

### 3.1.布局容器

1. container类用于固定宽度并支持响应式布局的容器。

   ```HTML
   <div class="container">
       ...
   </div>
   ```

2. container-fluid类用于100%宽度，占据全部视口的容器。

   ```HTML
   <div class="container-fluid">
       ...
   </div>
   ```

### 3.2.栅格网格系统

​	BootStrap提供了一套响应式、移动设备优先的流式栅格系统，随着屏幕的尺寸增加，系统会自动分为12列。栅格系统用于通过一系列的行（row）与列（column）的组合来创建页面布局，内容可以放入布局中。

#### 3.2.1.列组合

```HTML
<body>
    <div class="container-fluid">
        <div class="row">
            <div class="col-md-4" style="background-color: black;">4</div>
            <div class="col-md-4" style="background-color: red;">4</div>
        </div>
    </div>
</body>
```

```HTML
md中等  sm小屏  lg大屏
```

#### 3.2.2.列偏移

**col-md-offset-1** 向右偏移，总数不超过12。超过12自动换行。

```HTML
<body>
    <div class="container-fluid">
        <div class="row">
        <div class="col-md-4 col-sm-4 col-md-offset-1" style="background-color: black;">4</div>
        <div class="col-md-4 col-sm-4" style="background-color: red;">4</div>
    </div>
</div>
</body>
```

#### 3.2.3.列排序

​		列排序就是改变列的方向。就是改变左右浮动，并且设置浮动的距离。通过添加类名col-md-push-*和col-md-pull-。pull往前，push往后。

列偏移和列排序的区别是，列排序不会改变后继元素的布局，若偏移量后有元素，列排序会覆盖。

#### 3.2.4.列嵌套

​		row中的每一列再分。

```HTML
<body>
    <div class="container-fluid">
        <div class="row">
        <div class="col-md-4 col-sm-4 col-md-offset-1" style="background-color: black;">
        <div class="row">
            <div class="col-md-6" style="background-color: white;">t</div>
        </div>
        </div>
        
        <div class="col-md-4 col-sm-4" style="background-color: red;">4</div>
    </div>
</div>
</body>
```

## 4.常用样式

### 4.1.排版

#### 4.1.1.标题

使用类名h1获得h1的标题效果。

   ```HTML
   <h1>标题1<span class="small">副标题</span></h1>
   ```

#### 4.1.2.段落

class ="lead" 字体增大加粗

```HTML
<small>变小</small>
```

#### 4.1.3.强调

**class取值：**

text-muted        提示，使用浅灰色

text-primary       主要，使用蓝色

text-success        成功，使用浅绿色

text-info              通知信息，使用浅蓝色

text-warning       警告，使用黄色

text-danger          危险，使用褐色

#### 4.1.4.对齐效果

**calss取值：**

text-left

text-right

text-center

text-justify			两端对齐

#### 4.1.5.列表

##### 4.1.5.1.去点列表

class="list-unstyled"

##### 4.1.5.2.内联列表

class="list-inline"    把垂直列表换成水平列表，并且去掉编号。

##### 4.1.5.3.定义列表

在原有的基础上加入了一些样式，使用class="dl-horizontal"制作水平定义列表：当标题宽度超过160px时，将会显示三个点。

#### 4.1.6.代码

##### 4.1.6.1.单行内联代码

```HTML
<code>Syatem.out.println("----")</code>
```

##### 4.1.6.2.快捷键

```HTML
<p>使用<kbd>ctrl s</kbd>保存</p>
```

##### 4.1.6.3.多行块代码

class="pre-scroliable"   滚动条

```HTML
<pre>
int main(){
	printf("hello world");
	return 0;
}
</pre>
```

#### 4.1.7.表格

##### 4.1.7.1.表格样式

**class取值**

​		**基础样式**

​					**table：基础表格**

​         **附加样式**

​					**table-striped：斑马线表格**

​					**table-bordered：带边框的表格**

​					**table-hover：鼠标悬停高亮**

​					**tablb-condensed：表格内边距变小**

##### 4.1.7.2.tr，th，td样式

提供了五种不同的类名，控制五种不同的背景颜色。

**active**

**success**

**info**

**warning**

**danger**

### 4.2.表单

#### 4.2.1.表单控件

**class取值：**

1. **文本框：**

form-control        input-lg           input-sm

2. **下拉框**

form-control 

3. **文本域**

form-control 

4. **复选框checkbox**

   垂直显示：

   ```HTML
   <div class="checkbox">
      <label for=""><input type="checkbox" name="hobby" id="">唱歌</label> 
   </div>
   <div class="checkbox">   
        <label for=""><input type="checkbox" name="hobby" id="">跳舞</label> 
   </div>
   ```

   水平显示：

   ```HTML
   <label for="" class="checkbox-line"><input type="checkbox" name="hobby" id="">唱歌</label> 
   <label for="" class="checkbox-line"><input type="checkbox" name="hobby" id="">跳舞</label> 
   ```
   
5. **单选框radio**

​		垂直显示：

```HTML
<div class="radio">
    <label for=""><input type="radio" name="sex" id="">男</label> 
</div>
<div class="radio">   
    <label for=""><input type="radio" name="sex" id="">女</label> 
</div>
```

​		水平显示：

```HTML
<label for="" class="radio-line"><input type="radio" name="sex" id="">男</label> 
<label for="" class="radio-line"><input type="radio" name="sex" id="">女</label> 
```

6. 按钮

   基础样式：

```HTML
<button class="btu">按钮</button>
```

​      附加样式：

```HTML
<button class="btn btn-danger ">按钮</button>
<button class="btn btn-warning">按钮</button>
<button class="btn btn-info">按钮</button>
<button class="btn btn-default">按钮</button>
<button class="btn btn-primary">按钮</button>
<button class="btn btn-success">按钮</button>
<button class="btn btn-link">按钮</button>
```

把普通标签变成按钮

```HTML
<div class="btn btn-danger">11</div>
```

按钮大小：

**btn-lg         btn-sm           btn-xs**

按钮禁用：

disabled="disabled"           属性禁用

class取值为disabled            样式禁用

#### 4.2.2.表单布局

* 向<form>元素添加*role="form"*。

* 把标签和控件放在一个带有class.form-group的<div>中。这是获取最佳间距所必须的。
* 向所有的文本元素<input>、<texteara>和<select>添加*class=“form-control"*。

##### 4.2.2.1.水平表单

水平表单与其他表单不仅标记的数量上不同，而且表单的呈现形式也不同。如需创建一个水平布局的表单，请按下面的几个步骤进行：

- 向父 <form> 元素添加 class *.form-horizontal*。
- 把标签和控件放在一个带有 class *.form-group* 的 <div> 中。
- 向标签添加 class *.control-label*。

### 4.3.缩略图

大多数站点都需要在网格中布局图像、视频、文本等。Bootstrap 通过缩略图为此提供了一种简便的方式。使用 Bootstrap 创建缩略图的步骤如下：

- 在图像周围添加带有 class **.thumbnail** 的 <a> 标签。
- 这会添加四个像素的内边距（padding）和一个灰色的边框。
- 当鼠标悬停在图像上时，会动画显示出图像的轮廓。

### 4.4.面板

面板组件用于把 DOM 组件插入到一个盒子中。创建一个基本的面板，只需要向 <div> 元素添加 class **.panel** 和 class **.panel-default** 即可，如下面的实例所示：

```HTML
<div class="panel panel-default">
    <div class="panel-body">
        这是一个基本的面板
    </div>
</div>
```

