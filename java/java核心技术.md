# java核心技术

## 主体内容

<img src="..\java\目录结构.png" />

## 第一章

### **1.发展**

* 1996(sun)--->Java 1.0

* 1998(sun)--->Java 1.2

* 2004(sun)--->Java 5.0            (引入Java **泛型**（generics))

* 2006(sun)--->Java 6

* 2009(Oracle)--->收购

* 2011(Oracle)--->Java 7

* 2014(Oracle)--->Java 8         (引入的一个核心概念是**函数式接口**)

### **2.Java术语**

**JDK (Java Development Kit)--->Java开发工具包**

**JRE (Java Runtime Environment)--->Java运行时环境（含虚拟机）**

**JVM (Java Virtual Machine)--->Java虚拟机**

**Java SE (Java的标准版)**

## 第二章

### 配置java环境

#### 1.下载JDK

<a href="https://www.oracle.com/java/technologies/downloads/#license-lightbox">Windows   64位      JDK11</a>

#### 2.配置环境变量

1. win + i   打开设置
2. 点击系统------>点击关于----->点击高级系统设置
3. 点击环境变量
4. 点击系统变量的新建
5. 变量名写%JAVA_HOME%         变量值写安装jdk的目录
6. 然后在系统变量中找到Path 双击进入 ---->点击新建----->找到jdk下面的bin目录，然后点击确定

#### 3.查看

打开终端输入

```shell
java -vserion
```

## 第三章

#### **1."Hello World"**

```java
public class FirstSample
{
    public static void main(String[] args)
    {
        System.out.println("Hello World");
    }
}
```

**java区分大小写**

`main`方法必须是`public`

#### **2.注释**

```java
// ...    行注释  


/* ...  段落注释  */     


/**
  *		方法注释/类注释
  *
  */
```

#### **3.数据类型**

##### **Java整型     `int(4)  short(2)  long(8)  byte(1)`**

##### **Java浮点     `float(4)   double(8)`**

##### **Java没有`unsiged`形式的`int,long,short,byte`**

#### **4.变量**

`final`--->常量

```  final double PI=3.141592653;```

##### **Math类和常量:  ``` Math.sin   Math.cos   Math.tan   Math.atan   Math.log(以e为底)   Math.exp(e指数)   Math.PI   Math.E```**

**Math类的常见方法**

``` Math.sqrt(x)   Math.pow(x,a)   Math.round(x)舍入运算``` 

#### **5.强制类型转换**

 ```  double x=9.997; ```   

```int n=(int)x;``` 

```boolean```类型不与任何类型进行强制类型转换

枚举类型  ```enum Size{red,green,blue,black}; ```  

#### **6.String类**

#####  ```substring```方法:从较大字符串提取子串 

**字符串拼接:"+"号 **

 ``` join```方法:用定界符分隔多个字符串```String all=String.join("/","s","m","l");   // s/m/l``` 

 ```equals```方法:检测两个字符串是否相等```s.equals(t)```    s和t可以是字符串变量,也可以是字面量

```"".equals(null)``` **------>```false```

####  7.输入输出

**"标准输出流"----->``` System.out.println```** 

 **格式化输出------->``` System.out.printf```**

**"标准输入流"----->``System.in``**

``` Scanner in = new Scanner(System.in);```------------构造```Scanner```对象,与``` System.in```关联

**打印时间``` System.out.printf("%tc",new Date());```**

**文件输入输出**

#### 8. 控制流程

**块(block)作用域--------------``` {  }```**

```if      for    while     do-while   swith             ```

**增强循环------```for  each```**

```java
// 把字符串拆分多个字符输出
String name="String";
for (char i:name.toCharArray()         // for  each
     ) {
    System.out.println(i);
}
```

**中断控制流程语句**```break  continue```

#### 9.数组

```JAVA
int[] a = new int[5];
int[] a = {1,2,3,4};
```

**创建一个数字数组，所有元素初始化为0，`boolean`数组元素初始化为`false`**

#### 10.注意

1. java区分大小写。

2. 类名命名规范为驼峰命名。

3. 源代码文件名必须与公共类的类名相同，以.java作为扩展名。

4. main方法必须声明为public。

5. 整型，允许是负数。

   ```markdown
   int 	     4字节
   short		 2字节
   long 		 8字节
   byte 		 1字节
   ```

6. 浮点型

   ```markdown
   float        4字节
   double       8字节
   ```

   浮点类型**float**类型的数值后加**F**或**f**区分，若没加默认为**double**类型。

7. NaN不是一个数字。计算0/0或负数的平方根时结果是NaN。

8. char表示单个字符

9. boolen类型。整型值与布尔值之间不能互相转换。

10. 变量名必须是一个以字母开头并由字母或数字构成的序列。

11. final关键字表明一个常量。

12. 强制类型转换通过截断小数部分将浮点数值转换为整型。

13. 用Math.round()方法对浮点数进行舍入运算。

14. java没有内置字符串类型，在标准java类库中提供了一个String类。

15. 字符串不能用==做判断，而用str.equals(otherStr)方法判断。

16. 空串""，指长度为0的字符串。

17. null指空对象。

18. 需要由较短的字符构建字符串时，使用StringBuilder类处理。

19. 格式化输出System.out.printf()。

20. 文件读取，需要用File对象构建Scanner对象。

    ```JAVA
    Scanner in = new Scanner(Path.get("文件路径"),"UTF-8");
    ```

21. 文件写入。

    ```JAVA
    PrintWriter out = new PrintWriter("文件路径","UTF-8");
    ```

    

22. switch语句中的case标签可以是char、byte、short、int。从javaSE 7开始，case标签值支持字符串字面量。

23. java提供大数值处理类。

    ```JAVA
    class BigInterger   // 实现任意精度的整数运算。
    class BigDecimal    // 实现任意精度的浮点数运算。
    ```

24. 匿名数组。

    ```JAVA
    smallPrimes = new int[]{1,2,3,4,5};
    ```

25. jdk提供Arrays.sort()方法用于排序数组。源码实现为快速排序。

## 第四章

### 1.oop编程

**面向对象程序设计**（英语：Object-oriented programming，缩写：OOP）是种具有对象概念的编程典范，同时也是一种程序开发的抽象方针。它可能包含数据、特性、代码与方法。对象则指的是类（class）的实例。它将对象作为程序的基本单元，将程序和数据封装其中，以提高软件的重用性、灵活性和扩展性，对象里的程序可以访问及经常修改对象相关连的数据。在面向对象程序编程里，计算机程序会被设计成彼此相关的对象。

面向对象程序设计可以看作一种在程序中包含各种独立而又互相调用的对象的思想，这与传统的思想刚好相反：传统的程序设计主张将程序看作一系列函数的集合，或者直接就是一系列对电脑下达的指令。面向对象程序设计中的每一个对象都应该能够接受数据、处理数据并将数据传达给其它对象，因此它们都可以被看作一个小型的“机器”，即对象。目前已经被证实的是，面向对象程序设计推广了程序的灵活性和可维护性，并且在大型项目设计中广为应用。此外，支持者声称面向对象程序设计要比以往的做法更加便于学习，因为它能够让人们更简单地设计并维护程序，使得程序更加便于分析、设计、理解。反对者在某些领域对此予以否认。

### 2.对象的三个特性

* 行为(behavior)

  可以对对象施加那些操作，或可以对对象施加哪些方法？

* 状态(state)

  当施加哪些方法时，对象如何响应？

* 标识(identity)

  如何辨别具有相同行为与状态不同的对象？

### 3.类与类之间的关系

* 依赖("uses-a")
* 聚合("has-a")
* 继承("is-a")

**减少“依赖”关系的类，从而降低代码耦合度。**

### 4.创建对象

```JAVA
new Student();
```

new 操作符调用构造器返回一个实例。

```JAVA
Student frank = new Student();
```

### 5.构造器

构造器是特殊的方法，构造器用来构造新实例，可以用来初始化实例。**构造器名与类名必须相同，无返回值。**

```JAVA
new Student();   // 无参构造器

new Student("frank",12,"男");   // 有参构造器
```

***对象引用不包含一个对象，而仅仅引用一个对象。***

```JAVA
Student frank;      // 创建一个对象引用   frank引用null
```

构造器调用构造器：

```JAVA
public Student(String id,String name){
    this(id);
    this.name = name;
}
```

### 6.访问器

**只访问而不修改对象的方法称为访问器。**

**获取当前年月日**

```JAVA
LocalDate date = LocalDate.now();
int year = date.getYear();
int month = date.getMonthValue();
int day = date.getDayOfMonth();
```

### 7.更改器

改变实例状态的方法称为更改器。

### 8.隐式参数与显示参数

```JAVA
public void setName(String name) {
        this.name = name;
}
```

this为隐式参数，name为显示参数。

### 9.访问权限

一个方法可以访问所属类的所有私有数据。

私有方法不会被外部的其他类调用，私有方法通常做辅助方法。

### 10.final实例域

```JAVA
final double PT = 3.1415926;
```

final域必须在构建对象是初始化。final修饰符大都应用于基本类型域，或不可变类的域。

不可变类：类中的每个方法都不会改变其对象。

### 11.静态域与静态方法

```JAVA
static final double PT = 3.1415926;
```

静态域属于类，不属于任何独立的对象。

静态方法是一种不能向对象实施操作的方法。

使用场景：

* 一个方法不需要访问对象状态，其所需的参数都是通过显示参数提供的。
* 一个方法只需访问类的静态域。
* 工厂方法

**工厂方法：不使用构造器创建对象**

```JAVA
LocalDate date = LocalDate.now();   // LocalDate的实例有静态now()方法创建。
```

### 12.方法参数

方法参数有两种：

* 基本数据类型
* 对象引用

### 13.静态初始化块

```JAVA
// 静态代码读取配置文件
static {
    try {
		InputStream inputStream = ClassLoader.getSystemResourceAsStream("db.properties");
			Properties properties = new Properties();
			properties.load(inputStream);

			url = properties.getProperty("url");
			user = properties.getProperty("user");
			password = properties.getProperty("password");

         } catch (Exception e) {
                e.printStackTrace();
            }
}
```

### 14.对象析构与finallize方法

java有自动垃圾回收器，java不支持析构器。

finallize方法将在垃圾回收器清除对象之前调用。

### 15.package

java通过包（package）组织类。使用包的主要原因是确保类名的唯一性。

import语句用来引入包。

```JAVA
import java.time.LocalDate;
import java.time.*;
```

import语句用来引入静态域和静态方法。

```JAVA
import static java.lang.System.*;
public class Test {
    public static void main(String[] args) throws Exception {
        out.println("hello");
    }
}
```

类的路径必须唯一。

### 16.注意

1. 在java中，所有的类都由object扩展来。
2. 一个源文件中，只能有一个公有类，但可以有任意数目的非公有类。
3. 类设计技巧
   1. 一定保证数据的私有
   2. 一定要对数据初始化
   3. 不要在类中使用过多的基本类型
   4. 不是所有的域都需要独立的get和set方法
   5. 将职责过多的类分解
   6. 类名和方法名做到见名知意
   7. 优先使用不可变类

## 第五章

## 第六章

## 第七章

## 第八章

## 第九章

## 第十章

## 第十一章

## 第十二章

## 第十三章

## 第十四章



