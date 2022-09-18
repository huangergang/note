# Java核心技术1

## 主体内容

<img src="..\java\img\目录结构.png" />

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

```JAVA
System.out.printf("%d",number);
System.out.printf("%d %f",number,number2);
```

使用可变参数设计一个筛选名字长度大于5字符的姓名。

```java
public class Test {

    public static List<String> of(String... strings) {
        return Arrays.stream(strings).filter(s -> s.length() > 5).collect(Collectors.toList());
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

>  获取Class对象的三种方法：
>
> 1. 通过已经创建的实例
>
>     ```JAVA
>     Print p = new Print("print1");   // Print是一个普通类
>     Class<?> cls1 = p.getClass();
>     ```
>
> 2. 通过Class静态方法*forName()*
>
>    ```java
>    String classString = "test.com.javaSE1.fifthUnit.Print";   // classString为类的完全限定名
>    Class<?> cls2 = Class.forName(classString);
>    ```
>
> 3. 通过T.Class
>
>    ```java
>    Class<?> cls3 = Print.class;
>    ```

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
 new TreeSet<>((Student o1,Student o2)-> o1.getId()-o2.getId());
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

**Java语言规法将派生于Error类或RuntimeException类的所有异常称为<font color="red">非受查异常</font>，所有其他异常称为<font color="red">受查异常</font>。**

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

泛型（Generic Programming）的实质是类型参数化。

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
        return a[a.length/2];
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

![](C:\Users\莫\Desktop\note\java\img\集合接口继承层次.png)

### 2.实现类

#### 2.1.AbstractCollection

![](..\java\img\AbstractCollection继承层次.png)

#### 2.2.AbstractMap

![](..\java\img\AbstractMap.png)

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

<img src="..\java\img\线程转换.png" />

### 5.线程属性

#### 5.1.优先级

java语言中，每个线程都有一个优先级。默认境况下，一个线程继承它父线程的优先级。

使用setPriority方法设置优先级（1~10）。

线程的优先级高度依赖与操作系统。

#### 5.2.守护线程

守护线程的唯一用途是为其他线程提供服务。当只剩下守护线程时，虚拟机就退出了。

### 6.同步

