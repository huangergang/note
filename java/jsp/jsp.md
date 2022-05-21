# JSP

## 1.基础语法

### 1.1.简介

​		**JSP**（全称**J**akarta **S**erver **P**ages，曾称为**J**ava**S**erver **P**ages）是由[Sun Microsystems](https://zh.m.wikipedia.org/wiki/Sun_Microsystems)公司主导建立的一种动态网页技术标准。JSP部署于网络服务器上，可以响应客户端发送的请求，并根据请求内容动态地生成[HTML](https://zh.m.wikipedia.org/wiki/HTML)、[XML](https://zh.m.wikipedia.org/wiki/XML)或其他格式文档的[Web](https://zh.m.wikipedia.org/wiki/Web)网页，然后返回给请求者。JSP技术以[Java](https://zh.m.wikipedia.org/wiki/Java)语言作为[脚本语言](https://zh.m.wikipedia.org/wiki/脚本语言)，为用户的[HTTP](https://zh.m.wikipedia.org/wiki/HTTP)请求提供服务，并能与服务器上的其它Java程序共同处理复杂的业务需求。

​		jsp就是一个servlet，servlet写后端，jsp写页面。

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









