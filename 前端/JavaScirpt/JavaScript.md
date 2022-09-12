# 第一部分 JavaScript 语法

## 1. 介绍

​		**JavaScript**（通常缩写为**JS**）是一种高级的、解释型的编程语言。JavaScript是一门基于原型，是一门多范式的语言，它支持面向对象程式設計，指令式编程，以及函数式编程。它提供语法来操控文本、数组、日期以及正则表达式等，不支持**I/O**，比如网络、存储和图形等，但这些都可以由它的宿主环境提供支持。它已经由**ECMA**（欧洲电脑制造商协会）通过**ECMAScript**实现语言的标准化。它被世界上的绝大多数网站所使用，也被世界主流浏览器（**Chrome、IE、FireFox、Safari、Opera**）支持。

## 2. 基础用法

1. **行内js：js代码写在html标签上**

   ```HTML
   <!--点击事件的绑定-->
   <button type="button" onclick="alert("hello")">
   </button>		
   ```

2. **内部js：写在html页面中的script中**

   ```HTML
   <script type="text/javascript">
       alert("hello");
   </script>
   ```

3. **外部js：创建js文件，通过script标签引入js文件**

    ```html
    <!--在有src属性的script标签中写js代码不会执行-->
    <script src="路径" type="text/javascript" charset="utf-8">
        alert("hello");<!--无效-->
    </script>		
    ```


***onclick 点击元素时触发***

***alert("内容") 弹出层***

***console.log("内容") ,打印内容在控制台***

## 3. 语句和注释

​		**js代码以行为单位， 从上往下一行一行执行。语句以分号结尾，一个分号就表示语句结束（弱类型语言，对分号不严格）。**

**注释：**

```JS
// 		单行注释

/* 多行注释 */
```

## 4. 变量

​		 **js是弱类型语言，在声明变量时不需要指定数据类型，都用*var*关键字声明**。

变量的声明：

1. **声明并赋值**

```JS
var a = 1;
```

2. **先声明再赋值**

```JS
var a;
a = 1;
```



**注意：**

1. **当变量只声明未赋值时返回*undefined***（未定义）

   ```JS
   var a;
   ```

2. **如果未声明就使用变量*js*会报错**

   ```JS
   console.log(b);  // b未声明
   ```

3. **可以再同一条var声明多个变量**

   ```JS
   var a,b,c;
   ```

4. **用var可以覆盖先前声明的值**

5. **变量提升：变量可以先使用后声明**

   ```JS
   console.log(name);  // 输出undefined
   var name = "frank";
   ```

**注：只有用*var*声明的变量才能可以变量提升**



## 5. 数据类型

### 5.1. 数值

**（Number）**：整数和小数

1. **js中所有数字（整型和浮点型）都是以64位浮点类型存储的。所以在js中1和1.0是相等的，1+1.0值为2。**

2. **浮点类型最高精度为17位，浮点类型做运算不准确，不建议做判断。**

3. **自动变为整型。**

```JS
var a = 1;
var b = 1.234;
```

### 5.2. 字符串

**（String）**：字符串

```JS
var name = "frank";
```

### 5.3. 布尔值

**（Boolean）**：true 和 false

```JS
var is = true;
```

### 5.4. undefined

​	表示未定义或不存在



**出现undefined的情况：**

1. **当声明了变量但未赋值时，变量值未undefined。**
2. **调用函数时，函数有形参，但未提供实参，则参数为undefined。**
3. **函数没有返回值时，默认返回为undefined。**

### 5.5. null

表示空值

***函数：typeof返回变量数据类型***

```JS
var a = false;
var str = typeof a;
```

```JS
var str  = typeof null; // str为object 
```



## 6. 类型转换

### 6.1. 自动类型转换



### 6.2. 函数转换

#### 6.2.1. parseInt()

​		**装换之前，首先会分析该字符串， 判断位置为0处的字符，判断它是否是个有效数字，如果不是，则直接返回NaN，不再继续， 如果是则继续，直到找到非字符。**

```JS
parseInt("1244blue");  // 1244
parseInt("22.5");    // 22
parseInt("blue");    // NaN
```

#### 6.2.2. parseFloat()

​		**与parseInt不同的是，parseFloat可以识别第一个小数点。**

```JS
parseFloat("1244.3blue"); //  1244.3
parseFloat("124.234");    //  124.234
parseFloat("blue");      //   NaN
parseFloat("12.123.13");   // 12.123
```

### 6.3. 显示转换

#### 6.3.1. toString()

**toString()函数可以将数字转换为字符串**。

```JS
var a = 123;
var str = a.toString()  // "123"
```

#### 6.3.2. toFixed()

**函数将根据小数点后指定位数将数字转换为字符串。**

```js
var stu = 123.76;
console.log(stu.toFixed(6));  // 如果未指定这四舍五入保留整数
//结果 123.760000
```



#### 6.3.3.构造方法

​		**JS 为Number、Boolean、String对象提供了构造方法，用于强制转换其他类型的数据。此时操作的是整个数据，而不是部分。**

```JS
Number("3.4.5")    // 返回NaN
```

**String()将任意值转换成字符串，包括null和undefinded**

**最简单转字符串直接在任意数据后+ “ ”   即可**

```js
var s = String(undefined);
console.log(typeof s +"  "+ s); // string  undefined

```

**Boolean()** 只要（）里是大于0的数（整数和小数）Boolean值为true，0为false。字符串只要是非空字符串，值为true，反之为false。

```js
var s = Boolean("false");
console.log(typeof s +"  "+ s); // boolean  true

var s = Boolean(1.4);
console.log(typeof s +"  "+ s); // boolean  true
```

**Number()** 只要（）里字符串出现字符值就为NaN，true为1，false为0。

```js
var s = Number("123.124Hello");
console.log(typeof s + " : " + s); // number : NaN


var s = Number(true);
console.log(typeof s + " : " + s) // number : 1


var s = Number(false);
console.log(typeof s + " : " + s) // number : 0
```



## 7. 运算符

### 7.1. 算数运算符

**+     -     *    /     %    ++    --**



+运算符在数值类型之间运算，如果有一方为小数则结果值转换为小数，如果有一方为字符串，则结果值转换为字符串。



### 7.2. 赋值和扩展运算符

**=   +=    -=     *=     /=    %=**

### 7.3. 比较运算符

**==** 等于    比较值是否相等

**===** 全等（值和类型）

### 7.4. 逻辑运算符

**&&     ||     !**

### 7.5. 三目运算符

**?:**

```js
var a = 1;
var b = 2;

a > b ? true : console.log("nb");
```



## 8. 控制语句

### 8.1. if

```JS
if(){
    ...
}
```

```JS
if(){
    ...
}else {
    ...
}
```

```JS
if(){
    ...
}else if(){
    ...
}else{
    ...
}
```

### 8.2. switch

```JS
switch(表达式全等判断){
    case 值1:
        ...
        break;
    case 值2:
        ...
        break;
    default:
        ...
        break;
}

//##############################################

var result = 90;

switch (result / 10) {
    case 9:
        console.log("good good good!");
        break;
    case 8:
        console.log("good good!");
        break;
    case 7:
        console.log("good!");
        break;
}
```

### 8.3. while和do  while

```JS
while(表达式){
    ...
}
    
//***************************************
    
do {
    ...
}while(表达式);
```

### 8.4. for

```JS
for(var a = 1;a <= 5; a++){
    ...
}

//***************************************
    
for(var i in arr){
        ...
}
```



## 9. 数组

### 9.1. 数组定义

```JS
var arr = [1,2,3];		// 隐式创建

var arr = new Array(1,2,3);			// 直接实例化

var arr = new Array(size);		//  创建数组并指定长度
```



### 9.2. 数组操作

**数组的长度可以通过length属性获取，长度可以任意修改。**

```JS
var arr = [1,2];
arr.length = 4;
```

**通过下标索引获取数组值，索引可以越界。**

```JS
var arr = [1,2];
console.log(arr[3]);  // 打印undefinded
```

**下标任意。可以是任意字符，如果为非真正数，称之为属性。**

```JS
var arr = new Array(2);
arr["name"] = "frank";
console.log(arr["name"]);	// 打印frank
```

### 9.3. 数组遍历

```JS
var arr = [1,2,3,4];
for(var i =0; i<arr.length;i++){
    console.log(arr[i]);
}
```

```JS
var arr = [1,2,3,4];
for(var index in arr){
    console.log(arr[index]);
}
```

```JS
var arr = [1, 2, 3, 4];
arr.forEach(function (element, index) {
    console.log(index,element);
})
```

### 9.4. 数组方法

**push()			     	添加元素到最后**

**unshift() 	 	       添加元素到最前**

**pop()			    		删除最后一项**

**shift()			  	      删除第一项**

**reverse()		  		数组翻转**

**join()				 		数组转成字符串**

**indexof()		  		数组元素索引**

**slice()						截取数组**

**splice()			  		剪切数组，原数组变化**

**concat()					数组合并**



## **10. 函数**

### 10.1. 函数定义

**普通定义，具有函数名提升的效果。**

```JS
// 函数声明语句，可以先调用后声明
function funName([参数列表]){
    ...
}
```

**匿名函数**

```JS
// 函数表达式，将一个匿名函数赋值给一个变量
var fun = function([参数列表]){
    ...
}
```

**构造函数**

```JS
var fun = new Function("a","b","c","return(a+b+c)")
```

**注意：**

**js中函数无重载，若函数名相同，会覆盖。**



### 10.2. 函数参数

1. 实参可以省略，那对应的形参为undefined。

   ```JS
   function fun1(str){
       console.log(str);
   }
   fun1();    // 打印undefinded
   ```

2. 若函数形参同名：在使用时以最后一个为准。

   ```JS
   function fun2(a,a,a){
       console.log(a,a,a);
   }
   fun2(1,2,3);    // 打印3，3，3
   ```

3. 可以给参数默认值。

   ```JS
   function fun1(a){
       a = a || 1;
       console.log(a);
   }
   fun1();      // 设置a的默认值为1
   ```

4. 参数为值传递，传递副本；用对象实现引用传递。

   ```JS
   var obj = {
       name:"frank",
   }
   function fun1(o){
       o.name = "turing";
   }
   fun1(obj);
   console.log(obj);
   ```

### 10.3. 函数调用

**普通调用函数**。

```JS
function fun1(){
	...
}
fun1();
```

**函数调用模式，有返回值时。**

```JS
function fun(){
    ...
    return 2;
}
var n = fun();
```

**对象调用模式。**

```JS
var obj = {
    test:function fun(){
    ...
	}
}
obj.test();
```

***return可以返回值也可以结束函数。***



### 10.4. 函数作用域

**在js中只有函数有作用域。**

**函数内没有用var修饰的变量是全局变量。**

```JS
var a  = 100;
function fun(){
    a = 10;
}
fun();			// a的值改为10;
```



## 11. 内置对象

### 11.1. String

**charAt(idx)				返回指定位置的字符**

**indexof(chr)				返回指定字串的位置，从左到右，找不到 返回-1**

**substr(m,n)				返回从m位置开始的n个字符**

**substring(m,n)			返回从m位置开始的n个字符，n可以省略**

**toLowerCase()			大写转换**

**toUpperCase()			小写转换**

### 11.2. Math

### 11.3. Date



## 12. 对象

​	**js对象为json对象**

### 12.1. 创建对象

1. 字面量创建

   ```JS
   var student = {};
   student.name = "frank";
   student.age = 12;
   ```

2. 创建并赋值

   ```JS
   var student = {
       name : "frank",
       age : 12
   }
   ```

***对象中的键都是字符串，值可以是六种数据类型。***

3. new obj

   ```JS
   var student = new Object();
   ```

4. Object.create(模板对象)

   ```JS
   var stu = new Object.create(student);
   ```

### 12.2. 对象的序列化和反序列化

#### 12.2.1. JSON.stringify()

序列化对象，指将对象转换为字符串。

```JS
var student={
    ...
}
var str = JSON.stringify(student);
```

#### 12.2.2. JSON.parse()

反序列化，指将字符串转化为对象。

```JS
var stu = JSON.parse(str);
```

### 12.3. this

**谁调用谁就是this。**





# 第二部分 事件

​		**JS 事件（event）是当用户与网页进行交互时发生的事情，例如单机某个链接或按钮、在文本框中输入文本、按下键盘上的某个按键、移动鼠标等等。当事件发生时，您可以使用 JavaScript 中的事件处理程序（也可称为事件监听器）来检测并执行某些特定的程序。**

## 1. 事件中的名词

**事件源**：谁触发了事件

**事件名**：触发了什么事件

**事件监听**：谁管理这个事件

**事件处理**：发生了该怎么办

```HTML
<body>
    <button type="button">点击</button>

</body>
<script type="text/javascript">
    var n = 1;

    var t = document.querySelector("button");
    console.log(t);
    t.onclick = function () {
        console.log("点击了" + (n++) + "次");
    };
    // t.addEventListener("click",test);

</script>
```

## 2. 事件类型

​		JavaScript可以处理的事件类型为：**鼠标事件、键盘事件、HTML事件。**

## 3. 常用事件

*   onload

    当页面或图像加载完后立即触发。

*   onblur

    元素失去焦点 

*   onfocus

    元素获取焦点

*   onclick

    鼠标点击某个对象

*   onchange

    用户改变域的内容

*   onmouseover

    鼠标移动到某个元素上

*   onmouseout

    鼠标从某个元素上离开

*   onkeyup

    键盘某个键被松开

*   onkeydown

    键盘某个键被按下

## 4. 事件流和事件模型

事件流：事件在节点之间按特定顺序传播。

事件顺序有两种类型：事件捕获和事件冒泡。

### 4.1. 事件冒泡

IE的事件流叫做事件冒泡，即事件开始时由最具体的元素接受，然后逐级向上传播到不具体的节点（document）。

```HTML
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<title>second</title>
	</head>
	<body>
			<button type="button" onclick="test()">点击</button>
	</body>
</html>

```

<button>事件的传播顺序，从小到大。

<button >  >>  <body>   >>  <html>  >>   document

### 4.2. 事件捕获

事件开始时，有document接受，逐级向下传播到具体标签。

```HTML
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <title>second</title>
    </head>
    <body>
        <button type="button" onclick="test()">点击</button>
    </body>
</html>
```

<button>事件的传播顺序，从大到小。

## 5. 事件处理程序

​		响应事件的函数叫事件处理程序。事件处理程序以“on”开头。

### 5.1. HTML事件处理程序

​	某个元素支持的每种事件，都可以用一个与事件相应事件同名的HTML属性来指定，这个属性可以执行JS代码。

```HTML
<body>
    <button type="button" onclick="test()">点击</button>
</body>
```

### 5.2. DOM0级事件处理程序

​	通过JS指定事件处理程序的传统方式，就是将一个函数赋值给一个事件处理属性。**只能为同一个元素的同一个事件设定一个事件程序。**

```HTML
<body>
    <button id="btn">点击	</button>
</body>
<script type="text/javascript">	
    var n=1;
    function test(){
        console.log("点击了"+(n++)+"次");
    }
    var but = document.getElementById("btn");
    but.onclick = test;  // 注意没有()
</script>
```

### 5.3. DOM2级事件

​		DOM2级事件定义了两个方法，用于处理指定和删除事件处理程序的作：

*   **addEventListener**

    事件的名称没有"on"，如：

    ```js
    document.getElementById("btn").addEventListener("click", test);
    ```

*   **removeEventListener**



这两个方法都接受三个参数：

​		要处理的**事件名，事件处理函数、布尔值**。

其中布尔值true表示在捕获阶段调用事件处理程序，false表示在冒泡阶段调用处理程序。

```JS
var btn = document.getElementById("btn");
btn.addEventListener("click",test);
function test(){
    ...
}
```

​		**DOM2级事件可以为同一个元素绑定多个事件处理函数。**

```JS
btn.removeEventListener("click",test);
```



# 第三部分 document 对象

​		**文档对象模型**（英语：**Document Object Model**，缩写**DOM**），是W3C组织推荐的处理可扩展置标语言的标准编程接口。

每个载入浏览器的HTML都会成为Document对象。Document对象使我们可以从脚本中对HTML页面中的所有元素进行访问。Docment对象是window对象的一部分，可以通过window.document属性对其进行访问。

## 1. 节点

​	加载HTML页面的时候，web浏览器生成一个树型结构，用来表示页面内部结构。DOM将这种结构理解为有节点组成的一个结点树。

**节点分类：**

| 节点类型 | HTML             | 例如               |
| :------- | :--------------- | :----------------- |
| 文档节点 | 文档本身         | 整个文档           |
| 元素节点 | 所有HTML元素     | <a>,<div>,<p>      |
| 属性节点 | HTML元素内的属性 | id,href,name,class |
| 文本节点 | 元素内的文本     | hello              |
| 注释节点 | HTML中的注释     | <!--   -->         |

## 2. 获取节点

| 方法                    | 描述                                     |
| ----------------------- | ---------------------------------------- |
| getElementById()        | 根据id获取对象，如果id重复，以第一个为准 |
| getElementByTagName()   | 根据标签名获取dom对象数组                |
| getElemetnByClassName() | 根据class属性获取dom对象数组             |
| getElementByName()      | 根据name属性获取dom对象数组              |

## 3. 创建节点和插入

### 3.1. 创建节点

| 方法             | 描述                                                       |
| ---------------- | ---------------------------------------------------------- |
| createElement()  | 创建一个新节点，需要传入节点的标签名称，返回创建的元素对象 |
| createTextNode() | 创建一个文本节点，可以传入文本内容                         |
| innerHTML        | 直接添加到指定位置                                         |

### 3.2. 插入节点

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

### 3.3. 间接查找节点

| 方法           | 描述                       |
| -------------- | -------------------------- |
| childNodes     | 返回元素的一个子节点的数组 |
| firstChild     | 返回元素的第一个子节点     |
| lastChild      | 返回元素的最后一个子节点   |
| nextSibing     | 返回元素的下一个兄弟节点   |
| parentNode     | 返回元素的父节点           |
| previousSibing | 返回元素的上一个兄弟节点   |

### 3.4. 删除节点

removeChild()  从元素中山删除子节点。



# 第四部分 window 对象

​		**浏览器对象模型**(BOM)指的是由Web浏览器暴露的所有对象组成的表示模型。BOM与DOM不同，其既没有标准的实现，也没有严格的定义, 所以浏览器厂商可以自由地实现BOM。

作为显示文档的窗口, 浏览器程序将其视为对象的分层集合。当浏览器分析文档时, 它将创建一个对象的集合, 以定义文档, 并详细说明它应如何显示。浏览器创建的对象称为文档对象。它是浏览器使用的更大的对象集合的一部分。此浏览器对象集合统称为浏览器对象模型或BOM。

BOM层次结构的顶层是窗口对象, 它包含有关显示文档的窗口的信息。某些窗口对象本身就是描述文档和相关信息的对象。

## 1. window对象方法

### 1.1. 系统对话框

**消息框  alert()**

**输入框   prompt(”text“，“”)**

**确认框  confirm("text")**

### 1.2. open()

open打开本地窗口或远程窗口。可以指定方式打开。

```JS
window.open("url","_self");// _self,_blank
```

### 1.3. close()

关闭窗口

```JS
window.close();
```

### 1.4. 事件函数

#### 1.4.1. setTimeout()

​	在指定毫秒数后调用函数或计算表达式。返回一个唯一标识；

```JS
setTimeout(fun,3000);// 3秒后调用fun函数。
```

#### 1.4.1. setInterval()

​		按照指定的周期（以毫秒计）来调用函数或计算表达式，也可以根据返回的表示来结束。

```JS
setInterval(fun,1000); // 每隔1秒调用一下fun函数。
```



### 1.5. history对象

*   back()

    加载history列表中的前一个URL。

*   forward()

    加载历史列表的下一个URL。

*   go(URL|number)

    跳转到指定页面。number正数向前走，负数向后走。

### 1.6. location对象

#### 1.6.1. href属性

设置或返回完整的URL。

```JS
window.location.href = www.baidu.com;
```

#### 1.6.2. reload()

重新加载当前的文档。

#### 1.6.3. replace()

用新的文档替换当前文档。

不能后退。

