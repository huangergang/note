# Servlet

**Servlet**（Server Applet），全称**Java Servlet**。是用[Java](https://zh.m.wikipedia.org/wiki/Java)编写的[服务器](https://zh.m.wikipedia.org/wiki/服务器)端[程序](https://zh.m.wikipedia.org/wiki/程序)。其主要功能在于交互式地浏览和修改数据，生成动态[Web](https://zh.m.wikipedia.org/wiki/Web)内容。狭义的Servlet是指Java语言实现的一个[接口](https://zh.m.wikipedia.org/wiki/接口)，广义的Servlet是指任何实现了这个Servlet接口的[類別](https://zh.m.wikipedia.org/wiki/类_(计算机科学))，一般情况下，人们将Servlet理解为后者。Servlet运行于支持Java的[应用服务器](https://zh.m.wikipedia.org/wiki/应用服务器)中。从实现上讲，Servlet可以响应任何类型的请求，但绝大多数情况下Servlet只用来扩展基于[HTTP](https://zh.m.wikipedia.org/wiki/HTTP)[协议](https://zh.m.wikipedia.org/wiki/协议)的[Web服务器](https://zh.m.wikipedia.org/wiki/Web服务器)。

## 1. tomcat

### 1.1.什么是Tomcat

​		Tomcat是一个符合JavaEE WEB标准的最小的WEB容器，所有的JSP程序- -定要有 WEB容器的支持才能运行，而且在给定的WEB容器里面都会支持事务处理操作。
​		Tomcat 是由 Apache 提供的(www.apache.org) 提供的可以用安装版和解压版，安装版可以在服务中出现一个 Tomcat 的服务，免安装没有,开发中使用免安装版。Tomcat 简单的说就是一个运行Java 的网络服务器,底层是Socket的一个程序，它也是 JSP 和 Servlet的一一个容器。Tomcat 是Apache软件基金会 (Apache Software Foundation) 的 Jakarta 项目中的一个核心项目，由Apache、Sun 和其他一些公司及个人共同开发而成。
​		由于有了 Sun 的参与和支持，最新的 Servlet 和 JSP 规范总是能在 Tomcat 中得到体现。因为 Tomcat 技术先进、性能稳定，而且免费，因而深受 Java 爱好者的喜爱并得到了部分软件开发商的认可，成为目前比较流行的
Web应用服务器。
​		Tomcat 服务器是一个免费的开放源代码的Web应用服务器，属于轻量级应用服务器，在中小型系统和并发访问用户不是很多的场合下被普遍使用，是开发和调试JSP程序的首选。对于一个初学者来说，可以这样认为,当在一台机器上配置好 Apache 服务器，可利用它响应 HTML (标准通用标记语言下的一-个应用)页面的访问请求。实际上 Tomcat 部分是 Apache 服务器的扩展,但它是独立运行的，所以当你运行tomcat时，它实际上作为一个与 Apache 独立的进程单独运行的。
​		当配置正确时，Apache 为HTML页面服务，而Tomcat实际上是在运行JSP页面和 Servlet。另外，Tomcat和 IIS 等 Web 服务器一样，具有处理HTML页面的功能，另外它还是-一个 Servlet 和 JSP 容器，独立的 Servlet 容器是Tomcat的默认模式。不过, Tomcat 处理静态 HTML 的能力不如 Apache 服务器。目前 Tomcat 最新版本为9.0。

### 1.2. 使用

#### 1.2.1. 安装

解压官网zip文件。

https://downloads.apache.org/tomcat/tomcat-9/v9.0.63/bin/apache-tomcat-9.0.63.zip.asc

#### 1.2.2. 启动

进入tomcat的bin目录运行startup.sh 脚本启动。

#### 1.2.3. 关闭

进入tomcat的bin目录运行shutdown.sh 脚本关闭。

#### 1.2.4. 检验是否启动成功

浏览器地址栏输入<http://localhost:8080>，tomcat默认端口为8080，改端口在conf目录下的server.xml文件中修改。

#### 1.2.5. 引入

往项目中引入lib目录下的servlet-api-3.0.1以及jsp-api文件。

## 2. servlet实现

1.   继承HttpServlet

```JAVA
public class HelloServlet extends HttpServlet {
    
}
```

2.   并重写service 方法，或者doGet、doPost方法。

     service方法实质上会根据前台的请求，判断请求方式是 GET 还是 POST，并调用对应的方法。

```java
/* HttpServlet 的 service方法 */
protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
    String method = req.getMethod();
    long lastModified;
    if (method.equals("GET")) {
        lastModified = this.getLastModified(req);
        if (lastModified == -1L) {
            this.doGet(req, resp);
        } else {
            long ifModifiedSince = req.getDateHeader("If-Modified-Since");
            if (ifModifiedSince < lastModified) {
                this.maybeSetLastModified(resp, lastModified);
                this.doGet(req, resp);
            } else {
                resp.setStatus(304);
            }
        }
    } else if (method.equals("HEAD")) {
        lastModified = this.getLastModified(req);
        this.maybeSetLastModified(resp, lastModified);
        this.doHead(req, resp);
    } else if (method.equals("POST")) {
        this.doPost(req, resp);
    } else if (method.equals("PUT")) {
        this.doPut(req, resp);
    } else if (method.equals("DELETE")) {
        this.doDelete(req, resp);
    } else if (method.equals("OPTIONS")) {
        this.doOptions(req, resp);
    } else if (method.equals("TRACE")) {
        this.doTrace(req, resp);
    } else {
        String errMsg = lStrings.getString("http.method_not_implemented");
        Object[] errArgs = new Object[]{method};
        errMsg = MessageFormat.format(errMsg, errArgs);
        resp.sendError(501, errMsg);
    }

}
```

### 2.1. Servlet 的生命周期

​		Servlet没有main()方法，不能独立运行，它的运行完全由Servlet引擎来控制和调度。所谓生命周期，指的是servlet容器何时创建servlet 实例、何时调用其方法进行请求的处理、何时并销毁其实例的整个过程。

*   实例和初始化时机
    当请求到达容器时，容器查找该servlet 对象是否存在,如果不存在，则会创建实例并进行初始化。
*   就绪/调用/服务阶段
    有请求到达容器，容器调用servlet对象的service()方法,处理请求的方法在整个生命周期中可以被多次调用; HttpServlet的service()方法，会依据请求方式来调用doGet()或者doPost()方法。但是，这两个do方法默认情况下，会抛出异常,需要子类去override。
*   销毁时机
    当容器关闭时(应用程序停止时)，会将程序中的 Servlet实例进行销毁。

​		上述的生命周期可以通过Servlet中的生命周期方法来观察。在Servlet中有三个生命周期方法，不由用户手动调用，而是在特定的时机有容器自动调用，观察这三个生命周期方法即可观察到Servlet的生命周期。



**流程：**

1. Web Client向Servlet容器(Tomcat) 发出Http请求
2. Servlet容器接收Web Client的请求
3. Servlet容器创建一个HttpServletRequest对象，将Web Client请求的信息封装到这个对象中
4. Servlet容器创建一-个 HttpServletResponse对象
5. Servlet容器调HttpServlet对象service方法，把Request与Response作为参数,传给HttpServlet
6. HttpServlet调用HttpServletRequest对象的有关方法,获取Http请求信息
7. HttpServlet调用HttpServletResponse对象的有关方法，生成响应数据
8. Servlet容器把HttpServlet的响应结果传给Web Client。

## 3. HttpServletRequset

​		HttpServletRequest对象:主要作用是用来接收客户端发送过来的请求信息，例如:请求的参数，发送的头信息等都属于客户端发来的信息，service()方法中形参 接收的是HttpServletRequest接口的实例化对象，表示该对象主要应用在在HTTP协议上，该对象是由Tomcat封装好传递过来。

 

​		HttpServletRequest是ServletRequest的子接口，ServletRequest 只有一个子接口，就是HttpServletRequest。既然只有一个子接口为什么不将两个接口合并为一个?

​		从长远上讲:现在主要用的协议是HTTP协议，但以后可能出现更多新的协议。若以后想要支持这种新协议，只需要直接继承ServletRequest接口就行了。



​		在HttpServletRequest接口中，定义的方法很多,但都是围绕接收客户端参数的。但是怎么拿到该对象呢?不需要，直接在Service方法中由容器传入过来,而我们需要做的就是取出对象中的数据，进行分析、处理。

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

​		由于现在的request属于接收客户端的参数，所以必然有其默认的语言编码，主要是由于在解析过程中默认使用的编码方式为ISO-8859-1(此编码不支持中文)，所以解析时一-定会出现乱码。要想解决这种乱码问题，需要设置request中的编码方式，告诉服务器以何种方式来解析数据。或者在接收到乱码数据以后，再通过相应的编码格式还原。

方式一：

```java
request.setCharactorEnconding("utf-8");  // 只针对post请求
```

方式二：

```JAVA
new String(request.getParameter("name").getBytes("ISO-8859-1"),"UTF-8");
```

### 3.4. 请求转发

​		请求转发，是一种**服务器的行为**，当客户端请求到达后，服务器进行转发，此时会将请求对象进行保存，地址栏中的 **URL不会改变**，得到响应后，服务器在将响应发送给客户端，**从始至终只有一个请求发出**。

可以跳转到 servlet 或 jsp。

```JAVA
request.getRequestDispatcher(url).forward(request,response);
```



### 3.5. requset作用域

​		通过该对象可以在一个请求中传递数据，作用范围:在一次请 求中有效，即服务器跳转有效。

```JAVA
// 设置作用域
request.setAttribute(String name,Object value);
// 获取域对象内容
request.getAttribute(String name);
// 删除对象内容
request.removeAttribute(String name);
```

​		request域对象中的数据在一-次请求中有效, 则经过请求转发，request 域中的数据依然存在，则在请求转发的过程中可以通过request来传输/共享数据。





## 4. HttpServletResponse

​		Web服务器收到客户端的http请求，会针对每一次请求，分别创建一个用于**代表请求**的 request 对象和**代表响应**的 response 对象。
​		request和response对象代表请求和响应:获取客户端数据，需要通过request对象； **向客户端输出数据,需要通过 response 对象**。
​		HttpServletResponse的主要功能用于服务器对客户端的请求进行响应,将Web服务器处理后的结果返回给客户端。service()方法中形 参接收的是HttpServletResponse接口的实例化对象，这个对象中封装了向客户端发送数据、发送响应头，发送响应状态码的方法。|

### 4.1. 响应数据

响应数据需要获取输出流。

有两种形式：

​			**getWrite()**    获取字符流（只能响应返回字符）

​            **getOutputStream()**     获取字节流（能响应一切数据）

**<font color="red">注意</font>：两种流不可以同时使用。**

### 4.2. 响应乱码

​		在响应中，如果我们响应的内容中含有中文，则有可能出现乱码。这是因为服务器响应的数据也会经过网络传输，服务器端有一种编码方式， 在客户端也存在一种编码方式， 当两端使用的编码方式不同时则出现乱码。

**getWriter()的字符乱码**
		对于getWriter()获取到的字符流，响应中文必定出乱码，由于服务器端在进行编码时默认会使用IS0-8859-1格式的编码，该编码方式并不支持中文。
		要解决该种乱码只能在服务器端**告知服务器**使用一种能够支持中文的编码格式，比如我们通常用的"UTF-8"。

**服务端设置：**

```JAVA
response.setCharacterEncoding("UTF-8");
```

**客户端设置：**

```JAVA
response.setHeader("content-type","text/html;charset=UTF-8");
```

​		**两端指定编码后，乱码就解决了。一句话:  保证发送端和接收端的编码-致。**

**同时设置：**

```JAVA
response.setContentType("text/html;charset=UTF-8");
```



### 4.3. 重定向

​		重定向是一种服务器指导 ，客户端的行为。客户端发出第一个请求， 被服务器接收处理后，服务器会进行响应，在响应的同时，服务器会给客户端一个新的地址 (下次请求的地址response.sendRedirect(ur); )，当客户端接收到响应后，会立刻、马上、自动根据服务器给的新地址发起第二个请求，服务器接收请求并作出响应，重定向完成。
​		从描述中可以看出重定向当中有两个请求存在，并且属于客户端行为。

```JAVA
// 重定向跳转到index.jsp
response.sendRedirect("index.jsp");
```

​		通过观察浏览器我们发现第一次请求获得的响应码为302,并且含有一个location头信息。并且地址栏最终看到的地址是和第一-次请求地址不同的， 地址栏已经发生了变化。



### 4.4. 请求转发和重定向区别

|            请求转发             |             重定向              |
| :-----------------------------: | :-----------------------------: |
| 一次请求，数据在request域中共享 | 两次请求，requset域中数据不共享 |
|           服务器行为            |           客户端行为            |
|        地址栏不发生变化         |         地址栏发生变化          |
|      绝对地址定位到站点后       |     绝对地址可以写到http://     |



## 5. Cookie

​		Cookie是浏览器提供的一种技术，通过服务器的程序能将一些只须保存在客户端， 或者在客户端进行处理的数据，放在本地的计算机上，不需要通过网络传输，因而提高网页处理的效率，并且能够减少服务器的负载，但是由于Cookie是服务器端保存在客户端的信息，所以其安全性也是很差的。例如常见的记住密码则可以通过
Cookie来实现。
​		有一个专门操作Cookie 的类 **javax.servlet.http.Cookie**。随着服务器端的响应发送给客户端，保存在浏览器。当下次再访问服务器时把Cookie再带回服务器。
​		Cookie的格式:键值对用”=”链接,多个键值对间通过";”隔开。

### 5.1. Cookie的创建和发送

​		通过new Cookie("key","value")；来创建一一个 Cookie对象，要想将Cookie随响应发送到客户端，需要先添加到response对象中，response.addCookie(cookie；此时该 cookie对象则随着响应发送至了客户端。在浏览器上可以看见。

```JAVA
// 创建Cookie对象
Cookie cookie= new Cookie("name","value");
// 发送Cookie对象
response.addCookie(cookie);
```

### 5.2. Cookie获取

返回Cookie数组

```JAVA
Cookie[] cookies = request.getCookies();
```

### 5.3. Cookie设置到期时间

​		除了Cookie的名称和内容外，我们还需要关心一个信息，到期时间，到期时间用来指定该cookie何时失
效。默认为当前浏览器关闭即失效。我们可以手动设定cookie的有效时间(通过到期时间计算)，通过
setMaxAge(int time);方法设定cookie的最大有效时间，以秒为单位。
**到期时间的取值**

*   负整数
    若为负数，表示不存储该cookie。
    cookie的maxAge属性的默认值就是-1,表示只在浏览器内存中存活，一旦关闭浏览器窗口，那么cookie就会消失。
*   正整数
    若大于0的整数,表示存储的秒数。
    表示cookie对象可存活指定的秒数。当生命大于0时，浏览器会把Cookie保存到硬盘上，就算关闭浏览器，就算重启客户端电脑，cookie 也会存活相应的时间。
*   零
    若为0,表示删除该cookie.
    cookie生命等于0是一一个特殊的值，它表示cookie被作废!也就是说，如果原来浏览器已经保存了这个Cookie,那么可以通过Cookie的setMaxAge(0)来删除这个Cookie。无论是在浏览器内存中，还是在客户端
    硬盘上都会删除这个Cookie.

**设置Cookie指定时间后失效** 

```JAVA
cookie.setMaxAge(30); // 存活30秒

response.addCookie(cookie);
```

### 5.4. 注意

1. Cookie保存在当前浏览器中。

    在一般的站点中常常有记住用户名这样一个操作， 该操作只是将信息保存在本机上，换电脑以后这些信息就无效了。而且cookie还不能跨浏览器。

2. Cookie存在中文问题

   Cookie中不能出现中文，如果有中文则通过URLEncoder.encode()进行编码。解码URLEncoder.dencode()。

3. 同名Cookie

   如果服务器端发送重复的Cookie那么会覆盖原有的Cookie。

4. 浏览器限制Cookie的数量

   Cookie大小在4kb之内比较合适

### 5.5. Cookie路径

​		Cookie的setPath设置cookie的路径，这个路径直接决定服务器的请求是否会从浏览器中加载某些cookie。

```JAVA
cookie.setPath("/");   //任意项目都可访问
cookie.setPath("/ser01");  // 指定项目，默认是当前项目
cookie.setPath("/ser02/cook"); // 当前项目的指定目录
```



## 6. HttpSession

​		HttpSession对象是javax.servlet.http.HttpSession的实例，该接口并不像HttpServletRequest或HttpServletResponse还存在一个父接口，该接口只是一个纯粹的接口。这因为session本身就属于HTTP协议的范畴。

​		对于服务器而言，每-一个连接到它的客户端都是一个session, servlet 容器使用此接口创建HTTP客户端和HTTP服务器之间的会话。会话将保留指定的时间段,跨多个连接或来自用户的页面请求。-个会话通常对应于一个用户，该用户可能多次访问一个站点。可以通过此接口查看和操作有关某个会话的信息，比如会话标识符、创建时间和最后一-次访问时间。在整个session中，最重要的就是属性的操作。

​		session无论客户端还是服务器端都可以感知到，若重新打开-个新的浏览器，则无法取得之前设置的session，因为每一个session只保存在当前的浏览器当中，并在相关的页面取得。

​		Session的作用就是为了标识一-次会话，或者说确认一个用户;并且在一次会话 (一个用户的多次请求) 期间共享数据。我们可以通过request.getSession()方法，来获取当前会话的session对象。

```java
// 若存在则获取，若不存在则创建Session对象。
HttpSession session = request.getSession();
```

### 6.1. 标识符 JSESSIONID

​		Session既然是为了标识一次会话，那么此次会话就应该有一个唯一的标志， 这个标志就是sessionld。

​		每当一次请求到达服务器，如果开启了会话(访问了session)，服务器第一步会查看是否从客户端回传一 个名为JSESSIONID的cookie,如果没有则认为这是一次新的会话， 会创建-个新的session对象，并用唯一的sessionld为此次会话做一个标志。如果有JESSIONID这个cookie回传，服务器则会根据JSESSIONID这个值去查看是否含有id为JSESSION值的session对象,如果没有则认为是一个新的会话， 重新创建一个新的session对象,并标志此次会话;如果找到了相应的session对象，则认为是之前标志过的一次会话，返回该session对象,数据达到共享。

​		这里提到一个叫做JSESSIONID的cookie,这是-个比较特殊的cookie,当用户请求服务器时，如果访问了session,则服务器会创建一个名为JSESSIONID,值为获取到的session (无论是获取到的还是新创建的)的sessionld的cookie对象，并添加到response对象中，响应给客户端，有效时间为关闭浏览器。

​		所以Session的底层依赖Cookie来实现。

### 6.2. session域对象

​		Session用来表示一次会话，在一次会话中数据是可以共享的，这时session作为域对象存在，可以通过setAttribute(name,value)方法向域对象中添加数据，通过getAttribute(name)从域对象中获取数据，通过removeAttribute(name)从域对象中移除数据。

```JAVA
session.setAttrbute(String name,Object value);

session.getAttrbute(String name);

session.removeAttrbute(String name);
```



### 6.3. session对象的销毁

1. tomcat默认到期时间为30分钟

   ​		当客户端第一-次请求servlet并且操作session时，session 对象生成，Tomcat 中session默认的存活时间为30min,即你不操作界面的时间，- -旦有操作，session 会重新计时。

   ​		那么session的默认时间可以改么?答案是肯定的。

   ​		可以在Tomcat中的conf目录下的web.xml文件中进行修改。

   ```xml
   <!-- session 默认的最大不活动事件。单位：分钟。 -->
   <session-config>
       <session-timeout>30</session-timeout>
   </session-config>
   ```

2. 手动设置

   ```JAVA
   int s = session.getMaxInactiveIntvrval(); // 获取存活最大时间
   session.setMaxInactiveIntvrval(); // 设置最大存活时间
   ```

3. 立即销毁

   ```JAVA
   session.invalidate();
   ```

4. 关闭浏览器失效

5. 关闭服务器失效

## 7. ServletContext

​		每一个web应用都有且仅有个ServletContext 对象，又称Application 对象，从名称中可知，该对象是与应用程序相关的。在WEB容器启动的时候，会为每一个WEB应用程序创建一-个对应的ServletContext 对象。

​		该对象有两大作用，第一、作为域对象用来共享数据，此时数据在整个应用程序中共享;第二、 该对象中保存了当前应用程序相关信息。例如可以通过getServerInfo()方法获取当前服务器信息，getRealPath(String path)获取资源的真实路径等。

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

### 7.3. ServletContext域对象

​		ServletContext也可当做域对象来使用，通过向ServletContext中存取数据，可以使得整个应用程序共享某
些数据。当然不建议存放过多数据，因为ServletContext中的数据一旦存储进去没有手动移除将会一直保存。

```java
// 获取ServletContext对象
Serv1 etContext servletContext = request. getServletContext();
// 设置域对象
servletContext. setAttri bute("name" , "zhangsan");
// 获取域对象
String name = (String) serv1etContext . getAttri bute("'name") ;
// 移除域对象
seryletContext. removeAttri bute("name") ;
```



**Servlet的3三大域对象**

1. request域对象
在一次请求中有效。请求转发有效,重定向失效。
2. session域对象
在一次会话中有效。请求转发和重定向都有效, session销毁后失效。
3. servletContext域对象
在整个应用程序中有效。服务器关闭后失效。

## 8. 文件上传和下载

​		在上网的时候我们常常遇到文件上传的情况，例如上传头像、上传资料等; 当然除了上传,遇见下载的情况也很多，接下来看看我们servlet中怎么实现文件的上传和下载。

### 8.1. 文件上传

文件上传涉及到前台页面的编写和后台服务器端代码的编写，前台发送文件，后台接收并保存文件，这才是一个完整的文件上传。

**前台页面**

​		在做文件上传的时候，会有一-个上传文件的界面，首先我们需要一个表单， 并且表单的请求方式为POST;其次我们的form表单的enctype必须设为"multipart/form-data",即enctype="multipart/form-data",意思是设置表单的类型为文件.上传表单。默认情况下这个表单类型是"application/x-www-form-urlencoded",不能用于文件上传。只有使用了multipart/form-data才能完整地传递文件数据。

```HTML
<form method="post" enctype="multipart/form-data" action="">
    文件： <input type="file" name="file">
    <button>提交</button>
</form>
```

**后台接收**

​		在servlet上加注解@MultipartConfig，将前台的post封装成Part对象。

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

```java
@WebServlet(" /up7oadserv1et")
@Mu1tipartConfTg //如果是文件上传表单，- 定要加这个注解
pub1ic class Up1oadServlet extends HttpServ1et {
    @override
    protected void service (HttpServletRequest request， HttpServletResponse response)
        throws ServletException,IOException {
        //设置请求的编码格式
        request.setCharacterEncoding("UTF-8");
        //获取普通表单项(文本框)
        String uname = request.getParameter("uname"); // "uname "代表的是文本框的name属性值
        //通过getPart(name) 方法获取Part对象 (name代表的是页面中file文件域的name属性值)
        Part part = request.getPart("myfile");
        //通过Part对象，获取.上传的文件名
        String fileName = part.getSubmi ttedFi leName();
        //获取上传文件需要存放的路径(得到项目存放的真实路径)
        String realPath = request.getServ1etContext().getRealPath("/");
        //将文件上传到指定位置
        part.write(rea1path + fileName) ; 
    }
}
```



### 8.2. 文件下载

​		文件下载,即将服务器上的资源下载(拷贝)到本地，我们可以通过两种方式下载。第一种是通过超链接本身的特性来下载;第二种是通过代码下载。

#### 8.2.1.超链接下载

​		当我们在HTML或JSP页面中使用a标签时，原意是希望能够进行跳转，但当超链接遇到浏览器不识别的资源时会自动下载;当遇见浏览器能够直接显示的资源，浏览器就会默认显示出来，比如txt、png、 jpg 等。当然我也可以通过**download属性**规定浏览器进行下载。但有些浏览器并不支持。

```HTML
<!-- 浏览器不能识别的资源-->
<a href="test.zip"></a>  
<!-- 浏览器能识别的资源-->
<a href="test.zip" download="下载文件名"></a>  
```

​		download属性可以不写任何信息，会自动使用默认文件名。如果设置了download属性的值，则使用设置的值做为文件名。当用户打开浏览器点击链接的时候就会直接下载文件。

#### 8.2.2. 代码实现下载

实现步骤：

1.   需要通过response.setContentType方法设置Content-type头字段的值，为浏览器无法使用某种方式或激活某个程序来处理的MIME类型，例如"application/octet-stream"或"application/x-msdownload"等。
2.   需要通过response.setHeader方法设置Content-Disposition 头的值为"attachment;filename=文件名"
3.   读取下载文件，调用response.getOutputStream方法向客户端附件内容。





































