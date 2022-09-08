# JSP

## 1. 基础语法

### 1.1. 简介

​		JSP：Java Server Page SUN 公司提供的动态网页编程技术，是 Java Web 服务器端的动态资源。

​		它相比 html 而言，html 只能为用户提供静态数据，而 Jsp 技术允许在页面中嵌套 java 代码,为用户提供动态数据。
​		相比servlet而言，servlet 很难对数据进行排版，而jsp除了可以用java代码产生动态数据的同时，也很容易对数据进行排版。
​		不管是 JSP 还是 Servlet ,虽然都可以用于开发动态 web资源。但由于这2门技术各自的特点，在长期的软件实践中，人们逐渐把 servlet 作为web 应用中的控制器组件来使用，而把JSP技术作为数据显示模板来使用。
​		其实Jsp就是一个 Servlet ,当我们第一次访问 Jsp 的时候，Jsp 引擎都会将这个Jsp翻译成一个 Servlet，这个文件存放在 tomcat (源码目录)中的 work 目录中。

### 1.2. 注释

在JSP中支持两种注释的语法操作:

​		一种是显示注释，这种注释是允许客户端看见的；另一种是隐式注释，此种注释是客户端无法看见的

​		①显示注释语法:从HTML风格继承而来

​		②隐式注释语法:从JAVA风格继承；JSP 自己的注释



```jsp
// 单行注释      /* 多行注释 */

<!-- HTML风格注释  能够被客户端查看-->   

<%-- JSP注释    --%>
```



### 1.3. Scriptlet

​		在JSP中最重要的部分就是Scriptlet **( 脚本小程序)，所有嵌入在HTML代码中的Java程序**

​		在JSP中一共有三种Scriptlet代码：**都必须使Scriptlet标记出来**



**JSP嵌入java代码的方式。**

第一种：

```JSP
<%     %>   : java脚本段，可以定义局部变量，编写语句嵌入在service方法中
```

第二种：

```JSP
<%!    %>   : 声明，可以定义全局（成员）变量、方法、类嵌入在servlet方法中
```

第三种：

```JSP
<%=    %>   : 表达式，数据一个变量或具体内容
```

## 2. JSP的指令标签

​		使用包含操作，可以将一些重复的代码包含进来继续使用， 从正常的页面组成来看，有时可能分为几个区域。而其中的一-些区域可能是一直不需要改变的， 改变的就其中的一一个具体内容区域。现在有两种方法可以实现上述功能。

​		方法一：在每个JSP页面(HTML) 都包含工具栏、头部信息、尾部信息、具体内容

​		方法二：将工具栏、头部信息、尾部信息都分成各个独立的文件,使用的时候直接导入

​		很明显，第二种方法比第一种更好,第- -种会存在很多重复的代码，并且修改很不方便,在JSP中如果要想实现包含的操作，有两种做法：**静态包含、动态包含**，静态包含使用include指令即可，动态包含则需要使用include动作签。

### 2.1. include静态包含

包含一些重复的页面。

```JSP
<%@include file="要包含的文件路径" %> <!-- 相对路径 -->
```

例如：

```jsp
<%@include file="include.jsp" %>
或
<%@include file="include.html" %>
```

​		静态包含就是将内容进行了直接的替换,就好比程序中定义的变量一样是在 servlet 引擎转译时，就把此文件内容包含了进去(两个文件的源代码整合到一起，全部放到jspService 方法中)，所以只生成了一个 servlet，所以两个页面不能有同名的变量。运行效率高一点点。耦合性较高，不够灵活。



### 2.2. include动态包含

​		动态包含在代码的编译阶段，包含和被包含部分是两个独立的部分，只有当运行时，才会动态包含进来，好比方法的调用。

```jsp
<jsp:include page="include. jsp"></jsp:include>
```

**注意**：动态包含，**中间不要加任何内容**，包括空格，除非确认要使用参数,否则报错!

```jsp
<jsp:include page="include . html"></jsp:include>
<%
String a = "hello.jsp";
%>
<jsp:include page="<%=a %>"></jsp:include>
```

使用动态包含还可以通过在页面之间传参。

接收参数通过 **request.getParameter(name);** 

**生成多个源码文件，效率高、耦合度底。相当于方法的调用。可以定义同名变量。**

* 无参数传递时jsp:include标签之间不能出现任何符号。

* 参数传递

  

  ```JSP
  <!-- 设置参数，此参数可以传递-->
  <jsp:include page="url">
      <jsp:param name="" value=""/>
      <jsp:param name="" value=""/>
  </jsp:include>
  ```



## 3. JSP四大域对象

### 3.1. 四种属性范围

​		在JSP中提供了四种属性的保存范围，所谓的属性保存范围，指的就是一个设置的对象，可以再多少个页面中保存并可以继续使用。

1. page范围

   pageContext：只在一个页面中保持属性，跳转后无效

2. request范围

   request：只在一次请求中保存，服务器跳转后依然有效

3. session范围

   session：在一次会话范围中，无论何种跳转都可以使用

4. application范围

   application：在整个服务器上保存

| 方法                                                | 类型 | 描述                 |
| --------------------------------------------------- | ---- | -------------------- |
| **public void setAttribute(String name, Object o)** | 普通 | 设置属性的名称及内容 |
| **public Object getAttribute(String name)**         | 普通 | 根据属性名称取属性   |
| **public void removeAttribute(String name)**        | 普通 | 删除指定的属性       |



## 4. EL表达式的使用

### 4.1. EL表达式的语法

​		EL (Expression Language)是为了使JSP写起来更加简单。表达式语言的灵感来自于ECMAScript和XPath表达式语言，它提供了在JSP中简化表达式的方法，让Jsp的代码更加简化。

```jsp
语法结构非常简单: ${expression}
```

​		EL表达式一般操作的都是域对象中的数据，操作不了局部变量。

​		域对象的概念在JSP中一共有四个: **pageContext，request，session，application;**范围依次是，**本页面，一次请求，一次会话，整个应用程序。**

​		当需要指定从某个特定的域对象中查找数据时可以使用四个域对象对应的空间对象，分别是: pageScope，requestScope，sessionScope, applicationScope。

​		**而EL默认的查找方式为从小到大查找，找到即可。当域对象全找完了还未找到则返回空字符串""。**


El表达式操纵域对象，简化JSP代码。

```JSP
${域对象名称}
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

### 4.2. 使用

#### 4.2.1. 获取数据

**设置域对象中的数据**

```jsp
<%
pageContext.setAttri bute ("uname" , "zhangsan"); // page作用域
request.setAttri bute("uname"，"lisi"); // request作用域
session.setAttri bute("uname" , "wangwu"); // session作用域
application.setAttribute("uname"，" zaholiu"); // application
%>
```

**获取域对象的值**

```jsp
<%--获取域对象中的数据:默认查找方式为从小到大，找到即止。若四个范围都未找到，则返回空字符串。--%>
${uname} <!-- 输出结果为: zhangsan -->
```

**获取指定域对象的值**

```jsp
${pageScope.uname}
<!-- page作用域-->
${ requestScope.uname}
<!-- request作用域 -->
${sessionScope.uname }
<!-- session作用域-->
$ {app1icationScope.uname}
<!-- applicati on作用域-->
```

**获取集合**

```JSP
${list.size()}
${list[index]}
```

**获取map**

```JSP
${map.key}
${map["key"]}
```

**获取javabean**     **必须提供get方法**

```JSP
${user}
${user.name}
```

#### 4.2.2. empty

```jsp
<%-- 
    empty
		判断域对象是否为空。为空，返回true;不为空返回false;
			${empty限域变量名}
		判断对象是否不为空。
			${! empty限域变量名}
--%>

${empty uname}
${empty 1ist}
${empty map}
${empty user} 
```

#### 4.2.3. EL运算

```jsp
<%
request.setAttribute("a"，10);
request.setAttribute("b"，2);
request.setAttribute("c"，"aa");
request.setAttribute("d"，"bb");
%>
```



​	判断域对象为空，为空字符串、null、集合size为0返回true，反之返回true

```JSP
${empty str}
```



# JSTL

## 1.标签的使用

​		Java Server Pages Standard Tag Libray(JSTL)：JSP 标准标签库，是一个定制标签类库的集合，用于解决一些常见的问题，例如迭代一个映射或者集合、 条件测试、XML处理，甚至数据库和访问数据库操作等。

​		我们现在只讨论JSTL中最重要的标签，迭代集合以及格式化数字和日期几个标签。

​		**核心标签库:**
​				http://java.sun.com/jsp/jstl/core

​				包含Web应用的常见工作，比如:循环、表达式赋值、基本输入输出等。

​		**格式化标签库:**
​		http://java.sun.com/jsp/jstl/fmt

​				用来格式化显示数据的工作，比如:对不同区域的日期格式化等。



​	为了在JSP页面使用JSTL类库,必须以下列格式使用 taglib 指令:
```jsp
<%@taglib uri="" prefix="" %>
```

​	例如:
```jsp
<%@taglib uri ="http://java.sun.com/jsp/jst1/core" prefix="c" %>
```

​	前缀可以是任意内容,遵循规范可以使团队中由不同人员编写的代码更加相似；所以，建议使用事先设计好的前缀。

此时需要导入两个jar包
**jstl.jar**
**standard.jar**
从Apache的标准标签库中下载的二进包(jakarta-taglibs-standard-current.zip)。 

​		官方下载地址: http://archive.apache.org/dist/jakarta/taglibs/standard/binaries/

​		下载jakarta-taglibs-standard-1.1.2.zip 包并解压，将 **jakarta-taglibs-standard-1.1.2/lib/** 下的两个 jar文件: **standard.jar** 和 **jstl.jar** 文件拷贝到项目的指定目录下。

## 2.条件动作标签

​		条件动作指令用于处理页面的输出结果依赖于某些输入值的情况，在Java中是利用if、f..else 和switch语句来进行处理的。在JSTL中也有4不标签可以执行条件式动作指令: if、choose、 when和otherwise。

### 2.1. if 标签

​		if标签先对某个条件进行测试，如果该条件运算结果为true, 则处理它的主体内容,测试结果保存在一-个Boolean对象中，并创建一个限域变量来引用Boolean对象。可以利用var属性设置限域变量名,利用scope属性来指定其作用范围。

#### 2.2.1.1. 语法格式

```jsp
<c:if test="<boolean>" var="<string>" scope="<string>">
</c:if> 
```

#### 2.2.1.2. 属性

### 2.2. choose、when和otherwise标签

​		choose和when标签的作用与Java中的switch和case关键字相似，用于在众多选项中做出选择。也就是说:  他们为相互排斥的条件式执行提供相关容。
​		switch语句中有case,而choose标签 中对应有when, switch语句中有default, 而choose标签中有otherwise。

#### 3.2.2.1.语法格式

```jsp
<c:choose>
    <c:when test=" <boolean>">
    </c:when>
    <c:when test="<boolean>">
    </c:when>
    <c:otherwise>
    </c:otherwise>
</c:choose>
```

```jsp
<%
    // 设置变量
    request.setAttribute("grade", 100);
%>
<c:choose>
    <c:when test="${60<= grade && grade <70}">
        及格！还需努力！
    </c:when>
    <c:when test="${70<= grade && grade<80}">
        良好！还需努力！
    </c:when>
    <c:when test="${80<= grade && grade<100}">
        优秀！，你真棒！
    </c:when>
    <c:otherwise>
        不及格！到我办公室一趟！！！
    </c:otherwise>
</c:choose>
```

### 2.3. 迭代标签

​		forEach是将一个主体内容迭代多次， 或者迭代一个对象集合。可以迭代的对象包括所有的java.util.Collection和java.util.Map接口的实现，以及对象或者基本类型的数组。他还可以迭代java.uti.terator和java.util.Enumeration,但不能在多个动作指令中使用Iterator或者Enumeration,因为Iterator或者Enumeration都不能重置(reset) 。各属性含义如下:

#### 3.3.1. forEach标签

##### 3.3.1.1.语法格式

```jsp
<c:forEach
items=" <object>"
begin="<int>"
end="<int>”
step="<int>""
var="<string>'
varStatus="<string>">
</c:forEach>
```

