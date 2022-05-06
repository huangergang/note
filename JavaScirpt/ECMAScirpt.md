# JavaScript

## 1.介绍

​		**JavaScript**（通常缩写为**JS**）是一种高级的、解释型的编程语言。JavaScript是一门基于原型，是一门多范式的语言，它支持面向对象程式設計，指令式编程，以及函数式编程。它提供语法来操控文本、数组、日期以及正则表达式等，不支持**I/O**，比如网络、存储和图形等，但这些都可以由它的宿主环境提供支持。它已经由**ECMA**（欧洲电脑制造商协会）通过**ECMAScript**实现语言的标准化。它被世界上的绝大多数网站所使用，也被世界主流浏览器（**Chrome、IE、FireFox、Safari、Opera**）支持。

## 2.基础用法

1. **行内js：js代码写在html标签上**

   ```HTML
   <button type="button" onclick="alert("hello")">
   </button>		<!--点击事件的绑定-->
   ```

2. **内部js：写在html页面中的script中**

   ```HTML
   <script type="text/javascript">
       alert("hello");
   </script>
   ```

3. **外部js：创建js文件，通过script标签引入js文件**

```HTML
<script src="路径" type="text/javascript" charset="utf-8">
     alert("hello");<!--无效-->
</script>		<!--在有src属性的script标签中写js代码不会执行-->
```

***onclick 点击元素时触发***

***alert("内容") 弹出层***

***console.log("内容") ,打印内容在控制台***

## 3.语句和注释

​		**js代码以行为单位， 从上往下一行一行执行。语句以分号结尾，一个分号就表示语句结束（弱类型语言，对分号不严格）。**

**注释：**

```JS
<!--	兼容html风格注释  -->

// 		单行注释

/* 多行注释 */
```

## 4.变量

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

1. **当变量只声明未赋值时返回*undfinded***（未定义）

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
   console.log(name);
   var name = "frank";
   ```

**注：只有用*var*声明的变量才能可以变量提升**

## 5.数据类型

### 5.1.数值

**（Number）**：整数和小数

1. **js中所有数字（整型和浮点型）都是以64位浮点类型存储的。所以在js中1和1.0是相等的，1+1.0值为2。**

2. **浮点类型最高精度为17位，浮点类型做运算不准确，不建议做判断。**

3. **自动变为整型。**

```JS
var a = 1;
var b = 1.234;
```

### 5.2.字符串

**（String）**：字符串

```JS
var name = "frank";
```

### 5.3.布尔值

**（Boolean）**：true 和 false

```JS
var is = true;
```

### 5.4.undfinded

​	表示未定义或不存在

**出现undefinded的情况：**

1. **当声明了变量但未赋值时，变量值未undefinded。**
2. **调用函数时，函数有形参，但未提供实参，则参数未undefinded。**
3. **函数没有返回值时，默认返回为undefinded。**

### 5.5.Null

表示空值

***函数：typeof返回变量数据类型***

```JS
var a = flase;
var str = typeof a;
```

```JS
var str  = typeof null; // str为object 
```

## 6.类型转换

### 6.1.自动类型转换



### 6.2.函数转换

#### 6.2.1.parseInt()

​		**装换之前，首先会分析该字符串， 判断位置为0处的字符，判断它是否是个有效数字，如果不是，则直接返回NaN，不再继续， 如果是则继续，直到找到非字符。**

```JS
parseInt("1244blue");  // 1244
parseInt("22.5");    // 22
parseInt("blue");    // NaN
```

#### **6.2.2.parseFloat()**

​		**与parseInt不同的是，parseFloat可以识别第一个小数点。**

```JS
parseFloat("1244.3blue"); //  1244.3
parseFloat("124.234");    //  124.234
parseFloat("blue");      //   NaN
parseFloat("12.123.13");   // 12.123
```

### 6.3.显示转换

#### 6.3.1.toString()

**toString()函数可以将数字转换为字符串**。

```JS
var a = toString(123);  // "123"
```

#### 6.3.2.toFixed()

**函数将根据小数点后指定位数将数字转换为字符串。**

#### 6.3.3.构造方法

​		**JS 为Number、Boolean、String对象提供了构造方法，用于强制转换其他类型的数据。此时操作的是整个数据，而不是部分。**

```JS
Number("3.4.5")    // 返回NaN
```

**String()将任意值转换成字符串，包括null和undefinded**

**最简单转字符串直接在任意数据后+ “ ”   即可**

## 7.运算符

### 7.1.算数运算符

**+     -     *    /     %    ++    --**

### 7.2.赋值和扩展运算符

**=   +=    -=     *=     /=    %=**

### 7.3.比较运算符

**==** 等于    比较值是否相等

**===** 全等（值和类型）

### 7.4.逻辑运算符

**&&     ||     !**

### 7.5.三目运算符

**?:**

## 8.控制语句

### 8.1.if

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

### 8.2.switch

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
```

### 8.3.while和do  while

```JS
while(表达式){
    ...
}

do {
    ...
}while(表达式);
```

### 8.4.for

```JS
for(var a = 1;a <= 5; a++){
    ...
}
```

## 9.数组

### 9.1.数组定义

```JS
var arr = [1,2,3];		// 隐式创建

var arr = new Array(1,2,3);			// 直接实例化

var arr = new Array(size);		//  创建数组并指定长度
```

### 9.2.数组操作

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

### 9.3.数组遍历

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
var arr = [1,2,3,4];
arr.forEach(function(element,index){
    console.log(element);
    console.log(index);
})
```

### 9.4.数组方法

**push			     	添加元素到最后**

**unshift  	 	   	添加元素到最前**

**pop			    		删除最后一项**

**shift			  	 	删除第一项**

**reverse		  		数组翻转**

**join				 		数组转成字符串**

**indexof		  		数组元素索引**

**slice						截取数组**

**splice			  		剪切数组，原数组变化**

**concat					数组合并**

## **10.函数**

### 10.1.函数定义

**普通定义，具有函数名提升的效果。**

```JS
function funName([参数列表]){
    ...
}
```

**匿名函数**

```JS
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

### 10.2.

## 11.内置对象

### 11.1.String

### 11.2.Math

### 11.3.Date

