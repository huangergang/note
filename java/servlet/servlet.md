# Servlet

**Servlet**（Server Applet），全称**Java Servlet**。是用[Java](https://zh.m.wikipedia.org/wiki/Java)编写的[服务器](https://zh.m.wikipedia.org/wiki/服务器)端[程序](https://zh.m.wikipedia.org/wiki/程序)。其主要功能在于交互式地浏览和修改数据，生成动态[Web](https://zh.m.wikipedia.org/wiki/Web)内容。狭义的Servlet是指Java语言实现的一个[接口](https://zh.m.wikipedia.org/wiki/接口)，广义的Servlet是指任何实现了这个Servlet接口的[類別](https://zh.m.wikipedia.org/wiki/类_(计算机科学))，一般情况下，人们将Servlet理解为后者。Servlet运行于支持Java的[应用服务器](https://zh.m.wikipedia.org/wiki/应用服务器)中。从实现上讲，Servlet可以响应任何类型的请求，但绝大多数情况下Servlet只用来扩展基于[HTTP](https://zh.m.wikipedia.org/wiki/HTTP)[协议](https://zh.m.wikipedia.org/wiki/协议)的[Web服务器](https://zh.m.wikipedia.org/wiki/Web服务器)。

## 1. tomcat

### 1.1. 说明

**Tomcat**是由Apache软件基金会属下[Jakarta项目](https://zh.m.wikipedia.org/wiki/Jakarta项目)开发的[Servlet](https://zh.m.wikipedia.org/wiki/Servlet)容器，按照[Sun Microsystems](https://zh.m.wikipedia.org/wiki/Sun_Microsystems)提供的技术规范，实现了对[Servlet](https://zh.m.wikipedia.org/wiki/Servlet)和[JavaServer Page](https://zh.m.wikipedia.org/wiki/JavaServer_Page)（[JSP](https://zh.m.wikipedia.org/wiki/JSP)）的支持，并提供了作为Web服务器的一些特有功能，如Tomcat管理和控制平台、安全域管理和Tomcat阀等。由于Tomcat本身也内含了[HTTP](https://zh.m.wikipedia.org/wiki/HTTP)[服务器](https://zh.m.wikipedia.org/wiki/服务器)，因此也可以视作单独的[Web服务器](https://zh.m.wikipedia.org/wiki/Web服务器)。但是，不能将Tomcat和[Apache HTTP服务器](https://zh.m.wikipedia.org/wiki/Apache_HTTP服务器)混淆，[Apache HTTP服务器](https://zh.m.wikipedia.org/zh-hans/Apache_HTTP_Server)是用C语言实现的HTTP[Web服务器](https://zh.m.wikipedia.org/wiki/Web服务器)；这两个HTTP web server不是捆绑在一起的。Apache Tomcat包含了配置管理工具，也可以通过编辑XML格式的配置文件来进行配置。

tomcat是一个servlet容器。封装了request和response对象。通过这两个对象实现从页面获取表单提交的数据以及向页面输出数据。

### 1.2. 使用

#### 1.2.1. 安装

解压官网zip文件。https://downloads.apache.org/tomcat/tomcat-9/v9.0.63/bin/apache-tomcat-9.0.63.zip.asc

#### 1.2.2. 启动

进入tomcat的bin目录运行startup.sh脚本启动。

#### 1.2.3. 关闭

进入tomcat的bin目录运行shutdown.sh脚本关闭。

#### 1.2.4. 检验是否启动成功

浏览器地址栏输入<http://localhost:8080>，tomcat默认端口为8080，改端口在conf目录下的server.xml文件中修改。

#### 1.2.5. 引入

往项目中引入lib目录下的servlet-api-3.0.1以及jsp-api文件。

## 2. servlet实现

### 2.1. 继承HttpServlet

```JAVA

public class HelloServlet extends HttpServlet {
    
}
```

### 2.2.重写service方法

```java
```



## 3. HttpServletRequset

### 3.1. 常用方法

| 方法             | 作用                        |
| ---------------- | --------------------------- |
| getRequestURL()  | 获取客户端发送请求的完整URL |
| getRequestURI()  | 获取请求行中的资源名称部分  |
| getQueryString() | 获取请求行中的参数部分      |
| getMethod()      | 获取客户端请求方式          |
| getProtocol()    | 获取HTTP版本号              |
| getContextPath() | 获取webapp名字              |

### 3.2. 获取请求参数

| 方法                       | 作用                     |
| -------------------------- | ------------------------ |
| getParameter("name")       | 获取指定名称的参数       |
| getParameterValues("name") | 获取指定名称参数的所有值 |

### 3.3. 请求乱码

方式一：

```java
request.setCharactorEnconding("utf-8");  // 只针对post请求
```

方式二：

```JAVA
new String(request.getParameter("name").getBytes("ISO-8859-1"),"UTF-8");
```

### 3.4. 请求转发

请求转发，是一种服务器的行为，当客户端请求到达后，服务器进行转发，此时会将请求对象进行保存，地址栏中的URL不会改变，得到响应后，服务器在将响应发送给客户端，从始至终只有一个请求发出。

可以跳转到servlet或jsp。

```JAVA
request.getRequestDispatcher(url).forward(request,response);
```

### 3.5. requset作用域

```JAVA
// 设置作用域
request.setAttribute(String name,Object value);
// 获取域对象内容
request.getAttribute(String name);
// 删除对象内容
request.removeAttribute(String name);
```

## 4. HttpServletResponse

### 4.1. 响应数据

响应数据需要获取输出流。

有两种形式：

​			**getWrite()**    获取字符流（只能响应返回字符）

​            **getOutputStream()**     获取字节流（能响应一切数据）

两种流不可以同时使用。

### 4.2. 响应乱码

**服务端设置：**

```JAVA
response.setCharacterEncoding("UTF-8");
```

**客户端设置：**

```JAVA
response.setHeader("content-type","text/html;charset=UTF-8");
```

**设置客户端和服务端编码保持一致。**

**同时设置：**

```JAVA
response.setContentType("text/html;charset=UTF-8");
```

### 4.3. 重定向

重定向是一种服务器指导，客户端的行为。

存在两次请求。(request和response不共享)

```JAVA
response.sendRedirect(url)
```

### 4.4. 请求转发和重定向区别

| 请求转发                        | 重定向                          |
| ------------------------------- | ------------------------------- |
| 一次请求，数据在request域中共享 | 两次请求，requset域中数据不共享 |
| 服务器行为                      | 客户端行为                      |
| 地址栏不发生变化                | 地址栏发生变化                  |
| 绝对地址定位到站点后            | 绝对地址可以写到http://         |

## 5. Cookie

提高网络传输效率，减少服务端负载。浏览器技术。

### 5.1. Cookie的创建和发送

```JAVA
Cookie cookie= new Cookie("name","value");

response.addCookie(cookie);
```

### 5.2. Cookie获取

返回Cookie数组

```JAVA
Cookie[] cookies = request.getCookies();
```

### 5.3. Cookie设置到期时间

到期时间的取值：

* 负整数，表示不存储该Cookie
* 正整数，若大于0，表示存储的秒数
* 0，表示删除该Cookie

设置Cookie指定时间后失效 

```JAVA
cookie.setMaxAge(30); // 存活30秒

response.addCookie(cookie);
```

### 5.4. 注意

1. Cookie保存在当前浏览器中。

2. Cookie存在中文问题

   Cookie中不能出现中文，如果有中文则通过URLEncoder.encode()进行编码。解码URLEncoder.dencode()。

3. 同名Cookie

   重复的Cookie会覆盖

4. 浏览器限制Cookie的数量

   Cookie大小在4kb之内比较合适

### 5.5. Cookie路径

```JAVA
cookie.setPath("/");   //任意项目都可访问
cookie.setPath("/ser01");  // 指定项目，默认是当前项目
cookie.setPath("/ser02/cook"); // 当前项目的指定目录
```

## 6. HttpSession

会话保持连接一定时间的。获取多次请求。

### 6.1. 获取session对象

若存在则获取，若不存在则创建Session对象。

```JAVA
HttpSession session = request.getSession();
```

获取唯一标识符

```JAVA
session.getId();
```

### 6.2. session域对象

```JAVA
session.setAttrbute(String name,Object value);
session.getAttrbute(String name);
session.removeAttrbute(String name);
```

### 6.3. session对象的销毁

1. tomcat默认到期时间为30分钟

   在tomcat服务器的web.xml中修改配置

2. 手动设置

   ```JAVA
   int s = session.getMaxInactiveIntvrval(); // 获取存活最大时间
   ession.setMaxInactiveIntvrval(); // 设置最大存活时间
   ```

3. 立即销毁

   ```JAVA
   session.invalidate();
   ```

4. 关闭浏览器失效

5. 关闭服务器失效

## 7. ServletContext

### 7.1. 获取对象

```JAVA
// 通过request获取
ServletContext s = request.getServletContext(); 

// 通过session对象获取
ServletContext s1 = request.getSession().getServletContext(); 

ServletContext s2 = getServletConfig().getServletContext();

// 直接获取
ServletContext s3 = getServletContext();
```

### 7.2. 常用方法

```JAVA
// 获取服务器版本信息
String info = request.getServletContext().getServerInfo();
// 获取项目真实路径
String path = request.getServletContext().getRealPath("/");
```

### 7.3. 域对象

不建议使用

## 8. 文件上传和下载

### 8.1. 文件上传

前台页面

```HTML
<form method="post" enctype="multipart/form-data" action="">
    文件： <input type="file" name="file">
    <button>提交</button>
</form>
```

后台接收

在servlet上加注解@MultipartConfig，将前台的post封装成Part对象。

1.获取Part对象

```JAVA
Part part = request.getPart("fileName");
```

2.获取文件名

```JAVA
String fileName = part.getSubmittedFilename();
```

3.得到存储路径

```JAVA
String path = request.getServletContext().getRealPath("/");
```

4.上传文件到指定目录

```JAVA
part.write(path+"/"+fileName);
```

### 8.2. 文件下载

1.超链接下载

```HTML
<a href="url"></a>  <!-- 浏览器不能识别的资源-->
<a href="url" download="下载文件名"></a>  <!-- 浏览器能识别的资源-->
```

2.代码实现下载

io流

```JAVA
request.getPar
```





































