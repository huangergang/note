# JQuery

## 1. JQuery介绍

​		JQuery是一套跨浏览器的JavaScript函式库，用于简化HTML与JavaScript之间的操作。约翰·雷西格（John Resig）在2006年1月的BarCamp NYC上释出了第一个版本。目前由Dave Methvin领导的团队进行开发。全球前10,000个访问最高的网站中，有65%使用了jQuery，是曾经最受欢迎的JavaScript函式库。

## 2. JQuery对象

### 2.1. 引入JQuery

本地地址

```HTML
<script src="js/jquery-3.6.0.js"></script>
```

网络地址

```html
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
```

### 2.2. Dom对象与Jquery包装集对象

   		原始的Dom对象只有Dom对象接口提供的方法和属性，通过js代码获取的对象都是dom对象；而通过JQuery获取的对象是JQuery包装集对象，简称JQuery对象，只有JQuery对象才能使用JQuery提供的方法。

### 2.3. Dom对象转换为Jquery对象

```JS
var divDom = document.getElementById("mydiv");
mydiv = $(divDom);
```

### 2.4. Jquery对象转换为Dom对象

```JS
var myDiv = $("#mydiv");
var divDom = myDiv[0];
```

## 3. JQuery选择器

### 3.1. 基础选择器

| 选择器         | 名称          | 举例                                               |
| -------------- | ------------- | -------------------------------------------------- |
| id选择器       | #id           | $("#mydiv")                                        |
| 元素名称选择器 | element       | $("div")选择所有的div元素                          |
| 类选择器       | .class        | $(".blue")选择所有class=blue的元素                 |
| 选择所有元素   | *             | $("*")选择页面所有元素                             |
| 组合选择器     | one,two,three | $("#mydiv,.blue,span")同时选中多个选择器匹配的元素 |

### 3.2. 层次选择器

| 选择器               | 格式             |
| -------------------- | ---------------- |
| 后代选择器(所有子代) | $("#mydiv  p")   |
| 子代选择器(第一代)   | $("#mydiv > p")  |
| 相邻选择器           | $("#mydiv + p")  |
| 同辈选择器           | $("#mydiv ~  p") |

### 3.3. 表单选择器

| Forms          | 名称      | 举例                                                         |
| -------------- | --------- | ------------------------------------------------------------ |
| 表单选择器     | :input    | 查找所有的input元素：$(":input")       注意：只会匹配所有的input、testarea、select和button元素 |
| 文本框选择器   | :text     | 查找所有的文本框：$(":text")                                 |
| 密码框选择器   | :password | 查找所有的密码框：$(":password")                             |
| 单选按钮选择器 | :radio    | 查找所有单选按钮：$(":radio")                                |
| 复选框选择器   | :checkbox | 查找所有法复选框：$("checkbox")                              |
| 提交按钮选择器 | :submit   | 查找所有提交按钮：$(":submit")                               |
| 图像域选择器   | :image    | 查找所有图像域：$(":image")                                  |
| 重置按钮选择器 | :reset    | 查找所有重置按钮：$("reset")                                 |
| 按钮选择器     | :button   | 查找所有按钮：$(":button")                                   |
| 文本域选择器   | :file     | 查找所有文本域：$(":file")                                   |

## 4. JQuery Dom操作

### 4.1. 操作元素的属性

#### 4.1.1. 获取属性

| 方法           | 说明                                                         | 举例                            |
| -------------- | ------------------------------------------------------------ | ------------------------------- |
| attr(属性名称) | 获取指定的属性值，操作checkbox时，<br>选中返回checked，没有选中返回undefined。 | attr("checked")<br>attr("name") |
| prop(属性名称) | 获取具有true和false两个属性的属性值                          | prop("checked")                 |

#### 4.1.2. 设置元素属性

attr("属性名","属性值");

prop("属性名","属性值");

#### 4.1.3. 移除属性

removeAttr("属性名");

### 4.2. 操作元素的样式

| 方法                 | 说明                            |
| -------------------- | ------------------------------- |
| attr("class")        | 获取class属性的值，即样式的名称 |
| attr("class","样式") | 修改class属性的值，修改样式     |
| attrClass("样式名")  | 添加样式的名称                  |
| css()                | 添加具体的样式                  |
| removeClass(class)   | 移除样式的名称                  |

### 4.3. 操作元素的内容

| 方法              | 说明                           |
| ----------------- | ------------------------------ |
| html()            | 获取元素的html的内容           |
| html("html,内容") | 设定元素的html内容             |
| text()            | 获取元素的文本内容，不包含html |
| text("text 内容") | 设置元素的文本内容，不包含html |
| val()             | 获取元素的value值              |
| val("值")         | 设定元素的value值              |

### 4.4. 创建元素

把元素变成JQuery包装集对象。

```JS
var p = "<p>this is p </p>";
$(p);
```

### 4.5. 添加元素

| 方法                           | 说明                                                         |
| ------------------------------ | ------------------------------------------------------------ |
| prepend(content)               | 在被选元素内部的开头插入元素或内容，被追加的content的参数，可以是字符，HTML元素标记 |
| $(content).prependTo(selector) | 把content元素或内容加入selector元素的开头                    |
| append(content)                | 在被选元素内部的结尾插入元素或内容，被追加的content参数，可以是字符、HTML元素标记 |
| $(content).appendTo(selector)  | 把content元素或内容插入selector元素内，默认是在尾部          |
| before()                       | 在元素前插入 指定的元素或内容：$(selector).before(content)   |
| after()                        | 在元素后插入指定的元素或内容：$(selector).after(content)     |

### 4.6. 删除元素

remove()

连同标签一起删除

empty()

只会删除标签内容

### 4.7. 遍历元素

each()

## 5. JQuery事件

### 5.1. ready加载事件

预加载事件

```JS
$(document).ready(function(){
    ...
});
```

### 5.2. bind()绑定事件

为被选元素添加一个或多个事件处理程序，并规定事件发生时运行的函数。

**1. 单个事件绑定：**

**bind绑定**

```JS
$("元素").bind("事件类型",function(){
    ...
});
```

**直接绑定**

```JS
$("元素").事件名(function(){
   ... 
});
```

**2. 多个事件绑定：**

**bind绑定**

​	1. 同时为多个事件绑定同一函数

```JS
指定元素.bind("事件类型1 事件类型1 ... ",function(){
    
})
```

 	2. 为元素绑定多个事件，并设置对应的函数

```JS
指定元素.bind("事件类型",function(){
    
})
```

 	3. 为元素绑定多个事件，并设置对应的函数

```JS
指定元素.bind({
    "事件类型":function(){},
    "事件类型":function(){},
    "事件类型":function(){}...
})
```

**直接绑定**

```JS
指定元素.事件名(function(){

}).事件名(function(){

});
```

## 6. JQuery  Ajax

### 6.1.$. ajax

 	jquery调用ajax方法

​			格式：$.ajax

​					参数：

​							type：请求方式get／post

​							url：请求url

​							async：是否异步，默认是true表示异步

​							data：发送到服务器返回服务器的数据

​							dataType：预期服务器返回的 数据类型

​							contentType：设置请求头

​							success：请求成功时调用此函数

​							error：请求失败时调用此函数

```JS
$.ajax({
    type:"get",
    url:"",
    async:true,
})
```

### 6.2. $.get

```JS
$.get()
```

### 6.3. $.post

```JS
$.post()
```

### 6.4. $getJSON

**请求返回的格式必须是JSON格式**

```JS
$.getJSON()
```

