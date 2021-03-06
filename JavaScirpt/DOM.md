# DOM对象

**文档对象模型**（英语：**Document Object Model**，缩写**DOM**），是W3C组织推荐的处理可扩展置标语言的标准编程接口。

每个载入浏览器的HTML都会成为Document对象。Document对象使我们可以从脚本中对HTML页面中的所有元素进行访问。Docment对象是window对象的一部分，可以通过window.document属性对其进行访问。

## 1.节点

​	加载HTML页面的时候，web浏览器生成一个树型结构，用来表示页面内部结构。DOM将这种结构理解为有节点组成的一个结点树。

**节点分类：**

| 节点类型 | HTML             | 例如               |
| :------- | :--------------- | :----------------- |
| 文档节点 | 文档本身         | 整个文档           |
| 元素节点 | 所有HTML元素     | <a>,<div>,<p>      |
| 属性节点 | HTML元素内的属性 | id,href,name,class |
| 文本节点 | 元素内的文本     | hello              |
| 注释节点 | HTML中的注释     | <!--   -->         |

## 2.获取节点

| 方法                    | 描述                                     |
| ----------------------- | ---------------------------------------- |
| getElementById()        | 根据id获取对象，如果id重复，以第一个为准 |
| getElementByTagName()   | 根据标签名获取dom对象数组                |
| getElemetnByClassName() | 根据class属性获取dom对象数组             |
| getElementByName()      | 根据name属性获取dom对象数组              |

## 3.创建节点和插入

### 3.1.创建节点

| 方法             | 描述                                                       |
| ---------------- | ---------------------------------------------------------- |
| createElement()  | 创建一个新节点，需要传入节点的标签名称，返回创建的元素对象 |
| createTextNode() | 创建一个文本节点，可以传入文本内容                         |
| innerHTML        | 直接添加到指定位置                                         |

### 3.2.插入节点

| 方法           | 描述                                       |
| -------------- | ------------------------------------------ |
| write()        | 将任意的字符插入到文档中                   |
| appendChild()  | 向元素中添加新的子节点，作为最后一个子节点 |
| insertBefore() | 向指定的已有的节点之前插入新的节点         |

第一种

```js
// 获取html容器
var div = document.getElementById("cont");
// 创建p标签
var p = document.createElement("p");
// 创建文本
var text = document.createTextNode("this is text");
// 将文本添加到p标签内
p.appendChild(txt);
// 将p标签设置到div中
div.appendChild(p);
```

第二种

```JS
// 获取html容器
var div = document.getElementById("cont");
// 创建p标签
var p = document.createElementById("p");
// 将文本添加到p标签内
p.innerHTML = "this is text";
// 将p标签设置到div中
div.appendChild(p);
```

第三种

```JS
// 获取html容器
var div = document.getElementById("cont");

var p = "<p>this is text</p>";

div.innerHTML += p;
```

**添加图片：**

第一种

```JS
// 获取html容器
var div = document.getElementById("cont");

var img = document.createElement("img");
img.src="url";
img.width=100;
img.height=100;

div.appendChild(img);
```

第二种

```JS
// 获取html容器
var div = document.getElementById("cont");

var img = document.createElement("img");

img.setAttribute("src","img/img1.jpg");

div.appendChild(img);
```

第三种

```JS
// 获取html容器
var div = document.getElementById("cont");

var img = "<img src="url" />";
div.innerHTML += img;
```

直接插入文本到HTML

```JS
document.write("");
```

### 3.3.间接查找节点

| 方法           | 描述                       |
| -------------- | -------------------------- |
| childNodes     | 返回元素的一个子节点的数组 |
| firstChild     | 返回元素的第一个子节点     |
| lastChild      | 返回元素的最后一个子节点   |
| nextSibing     | 返回元素的下一个兄弟节点   |
| parentNode     | 返回元素的符节点           |
| previousSibing | 返回元素的上一个兄弟节点   |

### 3.4.删除节点

removeChild()  从元素中山删除子节点。
