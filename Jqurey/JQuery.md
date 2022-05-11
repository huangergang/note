# JQuery

## 1.JQuery介绍

jQuery是一套跨浏览器的JavaScript函式库，用于简化HTML与JavaScript之间的操作。约翰·雷西格（John Resig）在2006年1月的BarCamp NYC上释出了第一个版本。目前由Dave Methvin领导的团队进行开发。全球前10,000个访问最高的网站中，有65%使用了jQuery，是曾经最受欢迎的JavaScript函式库。2

## 2.JQuery对象

### 2.1.引入JQuery。

```HTML
<script src="js/jquery-3.6.0.js"></script>
```

### 2.2.Dom对象与Jquery包装集对象

   原始的Dom对象只有Dom对象接口提供的方法和属性，通过js代码获取的对象都是dom对象；而通过JQuery获取的对象是JQuery包装集对象，简称JQuery对象，只有JQuery对象才能使用JQuery提供的方法。

### 2.3.Dom对象转换为Jquery对象

```JS
var divDom = document.getElementById("mydiv");
mydiv = $(divDom);
```

### 2.4.Jquery对象转换为Dom对象

```JS
var myDiv = $("#mydiv");
var divDom = myDiv[0];
```

## 3.JQuery选择器

### 3.1.基础选择器

|      |      |      |
| ---- | ---- | ---- |
|      |      |      |
|      |      |      |
|      |      |      |
|      |      |      |
|      |      |      |

