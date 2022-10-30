# Java核心技术1

## 主体内容

<img src=".\img\目录结构.png" />

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
6. 然后在系统变量中找到Pat9h 双击进入 ---->点击新建----->找到jdk下面的bin目录，然后点击确定

#### 3.查看

打开终端输入

```shell
java -vserion
```



## 第三章

#### **1. "Hello World"**

```java
public class FirstSample {
    public static void main(String[] args)
    {
        System.out.println("Hello World");
    }
}
```

**java区分大小写**

`main`方法必须是`public`

源代码的文件名必须与公共类的名字相同，并用 .java 作为扩展名。类名的命名必须为驼峰命名法。



编译过程

```bash
$ javac Tesrt.java    # javac将Test.java文件转换成字节码（.class 文件）

$ java Test           #  字节码文件有jvm执行
```



#### 2. 注释

```java
// ...    行注释  


/* ...  段落注释  */     


/**
  *		方法注释/类注释
  *
  */
```

#### 3. 数据类型

java整型

| 类型  | 存储需求 | 取值范围                                              |
| ----- | -------- | ----------------------------------------------------- |
| int   | 4字节    | -2 147 483 648 ~ 2 147 483 647                        |
| short | 2字节    | -32 786 ~ 32 767                                      |
| long  | 8字节    | -9 223 372 036 854 775 808 ~9 223 372 036 854 775 807 |
| byte  | 1字节    | -128 ~ 127                                            |

长整数有一个后缀L或l。十六进制数有一个前缀0x或者0X。八进制有一个前缀0。从java7开始加上前缀0b或者0B表示二进制数。还可以位数值加下划线如(100_000_000)，方便辨认位数。

java没有任何无符号(unsigned)的int、short、long、byte。



java浮点

| 类型   | 存储需求 | 取值范围                                                     |
| ------ | -------- | ------------------------------------------------------------ |
| float  | 4字节    | 大约 ${\pm}$ 3.402 823 47E + 38F（有效位数6 ~ 7位）          |
| double | 8字节    | 大约 ${\pm}$ 1.797 693 134 862 315 70E + 308 （有效位数15位） |

float类型的数值有一个后缀F或f。没有后缀F的浮点数值默认为double类型。也可以用后缀D或d表示double类型。



char类型表示单个字符，有些Unicode字符需要两个char值。

boolean类型有两个值：false和true，用来判定逻辑条件。整数与布尔值之间不能进行转换。



#### 4. 变量

java中每一个变量都有一个类型（Type）。

final修饰的变量表示常量，表示这个变量只能被赋值一次。

```java
public class Test{
    
    public static final int LENG = 3;
    
    public static void main(String[] args){
        
         final double PI = 3.141592;
        
    }
    
}
```



Math类

```java
// 三角函数
Math.sin()
Math.cos()  
Math.tan()
Math.atan()  
Math.log(以e为底)   
Math.exp(e指数)  
    
// 常量    
Math.PI   Math.E
    
// Math类的常见方法
Math.sqrt(x)    // 开根
Math.pow(x,a)   // 幂运算  x的a次幂
Math.round(x)   // 舍入运算  
```



#### 5. 类型转换

>   数值之间的合法转换

实线表示无信息丢失的转换，虚箭头表示可能有精度损失的转换。

<img src=".\img\数据转换.png">



>    强制类型转换

double类型转int

```java
double x = 9.997;  

int n = (int)x;    // 直接舍弃小数部分，n = 9

int n2 = (int) Math.round(x);   // 舍入运算，n2 = 10  round方法返回long类型
```



boolean类型不与任何类型进行强制类型转换。



如果试图将一个数值从一种类型强制转换为另一种类型，而又超出了目标类型的表示范围，结果就会截取成一个完全不同的值。

```java
int a = 300;
byte b = (byte)a;   //  b为44
```



#### 6. 运算符

1.   二元赋值运算符

```java
x += 4 ;  // 等价于 x = x + 4;
```

2.   自增与自减

```java
int m = 7;
int n = 7;
int a = 2 * ++m;  // a=18,m=8
int b = 2 * n++;  // b=14,n=7
```

3.   关系运算符

| 运算符 | 举例       | 描述       |
| ------ | ---------- | ---------- |
| ==     | 3 == 7     | 检测相等性 |
| !=     | 3 != 7     | 检测不等性 |
| <      | 3  <  7    | 小于       |
| >      | 3  >  7    | 大于       |
| <=     | 3   <=  7  | 小于等于   |
| >=     | 3   >=   7 | 大于等于   |

4.   逻辑运算符

| 运算符 | 描述   |
| ------ | ------ |
| &&     | 条件与 |
| \|\|   | 条件或 |

5.   三元运算符

```java
x < y ? x : y;   // 返回x，y中较小者
```

6.   位运算符

处理整数类型时，可以直接对整型数值的各个位完成操作。

| 运算符 | 描述                                                 |
| ------ | ---------------------------------------------------- |
| &      | 位与                                                 |
| \|     | 位或                                                 |
| ^      | 如果相对应位值相同，则结果为0，否则为1               |
| ~      | 位取反                                               |
| >>     | 按位右移运算符。左操作数按位右移右操作数指定的位数。 |
| <<     | 按位左移运算符。左操作数按位左移右操作数指定的位数。 |



#### 7. String类

java 为字符串操作专门设计了一个类String。String不属于基本类型。



1.   声明并赋值字符串变量

```java
String str = "hello";            // 字符串拼接直接用"+"号 
String str1 = new String("hello");
```

2.   String类的常用方法

     1.   返回字符长度   length()
     2.   大小写转化     toLowerCase()   toUpperCase()
     3.   去除字符串两端的空格   trim()  
     4.   截取字符串     subString(int  beginIndex)        subString(int  beginIndex, int endIndex)
     5.   ....

3.   String类的静态方法

     1.    join方法:  用定界符分隔多个字符串

          ```java
          String[] arr = {"Frank", "Tim", "Alan", "Aim"};
          System.out.println(String.join("-->", arr));
          // Frank-->Tim-->Alan-->Aim  
          ```

4.    equals方法

     检测两个字符串是否相等```s.equals(t)```    s和t可以是字符串变量，也可以是字面量

     ```java
     "".equals(null);   // false
     ```

     

####  8. 输入输出

1.标准输入流

```java
Scanner in = new Scanner(System.in);   // Scanner类位于java.util包
String in1 = in.nextLine();    // nextLine 读取整行内容，包含空格
String in2 = in.next();    // next 读取一个单词，以空格分隔
```



2.标准输出流

```java
System.out.prinln();
```



3.格式化输出

```java
System.out.prinf();
```



<img src="./img/printf.png">



用于prinf的转化符

| 转换符 | 类型           | 举例       |
| ------ | -------------- | ---------- |
| d      | 十进制整数     | 159        |
| x      | 十六进制整数   | 9f         |
| o      | 八进制整数     | 237        |
| f      | 定点浮点数     | 15.9       |
| e      | 指数浮点数     | 1.59e+01   |
| g      | 通用浮点数     | ——         |
| a      | 十六进制浮点数 | 0x1.fccdp3 |
| s      | 字符串         | Hello      |
| c      | 字符           | H          |
| b      | 布尔           | True       |
| h      | 散列码         | 42628b2    |
| %      | 百分号         | %          |
| n      | 换行           | ——         |



用于printf的标志

| 标志               | 目的                                                         | 举例         |
| ------------------ | ------------------------------------------------------------ | ------------ |
| +                  | 打印正数和负数的符号                                         | +3333.33     |
| 空格               | 在整数之前添加空格                                           | \| 3333.33\| |
| 0                  | 数字前面补0                                                  | 003333.33    |
| -                  | 左对齐                                                       | \|3333.33 \| |
| (                  | 将负数括在括号内                                             | (3333.33)    |
| ,                  | 添加分组分隔符                                               | 3,333.33     |
| #  (对于f格式)     | 包含小数点                                                   | 3,333.       |
| # （对于x或o格式） | 添加前缀 0x 或 0                                             | 0xcafe       |
| $                  | 给定被格式化的参数索引。例如，%1$d，%1\$x将以十进制和十六进制格式打印第一个参数 | 159    9F    |
| <                  | 格式化前面说明的数值。例如，%d%<x以十进制和十六进制打印同一个数值 | 159    9F    |



日期和时间的转换符（日期的转换符要在前加t，如：System.out.printf("%tc",new Date());） 

| 转换符 | 类型                                          | 举例                           |
| ------ | --------------------------------------------- | ------------------------------ |
| c      | 完整的日期和时间                              | 周六 10月 29 09:24:05 CST 2022 |
| F      | ISO 8601 日期                                 | 2022-10-29                     |
| D      | 美国格式日期（月/日/年）                      | 10/29/22                       |
| T      | 24小时时间                                    | 09:28:16                       |
| r      | 12小时时间                                    | 09:28:39 上午                  |
| R      | 24小时时间没有秒                              | 09:29                          |
| Y      | 4位数字的年（前面补0）                        | 2022                           |
| y      | 年的后两位数字（前面补0）                     | 22                             |
| C      | 年的前两位数字（前面补0）                     | 20                             |
| B      | 月的完整拼写                                  | 十月                           |
| b或h   | 月的缩写                                      | 10月                           |
| m      | 两位数字的月（前面补0）                       | 10                             |
| d      | 两位数字的日（前面补0）                       | 09                             |
| e      | 两位数字的日（前面不补0）                     | 9                              |
| A      | 星期几的完整拼写                              | 星期六                         |
| a      | 星期几的缩写                                  | 周六                           |
| j      | 三位数的年中的日子（前面补0），在001到366之间 | 302                            |
| H      | 两位数字的小时（前面补0），在0到23之间        | 18                             |
| k      | 两位数字的小时（前面不补0），在0到23之间      | 18                             |
| I      | 两位数字的小时（前面补0），在0到12之间        | 09                             |
| l      | 两位数字的小时（前面不补0），在0到12之间      | 9                              |
| M      | 两位数字的分钟（前面补0）                     | 41                             |
| S      | 两位数字的秒（前面补0）                       | 52                             |
| L      | 三位数字的毫秒（前面补0）                     | 308                            |
| N      | 九位数的毫微秒（前面补0）                     | 923000000                      |
| p      | 上下午的标志                                  | 上午      pm                   |
| z      | 从GMT起，RFC822数字位移                       | +0800                          |
| Z      | 时区                                          | CST                            |
| s      | 从格林威治时间 1970-01-01 00:00:00 起的秒数   | 1667007969                     |
| Q      | 从格林威治时间 1970-01-01 00:00:00 起的毫秒数 | 1667008009322                  |



在printf中使用索引，索引必须紧跟%后，并以$终止。从1开始。

```java
System.out.printf("%1$tr %1$tA", new Date());   // 09:51:34 上午 星期六
```

打印发票单

```java
Map<String, Double> map = new HashMap<>();
map.put("IPhone 14pro max", 12000.0);
map.put("Huawei mate40 pro", 11000.0);
map.put("xiaomi 12 pro", 12000.0);

System.out.printf("%-20s%18s", "商品名", "价格");
System.out.print("\n------------------------------------------\n");
map.forEach((k, v) -> {
    System.out.printf("%-20s% 20.2f元\n", k, v);
});
```

String.format方法创建一个格式化字符串，而不打印输出。

```java
String message = String.format("hello, my name is %s price is %.2f$", "Tom",33.5);
```



4.文件输入输出

对文件的读取需要一个用File对象构造一个Scanner对象。

```java
Scanner in = new Scanner(Paths.get("D:\\note\\Test_Study\\src\\file.txt"), "utf8");
```

如果文件名中包含反斜杠符号，就必须在每个反斜杠符之前再加一个反斜杠符："D:\\\note\\\Test_Study\\\src\\\file.txt"；



如果要写入文件，就要构造一个PrintWriter 对象。在构造器中只需提供文件名。

```java
// PrintWriter 可以使用和System.out一样的print，printf，println方法，会覆盖文件内容写入
PrintWriter pw = new PrintWriter("D:\\note\\Test_Study\\src\\file.txt", "utf8");
pw.printf("%1$tr %1$tA", new Date());
pw.close();

// FileWriter 可以实现文件内容的追加写入
FileWriter fw = new FileWriter("D:\\note\\Test_Study\\src\\file.txt", true);
fw.write(String.format("%1$tr %1$tA", new Date()));
fw.close();
```



#### 9. 控制流程

1.块(block)作用域  {}

```java
class Test{

	static
    {
          //  ...
    }
    
	public void test()
    {
      	  // ...
    }
    
}
```

2.条件语句

if

```java
if(){
    // ...
} else() {
    // ...
    if(){
        // ...
    }
    
} 
```

for

```java
for(;;){
    // ...
}
```

while

```java
while(true){
    
   int  a = 10;
    
   if(a < 0)
       break;
    
    a--;
}
```

do-while

```java
do{
    
}while(true)
```

swith

```java
switch(choice){
        
    case 1:
        // ...
        break;
    case 2:
        // ...
        break;
    default:
        // ...
        break;
}
```

switch语句中的case标签可以是：

1.   类型为char、byte、short或int的常量表达式
2.   枚举常量
3.   从java7开始支持字符串字面量

**增强循环------```for  each```**

```java
// 把字符串拆分多个字符输出
String name="String";
for (char i:name.toCharArray()         // for  each
     ) {
    System.out.println(i);
}
```



**中断控制流程语句**

break   直接跳出，结束循环

```java
for (int a = 0; ; a++) {

    System.out.println("a = " + a);

    if (a > 2) break;
}
```

continue   跳出当次循环，下次循环继续执行

```java
for (int a = 0; a < 10; a++) {

    if (a == 2) continue;        // 不输出2

    System.out.println("a = " + a);

}
```



#### 10. 大数据

​		如果基本的整数和浮点数精度不能够满足需求，那么可以使用java.math包中的两个很有用的类：BigInteger和BigDecimal。这两个类可以处理任意长度数字序列的数值。BigInteger类实现了任意精度的整数运算，BigDecimal实现了任意精度的浮点数运算。

```java
BigInteger a = new BigInteger("2342342342234234");   // 创建一个大数值整数

BigInteger b =  BigInteger.valueOf(123);     // 静态方法valueOf()可以将普通数值装换为大数值

BigInteger c = a.add(b);                   // 加法
```

大整数

>   API  java.math.BigInteger 1.1

*   BigInteger  add(BigInteger  other)                 加法

*   BigInteger  subtract(BigInteger  other)          减法

*   BigInteger  multiply(BigInteger  other)         乘法

*   BigInteger divide(BigInteger  other)              除法

*   BigInteger  mod(BigInteger  other)                取余

*   int  compareTo(BigIneger  other)

    比较，相等返回0，大于返回负数，小于返回整数



```java
BigDecimal a1 = new BigDecimal("2342342342234234.2");
BigDecimal b1 = BigDecimal.valueOf(123.2);

BigDecimal c1 = a1.add(b1);
System.out.println("c = " + c1);
```

大实数

>   API  java.math.BigDecimal  1.1

*   BigDecimal  add(BigDecimal  other)                 加法

*   BigDecimal  subtract(BigDecimal  other)          减法

*   BigDecimal  multiply(BigDecimal  other)         乘法

*   BigDecimal  divide(BigDecimal  other)              除法

*   BigDecimal  mod(BigDecimal  other)                取余

*   int  compareTo(BigDecimal  other)

    比较，相等返回0，大于返回负数，小于返回整数



#### 11. 数组

​		数组是一种数据结构，存储同一类型的值的集合。

```JAVA
int[] arr = new int[5];
int[] arr1 = {1, 2, 3, 4};
```

创建一个数字数组，所有元素初始化为0，boolean数组元素初始化为false。对象数组初始化值为null。



数组拷贝（Arrays.copyOf() ）

```java
int[] arry = new int[]{1, 2, 3, 4, 5};
int[] ints = Arrays.copyOf(arry, arry.length);   // 重新为数据分配空间存储
```



>   API    java.util.Arrays  1.2

*   static String toString(type[]  a)       5.0

*   static typr copyOf(typr[] a,  int  length)   6

*   static typr copyOf(typr[] a,  int  start,  int  end)   6

*   static  void  sort(type[]  a)

    快速排序数组

*   static  int  binarySearch(type[]  a, type   v)

*   static typr binarySearch((typr[] a,  int  start,  int  end,  type   v)   6

    使用二分查找在a数组中查找v，start为起始下标，end为结束下标，如果查找成功返回对应下标值，反之返回负数。

*   static  void  fill(type[]  a, type  v)

    将数组的所有元素值都设置为v。

*   static boolean equals(type[] a, type[] b)

    如果两个数组大小相等，并且下标相同的元素都对应相等，返回true。



#### 12. 多维数组

​		二维数组

```java
int[][] arr = {{1, 2, 4}, {4, 5, 6}, {7, 8, 9}};

int[][] arr = new int[][]{{1, 2, 4}, {4, 5, 6}, {7, 8, 9}};
```



遍历每一个元素

```java
for (int[] ints : arr) {
    for (int anInt : ints) {
        System.out.println("anInt = " + anInt);
    }
}
```

快速打印一个二维数组

```java
System.out.println(Arrays.deepToString(arr));
```



>   不规则数组

​	java实际上没有多维数组，只有一维数组。多维数组被解释为数组的数组。

```java
int[][] arr1 = {{1}, {2, 2}, {3, 3, 3}};

for (int[] ints : arr1) {
    for (int anInt : ints) {
        System.out.print(anInt +" ");
    }
    System.out.println();
}
/*  输出结果
1 
2 2 
3 3 3 
*/
```



#### 13. 注意

1. NaN不是一个数字。计算0/0或负数的平方根时结果是NaN。
2. char表示单个字符
3. boolen类型。整型值与布尔值之间不能互相转换。
4. 变量名必须是一个以字母开头并由字母或数字构成的序列。
5. 强制类型转换通过截断小数部分将浮点数值转换为整型。
6. java没有内置字符串类型，在标准java类库中提供了一个String类。
7. 字符串不能用==做判断，而用str.equals(otherStr)方法判断。
8. 空串""，指长度为0的字符串。
9. null指空对象。
10. jdk提供Arrays.sort()方法用于排序数组。源码实现为快速排序。



## 第四章

### 1. oop编程

**面向对象程序设计**（英语：Object-oriented programming，缩写：OOP）是种具有对象概念的编程典范，同时也是一种程序开发的抽象方针。它可能包含数据、特性、代码与方法。对象则指的是类（class）的实例。它将对象作为程序的基本单元，将程序和数据封装其中，以提高软件的重用性、灵活性和扩展性，对象里的程序可以访问及经常修改对象相关连的数据。在面向对象程序编程里，计算机程序会被设计成彼此相关的对象。

面向对象程序设计可以看作一种在程序中包含各种独立而又互相调用的对象的思想，这与传统的思想刚好相反：传统的程序设计主张将程序看作一系列函数的集合，或者直接就是一系列对电脑下达的指令。面向对象程序设计中的每一个对象都应该能够接受数据、处理数据并将数据传达给其它对象，因此它们都可以被看作一个小型的“机器”，即对象。目前已经被证实的是，面向对象程序设计推广了程序的灵活性和可维护性，并且在大型项目设计中广为应用。此外，支持者声称面向对象程序设计要比以往的做法更加便于学习，因为它能够让人们更简单地设计并维护程序，使得程序更加便于分析、设计、理解。反对者在某些领域对此予以否认。



面向过程与面向对象程序设计的比较

<img src="./img/面向过程与面向对象的比较.png">



### 2. class (类)

​		类（class）是构造对象的版图或蓝图。由类构造（construct）对象的过程称为创建类的实例（instance）。封装（encapsulation，有时称为数据隐藏），指将数据和行为组合在一个包中，并对对象的使用者隐藏了数据和实现方法。对象中的数据称为实例域（instance field）。操纵数据的过程称为方法（method）。对于每个特定的类实例（对象）都有一组特定的实例域值。这些值的集合就是这个对象的当前状态（state）。

java中所有的类都源于Object类。通过扩展一个类来建立另外一个类的过程称为继承（inheritance）。



### 2. 对象的三个特性

* 行为(behavior)

  可以对对象施加那些操作，或可以对对象施加哪些方法？

* 状态(state)

  当施加哪些方法时，对象如何响应？

* 标识(identity)

  如何辨别具有相同行为与状态不同的对象？

<u>如果不经过方法调用就可以改变类的状态，就说明封装性遭到了破坏。</u>

### 3. 类与类之间的关系

* 依赖("uses-a")

    如一个类的方法操纵另一个类的对象。

    ```java
    class A {            // A依赖B
        public void fun1(B b) {
            // ...
        }
        public B fun2() {
            // ...
            return new B();
        }
    }
    class B { }
    
    ```
* 聚合("has-a")

    类A的对象包含类B的对象。

    ```java
    class A {            // A聚合B
        private B b;     
    }
    
    class B { }
    ```

* 继承("is-a")

    ```java
    class A {
        private String a;
    }
    
    class B extends A {       // B继承A
        private String b;
    }
    ```

<u>减少"依赖"关系的类，从而降低代码耦合度。</u>



表达类关系的UML符号

| 关系     | UML链接符             |
| -------- | --------------------- |
| 继承     | ——————\|>             |
| 接口实现 | ------------------\|> |
| 依赖     | ------------------>   |
| 聚合     | <>—————               |
| 关联     | ———————               |
| 直接关联 | ———————>              |



### 4. 创建对象

要想使用对象，就必须首先构造对象，指定其初始状态。在java中使用构造器（constructor）构造新实例。

```JAVA
new Date();		// new 关键字用于创建对象
```

new 操作符调用构造器返回一个实例。

```JAVA
Date today = new Date();   // today为对象引用
```



java标准类库分别包含了两个类

1.   Date                用来表示时间点
2.   LocalDate       用来表示日历

```java
// 创建一个日历类
LocalDate.now();

// 构造一个指定日期的日历类
LocalDate.of(1999, 12, 31);

// plusDays()方法
LocalDate now = LocalDate.now();
LocalDate after100 = now.plusDays(100);   // plusDays() 返回指定天数后的一个新的LocalDate实例
```

>   设计一个日历的打印程序

```java
package test.com.javaSE1.fourthUnit;

import java.time.DayOfWeek;
import java.time.LocalDate;

public class LocalDateTest {

    public static void main(String[] args) {

        LocalDate date = LocalDate.now();
        int month = date.getMonthValue();
        int today = date.getDayOfMonth();

        date = date.minusDays(today - 1);
        DayOfWeek weekday = date.getDayOfWeek();
        int value = weekday.getValue();

        System.out.println("Mon Tue Wed Thu Fri Sat Sun");
        for (int i = 1; i < value; i++)
            System.out.print("    ");

        while (date.getMonthValue() == month) {
            System.out.printf("%3d", date.getDayOfMonth());
            if (date.getDayOfMonth() == today) {
                System.out.print("*");
            } else
                System.out.print(" ");
            date = date.plusDays(1);
            if (date.getDayOfWeek().getValue() == 1) System.out.println();

        }
        if (date.getDayOfWeek().getValue() != 1) System.out.println();
    }

}
```

>   API    java.time.LocalDate    8

*    static LocalTime now()

*   static LocalTime of(int  year, int  month, int  day)

*   int  getYear()

*   int  getMonthvalue()  

*   int  getDayOfMonth()

    获得当前日期的年、月、日

*   DayOfWeek  getDayOfWeek

    得到当前日期是星期几，作为DayOfWeek类的一个实例返回。调用 getValue 来得到 1 ~ 7 之间的一个数，表示这是星期几，1 表示星期一，7 表示星期日。

*   LocalDate  plusDays(int  n)

*   LocalDate  minusDays(int  n)

    生成当前日期之后前 n 天的日期。

#### 4.1. 构造器

构造器是特殊的方法，构造器用来构造新实例，可以用来初始化实例。**构造器名与类名必须相同，无返回值。**

```JAVA
new Student();   // 无参构造器

new Student("frank", 12, "男");   // 有参构造器
```

***对象引用不包含一个对象，而仅仅引用一个对象。***

```JAVA
Date today;      // 创建一个对象引用   frank引用null
```

构造器调用构造器：

```JAVA
public Student(String id,String name){
    this(id);	// 调用已有构造
    this.name = name;
}
```



关于构造器

*   构造器与类同名
*   每个类可以有一个以上的构造器
*   构造器可以有0个、1个或多个参数
*   构造器没有返回值
*   构造器总是伴随  new 操作一起调用



#### 4.2. 访问器

**只访问而不修改对象的方法称为访问器。**

get方法

**获取当前年月日**

```JAVA
LocalDate date = LocalDate.now();
int year = date.getYear();
int month = date.getMonthValue();
int day = date.getDayOfMonth();
```

#### 4.3.  更改器

改变实例状态的方法称为更改器。

set方法

#### 4.4. 隐式参数与显示参数

```JAVA
public void setName(String name) {
      this.name = name;
}
```

this为隐式参数，name为显示参数。



>    设计原则

*   一个私有的数据域
*   一个公有的域访问器方法       （get）
*   一个公有的域更改器方法       （set）



### 5. 基于类访问权限

一个方法可以访问所属类的所有私有数据。

私有方法不会被外部的其他类调用，私有方法通常做辅助方法。





### 6. final实例域

```JAVA
final double PI = 3.1415926;
```

final域必须在构建对象是初始化。final修饰符大都应用于基本类型域，或不可变类的域。

不可变类：类中的每个方法都不会改变其对象。

### 7. 静态域与静态方法

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
// 静态代码读取 db.properties 配置文件
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

继承是基于已经存在的类构造一个新类，继承已经存在的类的方法和域。

### 1.定义子类

**extends**

```JAVA
class Student extends Person{}
```

### 2.override (覆盖)

```JAVA
// 覆盖（重写）超类的equals方法，super隐式参数可以调用父类方法。
class Student {
    @Override
    public boolean equals(Object obj) {
        return super.equals(obj);
    }
}
// 子类不能直接访问超类的私有域，必须提供访问接口。
```

### 3.super调用构造器

```JAVA
class Student {
  Student(String name,String sex,String stuID){
      super(name,sex);			//  默认调用super();
      this.stuID = stuID;
  }
}
```

**如果子类的构造器没有显示地调用超类的构造器，则默认调用超类的无参构造器。**

### 4.多态（polymorphism）

超类引用变量可以引用任意一个子类对象。

```JAVA
Person person = new Student();
```

不能将一个超类的引用赋给子类变量。（必须进行类型转换）

```JAVA
Student stu = new Person();      // Error 
```

```JAVA
Student stu = (Student) new Person();  
```

类型转换的唯一原因：在暂时忽略对象的实际类型后，使用对象的全部功能。

### 5.继承层次

由一个公共类派生出来的所有类的集合称为继承层次，从某个特定的类到其祖先的路径称为该类的继承链。

图为Collection集合继承链：

<img src="..\java\img\AbstractCollection继承层次.png" />

**java不支持多继承。**

### 6.阻断继承：final类和方法

不允许扩展的类称为**final**类。如果将一个类声明为final，其中的方法自动成为final，不包括域。

```JAVA
public final class Student{};
```

**子类不能覆盖超类中的final方法。**

**将方法或类声明为final主要目的是：确保它们不会在子类中改变语义。**

### 7.instanceof

在将超类转换成子类之前，应当用instanceof运算符检查是否可以进行类型转换。

```JAVA
Person p= new Person();
boolean b = p instanceof Student;  // b值为Error
```

### 8.抽象类

在继承层次上层的类更具有通用性，可以更加抽象。

包含一个或多个抽象方法的类必须声明为抽象类。

```JAVA
abstract class Human{ 
    public void get();   // 抽象方法不需要实现
};
```

类即使不含抽象方法，也可以将类声明为抽象类。

抽象类不能实例化。但是可以定义一个抽象类的对象引用，而它只能引用非抽象子类的对象。

### 9.受保护访问

#### 1.构造方法前的访问修饰符

| **public**    | **所有类可以 new**      |
| :------------ | :---------------------- |
| **private**   | **自己可new(单类模式)** |
| **default**   | **同一包内可new**       |
| **protected** | **对同一包内的类**      |

#### 2.访问修饰符

| **public**    | **所有类**                   | 类、变量、方法、接口     |
| :------------ | :--------------------------- | ------------------------ |
| **private**   | **自己**                     | **变量、方法**           |
| **default**   | **同一包内**                 | **类、变量、方法、接口** |
| **protected** | **对同一包内的类和所有子类** | **变量、方法**           |

### 10.Object

Object是所有类的超类。Object类型的变量可以引用任何类型的对象。

### 11.equals方法

**Object中的equals方法。用于检测一个对象是否等于另一个对象。**

特性：

1. 自反性

   ```JAVA
   x.equals(x); // 返回true
   ```

2. 对称性

   ```JAVA
   x.equals(y);
   y.equals(x);      // 返回值相同
   ```

3. 传递性

   ```JAVA
   x.equals(y);    // true
   y.equals(z);    // true
   
   x.equals(z);    // 应当返回true
   ```

4. 一致性

   如果x和y的引用对象未发生变化，反复调用equals方法返回值应当相同。

5. 对于任意的对象，x.equals(null)返回false。

***Arrays类提供的equals方法用于检测两个数组是否相等。***

```JAVA
static Boolean equals(type[] a,type[] b);    // 如果两个数组长度相同，并且对应位置上的元素也均相同，将返回true
```

### 12.hashCode方法

散列码（hash code）是对象导出的一个整型值。

```JAVA
// String 类的hashCode计算算法，字符串的散列码由内容导出
int hash = 0;
for (int i = 0;i<length();i++){
    hash = 31*hash + charAt(i);
}
```

**如果重新定义equals方法，就必须重新定义hashCode方法。**

### 13.toString方法

返回表示对象值的字符串

```JAVA
 @Override
public String toString() {
}
```

### 14.泛型数组列表

java提供ArrayList用于动态创建泛型数组。

### 15.包装器与自动装箱

包装器类为final类。在作用算时自动拆箱或装箱。

包装类对象可以与 基本数据类型直接用运算符进行运算，运算时自动拆箱为基本数据类型。

| 基本类型 | 包装器类  |
| -------- | --------- |
| int      | Integer   |
| boolean  | Boolean   |
| long     | Long      |
| float    | Float     |
| short    | Short     |
| double   | Double    |
| byte     | Byte      |
| char     | Character |

**当Integer中存储的数位于-128到127之间的short和int被包装到固定的对象中。如果通过自动装箱并且是范围在-128到127之间得到的Integer对象指向该固定的对象。通过 `new` 运算符一定是新建立的对象。**

### 16.参数可变的方法

这里的参数实际上是一个数组。

```java
// out.println 方法是一个可变参数方法
System.out.printf("%d",number);
System.out.printf("%d %f",number,number2);
```



使用可变参数设计一个筛选名字长度大于5字符的姓名。

```java
public class Test {

    // 可变参数格式：	类型...
    public static List<String> of(String... strings) {
        return Arrays.stream(strings)   	        // 将数组转换为Stream对象 
            		 .filter(s -> s.length() > 5)   // stream的filter通过给定条件过滤流中数据
            		 .collect(Collectors.toList()); // 将流转换为List集合
    }

    public static void main(String[] args) {

        List<String> list = Test.of("Turing", "Flank", "Bob", "Aim", "Alexander");
        list.forEach(System.out::println);
    }
}
```

### 17.反射

能够分析类能力的程序称为反射（reflective）。

> 反射机制可以用来：
>
> * 在运行时分析类的能力
> * 在运行时查看对象
> * 实现通用的数组操作代码
> * 利用Method对象

**java.lang.reflect**包中有三个类**Field**、**Method**和**Constructor**分别用于描述类的**public**域、方法和构造器。

#### 17.1.Class

 java运行时系统为所有的对象维护一个被称为运行时的类型标识，java的Class保存了每个类型的信息。

Object的get.Class()方法返回一个Class实例。



获取Class对象的三种方法：

1.   通过已经创建的实例

```java
Print p = new Print("print1");   // Print是一个普通类
Class<?> cls1 = p.getClass();
```

2.   通过Class静态方法*forName()*

```java
String classString = "test.com.javaSE1.fifthUnit.Print";   // classString为类的完全限定名
Class<?> cls2 = Class.forName(classString);
```

3.   通过T.Class

```java
Class<?> cls3 = Print.class;
```



> java.lang.Class 1.0
>
> * Filed[]   getFields()
>
>   返回一个包含Field对象的数组，每个对象记录了这个类或超类的共有域。
>
> * Field[]   getDeclaredFields()
>
>   返回一个包含Field对象的数组，每个对象记录了这个类的全部域。
>
> * Method[]  getMethods()
>
>   返回包含Method对象的数组，包含所有公有方法，包括从超类继承的公有方法。
>
> * Method[]  getDeclaredMethods()
>
>   包含这个类或接口的全部方法，不包括由超类继承的方法。
>
> * Constructor[]  getConstructors()
>
>   返回包含Constructor的数组，包含了Class对象描述类的所有公有构造器。
>
> * Constructor[]  getDeclaredConstructor()
>
>   返回所有构造器。



#### 17.2.Field

> getName会返回属性名
>
> getType会返回属性类型（完全限定名）

```java
Class<?> cls1 = Double.class;

Field[] fields = cls1.getFields();   // 获取Field数组
for (Field field : fields) {
    System.out.printf("Name: %-20s", field.getName());
    System.out.printf("Type: %-20s", field.getType());
    System.out.println();
}
```

#### 17.3.Method

> getName返回方法名
>
> getParameters返回方法的参数列表

```java
Class<?> cls1 = Double.class;

Method[] methods = cls1.getMethods();
for (Method method : methods) {
    System.out.printf("Name: %-22s", method.getName());
    Parameter[] parameters = method.getParameters();
    AnnotatedType annotatedReturnType = method.getAnnotatedReturnType();
    for (Parameter p : parameters) {
        System.out.printf("Parameter: %-22s ", p);
    }
    System.out.printf("ReturnType: %44s", annotatedReturnType);
    System.out.println();
}
```

#### 17.4.Constructor

构造一个对象

```java
Class<Print> printClass = Print.class;
Print print = printClass
    .getDeclaredConstructor(String.class)
    .newInstance("print1");

print.print();
```

Print类

```java
public class Print {
    private String name;
    
    public Print(String name) {
        this.name = name;
    }

    public void print() {
        System.out.println(name + " ...");
    }
}
```

#### 17.5.Modifier

Field、Method、Constructor三个类有一个getModifiers的方法，它返回一个整数值。Modifier类的静态方法用来判断修饰符的类型。

> java.lang.reflect.Modifier 1.1
>
> * static String toString(int  modifiers)
>
>   返回对应modifiers中对应的修饰符的字符串表示
>
> * static boolean isAbstract(int  modifiers)
>
> * static boolean isFinal(int  modifiers)
>
> * static boolean isInterface(int  modifiers)
>
> * static boolean isNative(int  modifiers)
>
> * static boolean isPrivate(int  modifiers)
>
> * static boolean isPublic(int  modifiers)
>
> * static boolean isProtected(int  modifiers)
>
> * static boolean isStatic(int  modifiers)
>
> * static boolean isStrict(int  modifiers)
>
> * static boolean isSynchronized(int  modifiers)
>
> * static boolean isVolatile(int  modifiers)

对包装类Double方法的修饰符显示

```java
Method[] methods = Double.class.getMethods();
for (Method m :
     methods) {
    System.out.printf("Name: %-22s",m.getName());
    System.out.printf("Modifier: %-22s",Modifier.toString(m.getModifiers()));
    System.out.println();
}
```

### 18.枚举类

枚举类都继承自Enum类，每个枚举值都是一个实例。

```java
public enum Size{ SMALL, MEDIUM, LARGE, EXTRA, EXTRA_LARGE};
```

枚举的比较用==号。

Enum类的toString方法可以将实例的类名转换为String。

```java
System.out.println(Size.SMALL.toString);
```

使用Enum类的valueOf反向生成枚举实例。

```java
Size size = Size.valueOf(Size.class, "SMALL");
```

枚举类型静态的values方法返回一个包含全部枚举值的数组。

```java
Size[] values = Size.values();
```

> java.lang.Enum<E> 5.0
>
> * static Enum valueOf(Class enumClass, String name)
>
>   返回指定名字、给定类的枚举常量
>
> * String toString()
>
>   返回枚举常量值
>
> * int  ordinal()
>
>   返回枚举常量在enum声明中的位置，位置从0开始计数
>
> * int compareTo(E  other)
>
>   如果枚举常量出现在other之前，则返回一个负值；如果this==other，则返回0；否则，返回正值。枚举常量的出现次序在enum声明中给出。

### 19.继承设计技巧

1. 将公共操作和域放在超类
2. 不要使用受保护的域
3. 使用继承实现“is-a”关系
4. 除非所有继承的方法都有意义，否则不要使用继承
5. 在覆盖方法时，不要改变预期的行为
6. 使用多态，而非类型信息
7. 不要过多的使用反射



## **第六章**

### 1.接口概念

接口不是类，而是对类的一组需求的描述。

一个类可以实现一个或多个接口。

```JAVA
// Student类实现Desc、Comparable接口
interface Desc{
    String desc();
}
class Student implements Desc,Comparable{
    @Override
    public String desc() {
        return null;
    }

    @Override
    public int compareTo(Object o) {
        return 0;
    }
}
```

接口中的所有方法自动地都属于public，不需用提供public关键字。

接口不能含有实例域。

### 2.比较器接口

#### 2.1.Comparable

Comparable接口的compareTo方法返回一个整型数值。如果两个对象不相等，则返回一个正值或负值。在想使用Arrays类的数组排序方法时，必须要实现Comparable接口。排序的规则可以通过对象的属性来指定。

```JAVA
// 通过实现compareTo方法实现以学生学号比较两个学生
class Student implements Comparable{
    @Override
     public int compareTo(Object o) {
         Student other = (Student) o;
         return this.getId()-other.getId();
     }
}
```

#### 2.2.Comparator

Comparable是排序接口，若一个类实现了Comparable接口，就意味着“该类支持排序”。而Comparator是比较器，我们若需要控制某个类的次序，可以建立一个“该类的比较器”来进行排序。

Comparable相当于“内部比较器”，而Comparator相当于“外部比较器”。

```JAVA
//实现比较器接口以学生ID排序
new Comparator<Student>() {  
            @Override
            public int compare(Student o1, Student o2) {
                return o1.getId()- o2.getId();
            }
}
```

### 3.接口特性

1. 不能实例化一个接口
2. 可以声明接口变量
3. 接口变量必须引用实现了接口的类对象
4. 接口中的域自动设为`public static final`
5. 每个类只能继承一个超类，却可以实现多个接口

### 4.接口的静态方法

javaSE 8中，允许在接口中增加静态方法。

### 5.默认方法

可以为接口提供一个默认实现，必须用default修饰符修饰。

```JAVA
interface Comparable<T>{
    default int compareTo(T other){
        return 0;
    }
}
```

### 6.对象克隆

如果希望建议一个新对象，它的初始状态与已经创建的某个对象相同，但之后会有各自的状态，就可以使用clone方法。

Object类提供了浅拷贝的clone方法。

#### 6.1.浅拷贝

只拷贝基本类型的数据域，不会拷贝引用的对象。

```JAVA
 protected Test clone() throws CloneNotSupportedException {
        return this;
 }
```

#### 6.2.深拷贝

```JAVA
protected Test clone() throws CloneNotSupportedException {
        return new Test(id,name);
}
```

### 7.lamba表达式

**形式：**

**参数，箭头(->)以及一个表达式。**

```JAVA
new TreeSet<>((Student o1,Student o2) -> o1.getId() - o2.getId());
```

无需指定lambda表达式的返回类型，lambda表达式总是会由上下文推导得出。

### 8.函数式接口

对于只有一个抽象方法的接口，需要这种接口的对象时，就可以提供一个lambda表达式。这种接口称为函数式接口。

### 9.常用函数式接口

### 10.内部类

内部类是定义在另一个类中的类。

使用内部类的原因：

1. 内部类方法可以访问该类定义所在的作用域中的数据，包括私有数据。
2. 内部类可以对同一包中的其他类隐藏起来。
3. 当想要定义一个回调函数且不想编写大量代码时，使用匿名内部类比较便捷。





## 第七章

### 1.异常分类

![](..\java\img\java异常层次简化.png)

Error类层次结构描述了java运行时系统的内部错误和资源耗尽错误。

由程序错误导致的异常属于RuntimeException。

几种RuntimeException情况：

* 错误的类型转换
* 数组访问越界
* 访问null指针

不是派生于RuntimeException的异常包括：

* 试图在文件尾部后读取数据
* 试图打开一个不存在的文件
* 试图根据给定的字符串查找Class对象，而这个字符串表示的类并不存在

​			**Java语言规法将派生于Error类或RuntimeException类的所有异常称为<font color="red">非受查异常</font>，所有其他异常称为<font color="red">受查异常</font>。**

### 2.throw

throw关键字用于抛出一个受查异常。

```JAVA
throw new ClassCastException();
```

### 3.捕获异常

```JAVA
try{
    // 捕获代码
}catch(Exception e){
    // 抛出异常
}finally{
    // 关闭资源
}
```

try语句可以只有finally子句，而没有catch子句。

### 4.使用断言

两种形式：

assert   条件；

assert    条件:表达式；

### 5.三种处理错误的机制

1. 抛出一个异常
2. 日志
3. 使用断言

### 6.记录日志





## 第八章

### 1.泛型类

泛型（Generic Programming）的实质是**类型参数化**。

类型参数使程序具有更好的可读性和安全性。

泛型类就是具有一个或多个类型变量的类。

```JAVA
public class Pair<T> {
    private T First;
    private T Second;

    public Pair() {
        this.First = null;
        this.Second = null;
    }

    public Pair(T First, T Second) {
        this.First = First;
        this.Second = Second;
    }
}

```

泛型类可以有多个参数

```JAVA
class Test<T, U> {
    private T one;
    private U two;
}
```

### 2.泛型方法

泛型方法可以定义在普通类中，也可以定义在泛型类中。

类型的变量放在修饰符的后面，放回类型的前面。

```JAVA
class ArrayAlg {
    
    public static <T> T minmax(T[] a) {
        return a[a.length / 2];
    }
}
```

### 3.类型变量的限定

```JAVA
public static <T extends Comparable> Pair<T> minmax(T[] a) {}
```

T表示是Comparable的子类型，T和绑定类型可以是类，也可以是接口。

一个类型变量或通配符可以有多个限定。限定类型用  &  隔开。

```JAVA
T extends Comparable & Serializable
```

### 4.泛型代码与虚拟机

虚拟机没有泛型类型对象，所有的类都属于普通类。

#### 4.1.类型擦除

在进入jvm之前，泛型会被擦除，变为原始类型。

原始类型用第一个限定的类型变量来替换，如果没有给定限定就用Object替换。

#### 4.2.Java泛型转换的事实

* 虚拟机中没有泛型，只有普通的类和方法
* 所有的类型参数都用它们的限定类型替换
* 桥方法被合成来保持多态
* 为保持类型的安全性，必要时插入强制类型转换

### 5.约束与局限型

不能用基本数据类型实例化类型参数。

不能实例化参数化类型的数组。java不支持泛型类型数组。

不能实例化类型变量。

```JAVA
new T(),new T[]
```

不能抛出或捕获泛型类的实例。

### 6.泛型类型继承规则

泛型类可以扩展或实现其他泛型类。

### 7.通配符类型

```JAVA
Pair<? extends Employee>
```

表示任何泛型的Pair类型。

### 8.Class

### 9.注意

1. 在java库中，E表示集合的元素类型，K和V分别表示表的关键字和值得类型。T、U、S表示任意类型。

2. 从泛型类派生子类

   * 子类也是泛型类，子类和父类的泛型类型要一致

     ```JAVA
     class Child<T> extends Parent<T>      
     ```

   * 子类不是泛型类，父类要明确泛型的参数类型

     ```JAVA
     class Child   extends Parent<String>
     ```

3. 类型擦除

   泛型是java1.5版本引进的概念，为了与之前的版本的代码兼容，泛型信息只存在于代码的编译阶段，在进入JVM之前，与泛型相关的信息会被擦除。





## 第九章

### 1.集合接口

![](.\img\集合接口继承层次.png)

### 2.实现类

#### 2.1.AbstractCollection

![](img\AbstractCollection继承层次.png)

#### 2.2.AbstractMap

![](img\AbstractMap.png)

### 3.具体集合

#### 3.1.ArrayList

**ArrayList，一种可以动态增长和缩减的索引序列。**

**由数组实现，扩容为原来的1.5倍，初始大小为10。特点：查询快，增删慢。**

```JAVA
add(int index, E element)

addAll(Collection<? extends E> c)

boolean b = arrayList.addAll(arrayList2);

addAll(int index, Collection<? extends E> c)
    
arrayList.addAll(2, arrayList2);

clear()

clone()

contains(Object o)  

ensureCapacity(int minCapacity);

forEach(Consumer<? super E> action) //  函数式接口
arrayList.forEach((T) -> System.out.print(T+" "));

get(int index)  // 返回此列表中指定位置的元素。

indexOf(Object o)  // 返回此列表中指定元素第一次出现的索引，如果此列表不包含该元素，则返回 -1。

isEmpty()   //  如果此列表不包含任何元素，则返回 true。

Iterator<E>	iterator()   // 以正确的顺序返回此列表中元素的迭代器。
//        for (Iterator<String> iterator = arrayList.iterator(); iterator.hasNext();) {
//            System.out.println(iterator.next());
//        }

int lastIndexOf(Object o)  // 返回此列表中指定元素最后一次出现的索引，如果此列表不包含该元素，则返回 -1

ListIterator<E>	listIterator()  // 返回此列表中元素的列表迭代器（以正确的顺序）
//        ListIterator<String> iterator = arrayList.listIterator();
//        for (; iterator.hasNext(); ) {
//            System.out.println(iterator.next());
//        }
//        System.out.println("---------------");
//        for (; iterator.hasPrevious(); ) {
//            System.out.println(iterator.previous());
//        }

ListIterator<E>	listIterator(int index)   // 返回此列表中元素的列表迭代器（以正确的顺序），从列表中的指定位置开始。
//        ListIterator<String> iterator = arrayList.listIterator(4);
//        for (; iterator.hasNext(); ) {
//            System.out.println(iterator.next());
//        }

E remove(int index)                   // 移除此列表中指定位置的元素。
boolean	remove(Object o)              //从此列表中删除第一次出现的指定元素（如果存在）。
boolean	removeAll(Collection<?> c)    // 从此列表中删除包含在指定集合中的所有元素。
protected void	removeRange(int fromIndex, int toIndex)   // 从此列表中删除索引在 fromIndex（包括）和 toIndex（不包括）之间的所有元素。
boolean	retainAll(Collection<?> c)    // 仅保留此列表中包含在指定集合中的元素。
E	set(int index, E element)         // 将此列表中指定位置的元素替换为指定元素。
Spliterator<E>	spliterator()         // 在此列表中的元素上创建一个后期绑定和快速失败的拆分器。
List<E>	subList(int fromIndex, int toIndex)   // 返回此列表在指定的 fromIndex（包括）和 toIndex（不包括）之间的部分的视图。
Object[]	toArray()  			      // 以正确的顺序（从第一个元素到最后一个元素）返回包含此列表中所有元素的数组。
<T> T[]	toArray(T[] a)  	     	  // 以正确的顺序（从第一个元素到最后一个元素）返回一个包含此列表中所有元素的数组；返回数组的运行时类型是指定数组的运行时类型。
void	trimToSize()                  // 将此 ArrayList 实例的容量修剪为列表的当前大小。
```

#### 3.2.LinkedList

**LinkedList，一种可以在任意位置进行高效插入和删除操作的有序序列。**

**有双向链表实现，方法ListIterator可以从前后两个方向遍历、添加、删除元素。特点：查询慢，增删快。**

```JAVA
// void	add(int index, E element)   在此列表中的指定位置插入指定元素。
        // boolean	add(E e)    将指定元素附加到此列表的末尾。
        // boolean	addAll(int index, Collection<? extends E> c)   将指定集合中的所有元素插入此列表，从指定位置开始。
        // boolean	addAll(Collection<? extends E> c)  按照指定集合的迭代器返回的顺序，将指定集合中的所有元素附加到此列表的末尾。
        // void	addFirst(E e)   在此列表的开头插入指定元素。
        // void	addLast(E e)    将指定元素附加到此列表的末尾。
        // void	clear()         从此列表中删除所有元素。
        // Object	clone()     返回此 LinkedList 的浅表副本。
        // boolean	contains(Object o)   如果此列表包含指定元素，则返回 true。
        // Iterator<E>	descendingIterator()    以相反的顺序返回此双端队列中元素的迭代器。
//        for (Iterator<String> iterator = list2.descendingIterator();iterator.hasNext();)
//            System.out.println(iterator.next());

        // E	element()   检索但不删除此列表的头部（第一个元素）。
        // E	get(int index)  返回此列表中指定位置的元素。
        // int	indexOf(Object o)      返回此列表中指定元素第一次出现的索引，如果此列表不包含该元素，则返回 -1。
        // int	lastIndexOf(Object o)  返回此列表中指定元素最后一次出现的索引，如果此列表不包含该元素，则返回 -1。
        // ListIterator<E>	listIterator(int index)        返回此列表中元素的列表迭代器（以正确的顺序），从列表中的指定位置开始
        // boolean	offerLast(E e)    在此列表的末尾插入指定的元素。
        // E	peek()          检索但不删除此列表的头部（第一个元素）。
        // E	peekLast()      检索但不删除此列表的最后一个元素，如果此列表为空，则返回 null。
        // E	poll()          检索并删除此列表的头部（第一个元素）
        // E	pollFirst()     检索并删除此列表的第一个元素，如果此列表为空，则返回 null。
        // E	pollLast()      检索并删除此列表的最后一个元素，如果此列表为空，则返回 null。
        // E	pop()           从此列表表示的堆栈中弹出一个元素。
        // void	push(E e)       将元素推送到此列表表示的堆栈上。
        // E	remove()        检索并删除此列表的头部（第一个元素）。
        // E	remove(int index)   移除此列表中指定位置的元素。
        // E	removeFirst()       从此列表中删除并返回第一个元素。
        // boolean	removeFirstOccurrence(Object o)     删除此列表中第一次出现的指定元素（从头到尾遍历列表时）。
        // E	removeLast()    移除并返回此列表中的最后一个元素。
        // boolean	removeLastOccurrence(Object o)      删除此列表中指定元素的最后一次出现（从头到尾遍历列表时）
        // E	set(int index, E element)               将此列表中指定位置的元素替换为指定元素。
        // int	size()          返回此列表中的元素数。
        // Spliterator<E>	spliterator()       在此列表中的元素上创建一个后期绑定和快速失败的拆分器。
        // Object[]	toArray()       以正确的顺序（从第一个元素到最后一个元素）返回包含此列表中所有元素的数组。
        // <T> T[]	toArray(T[] a)  以正确的顺序（从第一个元素到最后一个元素）返回一个包含此列表中所有元素的数组；返回数组的运行时类型是指定数组的运行时类型。

//        for (String s :
//                list) {
//            System.out.print(s + "  ");
//        }
```

#### 3.3.ArrayDeque

**ArrayDeque，一种用循环数组实现的双端队列。**

```JAVA
        // boolean	add(E e)    在此双端队列的末尾插入指定的元素。
        // boolean	addAll(Collection<? extends E> c)   将指定集合中的所有元素添加到此双端队列的末尾，就像在每个元素上调用 addLast(E) 一样，按照集合的迭代器返回的顺序。
        // void	addFirst(E e)   在此双端队列的前面插入指定元素。
        // void	addLast(E e)    在此双端队列的末尾插入指定的元素。
        // void	clear()         从此双端队列中删除所有元素。
        // ArrayDeque<E>	clone()         返回此套牌的副本。
        // E	element()       检索但不删除此双端队列表示的队列的头部。
        // void	forEach(Consumer<? super E> action)     对 Iterable 的每个元素执行给定的操作，直到处理完所有元素或该操作引发异常。
//        list.forEach((x) -> System.out.print(x+" "));

        // E	getFirst()      检索但不删除此双端队列的第一个元素。
        // E	getLast()       检索但不删除此双端队列的最后一个元素。
//        System.out.println(list.getFirst().equals(list.getLast()));

        // boolean	isEmpty()   如果此双端队列不包含任何元素，则返回 true。
        // Iterator<E>	iterator()      返回此双端队列中元素的迭代器。
        // boolean	offer(E e)          在此双端队列的末尾插入指定的元素。
        // boolean	offerFirst(E e)     在此双端队列的前面插入指定元素。
        // boolean	offerLast(E e)      在此双端队列的末尾插入指定的元素。
        // E	peek()                  检索但不删除此双端队列表示的队列的头部，如果此双端队列为空，则返回 null。
        // E	poll()                  检索并删除此双端队列表示的队列的头部（换句话说，此双端队列的第一个元素），如果此双端队列为空，则返回 null。
        // E	pop()                   从这个双端队列表示的堆栈中弹出一个元素。
        // void	push(E e)               将元素推送到此双端队列表示的堆栈上.
        // E	remove()                检索并删除此双端队列表示的队列的头部。
        // boolean	remove(Object o)    从此双端队列中移除指定元素的单个实例。
        // boolean	removeAll(Collection<?> c)      移除此集合的所有也包含在指定集合中的元素（可选操作）。
        // E	removeFirst()           检索并删除此双端队列的第一个元素。
        // boolean	removeFirstOccurrence(Object o)     删除此双端队列中第一次出现的指定元素（从头到尾遍历双端队列时）。
        // E	removeLast()            检索并删除此双端队列的最后一个元素。
        // boolean	removeLastOccurrence(Object o)      删除此双端队列中最后一次出现的指定元素（从头到尾遍历双端队列时）。
        // boolean	retainAll(Collection<?> c)          仅保留此集合中包含在指定集合中的元素（可选操作）。
        // int	size()                  返回此双端队列中的元素数。
        // Spliterator<E>	spliterator()               在此双端队列中的元素上创建一个后期绑定和快速失败的拆分器。
        // Object[]	toArray()           以正确的顺序（从第一个元素到最后一个元素）返回包含此双端队列中所有元素的数组。
        // <T> T[]	toArray(T[] a)      以正确的顺序（从第一个元素到最后一个元素）返回包含此双端队列中所有元素的数组；返回数组的运行时类型是指定数组的运行时类型。
```

#### 3.4.HashSet

**HashSet，一种没有重复元素的无序集合。**

```JAVA
 // boolean	add(E e)        如果指定的元素尚不存在，则将其添加到此集合中。
        // void	clear()             从此集合中移除所有元素。
        // Object	clone()             返回此 HashSet 实例的浅表副本：元素本身未被克隆。
        // boolean	contains(Object o)         如果此集合包含指定的元素，则返回 true。
        // boolean	isEmpty()       如果此集合不包含任何元素，则返回 true。
        // Iterator<E>	iterator()  返回此集合中元素的迭代器。
        // boolean	remove(Object o)    如果存在，则从此集合中删除指定的元素。
        // int	size()              返回此集合中的元素数（其基数）。
        // Spliterator<E>	spliterator()   在此集合中的元素上创建一个后期绑定和快速失败的拆分器。

//        set.forEach((x) -> System.out.println(x));

//        Object[] objects = set.toArray();
//        for (Object object : objects) {
//            System.out.println(object);
//        }
```

#### 3.5.TreeSet

**TreeSet，一种有序集。**

```JAVA

        // boolean	add(E e)        如果指定的元素尚不存在，则将其添加到此集合中。
        // boolean	addAll(Collection<? extends E> c)       将指定集合中的所有元素添加到此集合中。
        // E	ceiling(E e)        返回此集合中大于或等于给定元素的最小元素，如果没有这样的元素，则返回 null。
        // void	clear()             从此集合中移除所有元素。
        // Object	clone()         返回此 TreeSet 实例的浅表副本
        // boolean	contains(Object o)      如果此集合包含指定的元素，则返回 true。
        // Iterator<E>	descendingIterator()    按降序返回此 set 中元素的迭代器。
        // E	first()             返回此集合中当前的第一个（最低）元素。
        // E	floor(E e)          返回此集合中小于或等于给定元素的最大元素，如果没有这样的元素，则返回 null。
        // SortedSet<E>	headSet(E toElement)    返回此集合中元素严格小于 toElement 的部分的视图。
        // NavigableSet<E>	headSet(E toElement, boolean inclusive)     返回此集合中元素小于（或等于，如果 inclusive 为真）toElement 的部分的视图。
        // E	higher(E e)         返回此集合中严格大于给定元素的最小元素，如果没有这样的元素，则返回 null。
        // boolean	isEmpty()       如果此集合不包含任何元素，则返回 true。
        // Iterator<E>	iterator()  按升序返回此 set 中元素的迭代器。
        // E	last()              返回此集合中当前的最后一个（最高）元素。
        // E	lower(E e)          返回此集合中严格小于给定元素的最大元素，如果没有这样的元素，则返回 null。
        // E	pollFirst()         检索并删除第一个（最低）元素，如果此集合为空，则返回 null。
        // E	pollLast()          检索并删除最后一个（最高）元素，如果此集合为空，则返回 null。
        // boolean	remove(Object o)    如果存在，则从此集合中删除指定的元素。
        // int	size()              返回此集合中的元素数（其基数）。
        // Spliterator<E>	spliterator()   在此集合中的元素上创建一个后期绑定和快速失败的拆分器。
        // NavigableSet<E>	subSet(E fromElement, boolean fromInclusive, E toElement, boolean toInclusive)      返回此集合的一部分的视图，其元素范围从 fromElement 到 toElement。
        // SortedSet<E>	tailSet(E fromElement)  返回此集合中元素大于或等于 fromElement 的部分的视图。
        // NavigableSet<E>	tailSet(E fromElement, boolean inclusive)       返回此集合中元素大于（或等于，如果 inclusive 为真）fromElement 的部分的视图。

//        set.forEach((x) -> System.out.println(x.getName() +"  "+ x.getGrade()));
//        System.out.println("----------------------------");
//        set2.forEach((x) -> System.out.println(x.getName() +"  "+ x.getGrade()));

//        for (Child c :
//                set) {
//            System.out.println(c.getName() + "  " + c.getGrade());
//        }
```

#### 3.6.HashMap

**HashMap，一种存储键/值关联的数据结构。**

```JAVA
        // void	clear()         从此地图中删除所有映射。
        // Object	clone()     返回此 HashMap 实例的浅表副本：键和值本身没有被克隆。
        // V	compute(K key, BiFunction<? super K,? super V,? extends V> remappingFunction)       尝试计算指定键及其当前映射值的映射（如果没有当前映射，则为 null）。
        // V	computeIfAbsent(K key, Function<? super K,? extends V> mappingFunction)             如果指定的键尚未与值关联（或映射为 null），则尝试使用给定的映射函数计算其值并将其输入到此映射中，除非为 null。
        // boolean	containsKey(Object key)          如果此映射包含指定键的映射，则返回 true。
        // boolean	containsValue(Object value)      如果此映射将一个或多个键映射到指定值，则返回 true。
        // Set<Map.Entry<K,V>>	entrySet()           返回此映射中包含的映射的 Set 视图。
        // V	get(Object key)                      返回指定键映射到的值，如果此映射不包含映射，则返回 null
        // boolean	isEmpty()                        如果此映射不包含键值映射，则返回 true。
        // Set<K>	keySet()                         返回此映射中包含的键的 Set 视图。
        // V	merge(K key, V value, BiFunction<? super V,? super V,? extends V> remappingFunction)        如果指定的键尚未与值关联或与 null 关联，则将其与给定的非 null 值关联。
        // V	put(K key, V value)                  将指定的值与此映射中的指定键相关联。
        // void	putAll(Map<? extends K,? extends V> m)     将所有映射从指定映射复制到此映射。
        // V	remove(Object key)                   如果存在，则从此映射中删除指定键的映射。
        // int	size()                               返回此映射中键值映射的数量。
        // Collection<V>	values()                 返回此映射中包含的值的集合视图。

//        map.forEach((k, v) -> System.out.println(k +"  "+ v));
```

#### 3.7.TreeMap

**TreeMap，一种键/值有序排列的映射表。**

```JAVA
   // Map.Entry<K,V>	ceilingEntry(K key)         返回与大于或等于给定键的最小键关联的键值映射，如果没有这样的键，则返回 null。
        // K	ceilingKey(K key)                       返回大于或等于给定键的最小键，如果没有这样的键，则返回 null。
        // void	clear()                                 从此地图中删除所有映射。
        // Object	clone()                             返回此 TreeMap 实例的浅表副本。
        // boolean	containsKey(Object key)             如果此映射包含指定键的映射，则返回 true。
        // NavigableSet<K>	descendingKeySet()          返回此映射中包含的键的逆序 NavigableSet 视图。
        // NavigableMap<K,V>	descendingMap()         返回此映射中包含的映射的逆序视图。
        // Map.Entry<K,V>	firstEntry()                返回与此映射中的最小键关联的键值映射，如果映射为空，则返回 null。
        // K	firstKey()                              返回此映射中当前的第一个（最低）键。
        // K	floorKey(K key)                         返回小于或等于给定键的最大键，如果没有这样的键，则返回 null。
        // V	get(Object key)                         返回指定键映射到的值，如果此映射不包含该键的映射，则返回 null。
        // SortedMap<K,V>	headMap(K toKey)            返回此映射部分的视图，其键严格小于 toKey。
        // NavigableMap<K,V>	headMap(K toKey, boolean inclusive)         返回此映射部分的视图，其键小于（或等于，如果 inclusive 为真）toKey。
        // K	higherKey(K key)                        返回此地图部分的视图，其键小于（或等于，如果 inclusive 为真）toKey
        // Set<K>	keySet()                            返回此映射中包含的键的 Set 视图。
        // Map.Entry<K,V>	lastEntry()                 返回与此映射中最大键关联的键值映射，如果映射为空，则返回 null。
        // K	lastKey()                               返回此映射中当前的最后一个（最高）键。
        // Map.Entry<K,V>	lowerEntry(K key)           返回与严格小于给定键的最大键关联的键值映射，如果没有这样的键，则返回 null。
        // Map.Entry<K,V>	pollFirstEntry()            移除并返回与此映射中最小键关联的键值映射，如果映射为空，则返回 null。
        // V	put(K key, V value)                     将指定的值与此映射中的指定键相关联。
        // void	putAll(Map<? extends K,? extends V> map)        将所有映射从指定映射复制到此映射。
        // V	remove(Object key)                      如果存在，则从此 TreeMap 中删除此键的映射。
        // int	size()                                  返回此映射中键值映射的数量。
        // NavigableMap<K,V>	subMap(K fromKey, boolean fromInclusive, K toKey, boolean toInclusive)          返回此映射部分的视图，其键范围从 fromKey 到 toKey。
        // SortedMap<K,V>	subMap(K fromKey, K toKey)      返回此映射部分的视图，其键范围从 fromKey（包括）到 toKey（不包括）。
        // SortedMap<K,V>	tailMap(K fromKey)              返回此地图部分的视图，其键大于或等于 fromKey。
        // NavigableMap<K,V>	tailMap(K fromKey, boolean inclusive)       返回此映射部分的视图，其键大于（或等于，如果 inclusive 为真）fromKey。
        // Collection<V>	values()                    返回此映射中包含的值的集合视图。

//        treeMap.forEach((k, y) -> System.out.println(k +"   " + y));
```

### 4.注意

* List是一个有序集合。元素会增加到容器的特定位置。可以采用两种方式访问元素：1. 迭代器。2.整数索引。

* java语言中，所有的链表实际上都是双向链表

* 迭代器规范
  * 可以根据需要给容器附加许多迭代器，这些迭代器只能读取类表
  * 单独附加一个既能读又能写的迭代器
  
* 散列表为每一个对象计算一个整数，称为散列码。散列码是对象实例域产生的一个整数

* java中散列表用链表数组实现

* javaSE 8中，桶满时会从链表变成平衡二叉树

* 散列表太满，就需要再散列。装填因子决定何再散列。装填因子为0.75，表示75%的位置满了，就需要再散列。HashSet和HashMap可以在创建构造器时指定装填因子。

* 树集，必须是可以比较的元素类型
  * 元素类型自身实现Comparable接口
  * 为树集构造器提供一个比较器----------Comparator
  
* 树的排序必须是全序-------任意两个元素完全可比

* 双端队列不能在中间添加、删除元素，只能在头部和尾部。

* 优先队列（PrioityQueue），元素可以按任意顺序插入，按排列顺序检索

* HashMap、TreeMap散列和比较只能作用与键

* 键必须是唯一的，不能对一个键存放两个值。

* IdentityHashMap，键的散列值不是由hashcode函数计算，在两个对象进行比较时用==，而不是equals

* 类库设计者使用视图机制确保集合的线程安全，而不是实现线程安全的集合

* 视图有局限性，即可能只可以读，无法改变大小，只支持删除，而不支持插入

* 数组转集合

  ```JAVA
  HashSet<String> set = new HashSet<>(Arrays.asList(array));
  ```

* 集合转数组

  ```JAVA
  Object[] arr = set.toArray();
  ```

* Collections为集合操作实现了很多算法





## 第十章

<h3><a href="../java/java swing.md">java swing</a></h3>

## 第十一章

<h3><a href="../java/java swing.md">java swing</a></h3>

## 第十二章

<h3><a href="../java/java swing.md">java swing</a></h3>

## 第十三章

TODO



## 第十四章

### 1.进程与线程

进程拥有自己的一整套变量，而线程则共享数据。

### 2.创建线程

1. 实现Runable接口，并把它丢到Thread构造器内

   ```JAVA
   Thread t1 = new Thread(() -> {
   	int number = 0;
   	while (true) {
   		System.out.println(Thread.currentThread().getName() + "-----" + number++);
   		}
   },"frank");
   t1.start();
   ```

2. 继承Thread类并重写run方法

   ```JAVA
   class MyThread extends Thread {
       @Override
       public void run() {
           int number = 0;
           while (true) {
               System.out.println(Thread.currentThread().getName() + "-----" + number++);
           }
       }
   
       public static void main(String[] args) {
           Thread t2 = new MyThread();
           t2.setName("turing");
           t2.start();
       }
   }
   ```

3. 实现Callable接口

   ```JAVA
   class MyCall implements Callable<String>{
       @Override
       public String call() throws Exception {
           int number = 0;
               System.out.println(Thread.currentThread().getName() + "-----" + number++);
           return "success";
       }
   
       public static void main(String[] args) {
           new Thread(new FutureTask<String>(new MyCall()),"bob").start();
       }
   }
   ```

### 3.中断线程

**当线程的run方法执行方法体最后一条语句后，并经由执行return语句返回时，或者出现了方法中没有捕获的异常时，线程终止。**

interrupt方法可以用来请求终止线程。

静态的Thread.currentThread方法获取当前线程，然后调用isInterrupt方法判断线程是否中断。

如果线程阻塞，就无法检测中断状态。

### 4.线程状态

#### 4.1.线程6态

- New（新创建）
- Runable（可运行）
- Blocked（被阻塞）
- Waiting（等待）
- Time Waiting（计时等待）
- Terminated（被终止）

一个可运行的线程可能正在运行也可能没有运行，这取决于OS给线程提供的时间。

线程调度的细节依赖与OS。

当线程处于被阻塞或等待状态时，它暂时不活动。它不运行任何代码且消耗最少的资源。直到线程调度器重新激活它。细节取决于它是怎么达到非活动状态的。

<img src="img\线程转换.png" />

### 5.线程属性

#### 5.1.优先级

java语言中，每个线程都有一个优先级。默认境况下，一个线程继承它父线程的优先级。

使用setPriority方法设置优先级（1~10）。

线程的优先级高度依赖与操作系统。

#### 5.2.守护线程

守护线程的唯一用途是为其他线程提供服务。当只剩下守护线程时，虚拟机就退出了。

### 6.同步



[".\img\目录结构.png"]:
