# JSP

## 1.基础语法

### 1.1.简介

​		JSP: Java Server Page SUN公司提供的动态网页编程技术，是Java Web服务器端的动态资源。

​		它相比html而言，html 只能为用户提供静态数据，而Jsp技术允许在页面中嵌套java代码,为用户提供动态数据。
​		相比servlet而言，servlet 很难对数据进行排版，而jsp除了可以用java代码产生动态数据的同时，也很容易对数据进行排版。
​		不管是JSP还是Servlet,虽然都可以用于开发动态web资源。但由于这2门技术各自的特点，在长期的软件实践中，人们逐渐把servlet作为web应用中的控制器组件来使用，而把JSP技术作为数据显示模板来使用。
​		其实Jsp就是一个 Servlet,当我们第一次访问Jsp的时候，Jsp引擎都会将这个Jsp翻译成一个Servlet，这个文件存放在tomcat (源码目录)中的work目录中。

### 1.2.注释

```JSp
// 单行注释      /* 多行注释 */

<!-- HTML风格注释  能够被客户端查看-->   

<%-- JSP注释    --%>
```

### 1.3.Scriptlet

**JSP嵌入java代码的方式。**

第一种：

```JSP
<%     %>   : java脚本段，可以定义局部变量，编写语句     嵌入在service方法中
```

第二种：

```JSP
<%!    %>    : 声明，可以定义全局（成员）变量、方法、类  嵌入在servlet方法中
```

第三种：

```JSP
<%=    %>    : 表达式，数据一个变量或具体内容
```

## 2.JSP的指令标签

### 2.1.include静态包含

包含一些重复的页面。

```JSP
<%@include   file="url" %>
```

**注意静态包含只生成一个源码文件，不能定义重复的变量、方法、类。**

### 2.2.include动态包含

```JSP
<jsp:include page="url"></jsp:include>
```

**生成多个源码文件，效率高、耦合度底。相当于方法的调用。可以定义同名变量。**

* 无参数传递时jsp:include标签之间不能出现任何符号。

* 参数传递

  page、value支持表达式

  ```JSP
  <jsp:include page="url">
      <jsp:param name="" value=""/>
      <jsp:param name="" value=""/>
  </jsp:include>
  ```

## 3.JSP四大域对象

### 3.1.四种属性范围

1. page范围

   pageContext：只在一个页面中保持属性，跳转后无效

2. request范围

   request：只在一次请求中保存，服务器跳转后依然有效

3. session范围

   session：在一次会话范围中，无论何种跳转都可以使用

4. application范围

   application：在整个服务器上保存

## 4.EL表达式

### 4.1.语法

El表达式操纵域对象，简化JSP代码。

```JSP
${}
```

操作范围

从小到大，如果未找到，为空字符串

**获取指定范围：**

```JSP
${pageScope.name}
${requestScope.name}
${sesionScope.name}
${applicationScope.name}
```

### 4.2.使用

获取集合

```JSP
${list.size()}
${list[index]}
```

获取map

```JSP
${map.key}
${map["key"]}
```

获取javabean     **必须提供get方法**

```JSP
${user}
${user.name}
```

判断域对象为空，为空字符串、null、集合size为0返回true，反之返回true

```JSP
${empty str}
```

# JSTL

jsp标准标签库

**1.核心标签库**

包括Web应用的常见工作，比如：循环、表达式赋值、基本输入输出等。

**2.格式化标签库**

格式化显示数据的工作，比如：对不同区域日期格式化等。

此时需要两个jar包

jstl.jar

standard.jar

下载地址

http://archive.apache.org/dist/jakarta/taglibs/standard/binaries/









