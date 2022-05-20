# HTML

## 1.简介

​		HTML(Hyper Text Markup Language)，是一种标记语言，不是编程语言，用来设计和描述网页。网页的内容由HTML标签完成，HTML元素指HTML中的各种标签。HTML文件的后缀名为 **.html  .htm**目前最新语言规范为HTML5（H5）。

## 2.基础语法

### 2.1.**标签**  

#### 2.1.1单标签

无属性 <标签名 />

有属性 <标签名 属性名=“属性值”>

#### 2.1.2.双标签

无属性 <标签名 > < / 标签名>

有属性 <标签名  属性名=“属性值”> </ 标签名>

### 2.2**整体结构**

```HTML
<!DOCTYPE html> 				 <!--HTML5 版本申明，文档第一行-->
<html>							<!-- 表示当前是一个网页 -->
<meta charset="utf8" />	    	 <!--字符编码标签-->
<title>页面标题<title/>
<head>	</head>  		    		<!-- 头部信息-->	
<body>	</body>  	     			<!-- 身体部分-->	
</html>  
```

## 3.标题和水平线

标签的多个属性之间用空格隔开

### 3.1.body标签

***bgcolor***     背景颜色       三种写法       1.颜色名  2.rgb  3.16进制

***text*** 		   字体颜色	   三种写法       1.颜色名  2.rgb  3.16进制

### 3.2.h标题标签

​	不建议在页面中写多个h1标签，h1标签可以被搜索引擎获取，可能会进入搜索引擎黑名单。

```HTML
<h1></h1>~<h6></h6> 	<!--从大到小-->
```

### 3.2.水平线标签

```HTML
<hr />
```

1. ***width***  宽度 		1.百分比	2.px
2. ***align***    对齐方式       left  right  center(default)
3. ***size***	粗细   

## 4.段落和换行

### 4.1.段落标签

```HTML
<p></p> 	<!--段落会自动换行-->
```

***align属性：	对齐方式***

1.  left  		居左对齐
2.  right 	   居右对齐
3.  center 	居中对齐
4.  justify	  两端对齐

### 4.2.换行标签

两种写法

```HTML
<br>
<br />
```

***p标签的换行间隙大br标签小***

## 5.列表

### 5.1.ul无序列表

```HTML
<ul>			<!---->
 <li></li>		
 <li></li>
</ul>
```

***type属性**：*

1. square  实心方块
2. circle     空心圆
3. disc       实心圆   （default）

### 5.2.ol有序列表

```HTML
<ol>
  <li></li>
  <li></li>
</ol>
```

***type属性**：*

1.  1	 数字符号		(default)
2.  a     小写字母
3.  A     大写字母
4.   i      小写罗马字母
5.   I      大写罗马字母

## 6.div和span

### 6.1.div标签 	(常用来布局)

​	div 标签 （**层**、块级元素、标签会自动换行、常用与布局）

```HTML
<div>
</div>
```

***align属性：	div中内容的对齐方式***

1.  left  		居左对齐
2.  right 	   居右对齐
3.  center 	居中对齐
4.  justify	  两端对齐

### 6.2.span标签

​	块、行内元素、标签不会自动换行

```HTML
<span>
</span>
```

## 7.格式化标签

### 7.1.font标签		

​		设置字体相关属性。

```HTML
<font>
</font>
```

***color属性：*** 	1.颜色名 			 2.rgb  		3.16进制

***size属性：***	字体大小     1~7 

***face 属性：***		字体风格      楷体

### 7.2.pre标签

​	定义预格式化的文本，保留文本中的空格和换行符。

```HTML
<pre>
</pre>
```

### 7.3.b标签	加粗

```HTML
<b></b>
<strong></strong>
```

### 7.4.i标签	斜体

```HTML
<i></i>
```

### 7.5.u标签      **下划线**

```HTML
<u></u>
```

### 7.6.del标签		中划线

```HTML
<del></del>
```

### 7.7.sub标签	  下标

```HTML
<sub></sub>
```

### 7.8.sup标签		上标

```HTML
<sup></sup>
```

## 8.a标签（超链接）

### 8.1.a标签	

​	定义超链接、从一个页面链接到另一个页面。行内元素。**路径**可以为***相对路径、绝对路径、网络路径***

```HTML
<a href="路径"></a>
```

***href属性：***必须属性、需要跳转地址

***target属性：***

1.		 _self      当前窗口打开 （default）
1.		_blank   新开空白窗口打开
1.		_parent
1.		_toper

### 8.2.锚点的实现

​	锚点，**指a标签跳到指定的标签位置，href属性=“#name or # id”。**如果要跳转到当前页面，那href的值可以设置为#。

**两种方法  a标签的href指向其他name和id**

​	1.利用a标签的name属性

​	2.利用其他标签的id属性

```HTML
<a href="#name"></a> 
<a href="#id"></a> 
```

## 9.图片

### 9.1.img标签

​		行内标签

```HTML
<img src="路径" />   
```

1. **必须属性**

​		***src***      被引入的图片的地址

2. **其他属性**

​		***title***        鼠标悬停时图片上显示的文字

​		***alt***          当图片加载失败时显示的文本

​		***width***     设置图片宽----等比变化

​        ***height***    设置图片的高度

​        ***border***    图片外加边框    1，2，3

​        ***align***       对齐方式，根据周围的文本，设置对齐

## 10.表格

### 10.1.表格标签

```HTML
<table>			<!--表示表格-->
    <tr>		<!--表示表格中的行（每一行可以包含一个或多个td和th）-->
    	 <th><th>
         <td></td>		<!--表示表格中的标准单元格-->
         <td></td>
         <td></td>
    </tr>
</table>
```

th	       表示表格中的表头单元格（字体加粗，居中显示）

### 10.2.table 标签属性

​		***border：***	表格的边框            1

 	   ***width：***           表格的宽度     像素或百分比（百分比参考上一级元素的宽度）

​		 ***height：***	  	  高度

​	 	***align：***              表格对齐方式  （left、right、center）

 **style="border-collapse:collapse:"             表格合并（css样式）**



### 10.3.tr 标签属性

​	   ***align：***             行内文本对齐方式（left、right、center）

​        ***valign：***            上下对齐（top）

​        ***bgcolor：***        背景颜色

### 10.4.合并单元格

> **纵向合并          rowspan="number"**
>
> **横向合并          colspan="number"**

## 11.所有标签都有的属性

**id属性------------标识元素唯一性**

**name属性------提交数据时的参数名**

**style属性-------设置元素行内样式**

**calss属性-------设置元素的样式名**

## 12.form表单

​		表单用于向服务器传输数据。form元素是块级元素，其前后产生折行。表单提交时，必须设置表单元素的name属性值。

```HTML
<form action=""  name=""  method=""  target="" >
    
</form>
```

***action           提交表单的地址***

***method        提交方式***

1. **get提交**        **（default）**
2. **post提交** 

***target           提交数据时打开窗口的方式***

1.  **_self    当前窗口**
2.  **_blank     新的空白窗口**

## 13.**get与post的请求的区别：（post请求需要服务器支持）**

1. **get请求时参数会跟在浏览器地址栏的后面，而post请求不会（post会将数据存放在请求体中）**
2. **get相对与post不安全**
3. **get请求传递的数据长度时有限的，而post请求基本没有限制（与服务器相关）**
4. **get请求比post请求快，大概快2倍**
5. **get请求有缓存（本地磁盘），而post无缓存**

## 14.input标签

​	用于搜集用户信息

```HTML
<input type=""> 
```

***type属性：元素类型***

0. text             文本框

1. password   密码框
2. radio           单选框（多个单选框需要通过name属性设置标记为一组）
3. checkbox    复选框   （通过name属性设置为一组）
4. file                文件域（post,上传文件的表单，则表单需要设置一个属性 enctype="multipart/form-data"）
5. hodden        隐藏域（提交隐藏的数据）
6. button          普通按钮
7. submit          提交按钮
8. reset             重置按钮
9. date              日期框
10. value             元素的值
11. readonly="readonly"         只读
12. maxlength="number"       最长写入长度
13. disabled="disabled "         禁用标签

**注意：**

​		**input标签没有name属性无法提交**

## 15.textarea标签

​			大量文本输入，定义可输入多行文本的控件。

```HTML
<textearea cols="20" rows=""></textearea>     
```

***cols：文本的可见宽度***

***rows：文本的可见行数***

## 16.label标签		聚焦

```HTML
<label for="id">  </label>
```

***for：*** **当for属性与元素的id属性一致时，点击label标签，会自动元素聚焦**

## 17.button标签

​	**好处：双标签，标签之间可以嵌套**

```HTML
<button type="">
    
</button>
```

***type：***

1. button          普通按钮
2. submit          提交按钮（default）     坑！！！！！
3.  reset             重置按钮

## 18.select和option标签			下拉框

```HTML
<select>
    <option></option>		<!--下拉框选项-->
    <option></option>
    <option></option>
</select>
```

**select标签属性：**

​			***multiple=“multiple”   设置下拉框可多选***

​			***size***           设置下拉框可见选项数

​			***disabled="disabled "         禁用标签***

**option标签属性：**

​			***selected="selected"          默认选中项***

​			***disabled="disabled "         禁用标签***

​			***value                                    提交给服务器的选项值（如未设置则提交option中的文本值）***

## 19.字符实体

 &copy;

```HTML
<       &lt;
>       &gt;
空格     &nbsp;
版权     &copy;
```

## 20.标签分类

###  **20.1.块级元素**

​		元素都从新的一行开始，并且其后的元素也是另气一行。元素的高度、宽度、行高以及顶部和底部边的距离都可设置。元素宽度在不设置的情况下，是它本身父容器的100%，除非设定一个宽度。

###  **20.2.行内元素**

​	和其他元素都在一行上。元素的高度、宽度以及顶部和底部的边距不可设置。元素的宽度就是它包含文字或图片的宽度，不可改变。

###  **20.3.行内块级元素**

​	和其它元素都在一行上。元素的高度、宽度、行高以及顶部和底部边距都可设置。
