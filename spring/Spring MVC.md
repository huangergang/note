# Spring MVC one

## 1.MVC模式

MVC 模式代表 Model-View-Controller（模型-视图-控制器） 模式。这种模式用于应用程序的分层开发。

-   **Model（模型）** - 模型代表一个存取数据的对象或 JAVA POJO。它也可以带有逻辑，在数据变化时更新控制器。
-   **View（视图）** - 视图代表模型包含的数据的可视化。
-   **Controller（控制器）** - 控制器作用于模型和视图上。它控制数据流向模型对象，并在数据变化时更新视图。它使视图与模型分离开。

![img](https://www.runoob.com/wp-content/uploads/2014/08/1200px-ModelViewControllerDiagram2.svg_.png)

## 2.Spring MVC

​		Spring MVC是Spring家族中的一个web成员，它是一种基于Web MVC设计思想的请求驱动类型的轻量级Web框架，即使用了MVC架构模式思想，将web层进行职责解耦，基于请求驱动指的是使用请求-响应模型，框架的摸底就是简化开发，Spring MVC简化了日常Web开发。

​		Spring MVC是服务到工作者思想的实现。前端控制器是DispatcherServlet；应用控制器拆为处理器映射器（Handler Mapping）进行处理器管理和视图解析器（View Resolver）进行视图管理；支持本地化/国际化（Locale）解析及文件上传等；提供了非常灵活的数据验证、格式化和数据绑定机制；提供了强大的约束大于配置（管惯例优先原则）的契约式编程支持。

## 3.Spring MVC请求流程&环境搭建

### 3.1.Spring MVC请求处理程序分析

TODO

### 3.2.环境搭建

#### 3.2.1.开发环境

idea+Maven+jdk11+tomcat

#### 3.2.2.新建Maven webApp

idea下创建springmvc工程

#### 3.2.3.pom.xml配置

```XML
<properties>
    <project.build.sourceEncoding>UTF-8</project.build.sourceEncoding>
    <maven.compiler.source>11</maven.compiler.source>
    <maven.compiler.target>11</maven.compiler.target>
</properties>

<dependencies>

    <!--  spring web  -->
    <dependency>
        <groupId>org.springframework</groupId>
        <artifactId>spring-web</artifactId>
        <version>5.3.20</version>
    </dependency>

    <!--  spring mvc   -->
    <dependency>
        <groupId>org.springframework</groupId>
        <artifactId>spring-webmvc</artifactId>
        <version>5.3.20</version>
    </dependency>

    <!--  web servlet  -->
    <dependency>
        <groupId>javax.servlet</groupId>
        <artifactId>javax.servlet-api</artifactId>
        <version>4.0.1</version>
        <scope>provided</scope>
    </dependency>

</dependencies>

<build>
    <finalName>springmvc</finalName>
    <pluginManagement>
        <plugins>

            <!--  Maven 编译插件 -->
            <plugin>
                <groupId>org.apache.maven.plugins</groupId>
                <artifactId>maven-clean-plugin</artifactId>
                <version>2.5</version>
            </plugin>


            <!-- tomcat 插件 -->
            <plugin>
                <groupId>org.apache.tomcat.maven</groupId>
                <artifactId>tomcat7-maven-plugin</artifactId>
                <version>2.2</version>
                <configuration>
                    <!--  项目根路径名 -->
                    <path>/springmvc</path>
                    <!--  端口  -->
                    <port>8080</port>
                    <uriEncoding>UTF-8</uriEncoding><!-- 非必需项 -->
                </configuration>
            </plugin>

        </plugins>

    </pluginManagement>
</build>
```

#### 3.2.4.web.xml配置

```xml
<?xml version="1.0" encoding="UTF-8"?>
<web-app id="webApp_ID" version="3.0"
         xmlns="http://java.sun.com/xml/ns/javaee"
         xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
         xsi:schemaLocation="http://java.sun.com/xml/ns/javaee
                             http://java.sun.com/xml/ns/javaee/web-app_3_0.xsd"
         >

    <!-- 编码过滤 utf-8-->
    <filter>
        <description>char encoding filter</description>
        <filter-name>encodingFilter</filter-name>
        <filter-class>org.springframework.web.filter.CharacterEncodingFilter</filter-class>
        <init-param>
            <param-name>encoding</param-name>
            <param-value>utf-8</param-value>
        </init-param>
    </filter>

    <filter-mapping>
        <filter-name>encodingFilter</filter-name>
        <url-pattern>/*</url-pattern>
    </filter-mapping>


    <!-- servlet请求分发器-->
    <servlet>
        <servlet-name>springmvc</servlet-name>
        <servlet-class>org.springframework.web.servlet.DispatcherServlet</servlet-class>
        <init-param>
            <param-name>contextConfigLocation</param-name>
            <param-value>classpath:servlet-context.xml</param-value>
        </init-param>
        <!--    表示启动容器 时初始化该servlet-->
        <load-on-startup>1</load-on-startup>
    </servlet>

    <servlet-mapping>
        <servlet-name>springmvc</servlet-name>
        <!--        拦截请求-->
        <!--        <url-pattern>*.do</url-pattern>-->
        <url-pattern>/</url-pattern>
    </servlet-mapping>

</web-app>
```

#### 3.2.5.servlet-context.xml配置

```XML
<?xml version="1.0" encoding="UTF-8"?>

<beans xmlns="http://www.springframework.org/schema/beans"
       xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
       xmlns:mvc="http://www.springframework.org/schema/mvc"
       xmlns:context="http://www.springframework.org/schema/context"
       xsi:schemaLocation="
                           http://www.springframework.org/schema/mvc
                           http://www.springframework.org/schema/mvc/spring-mvc.xsd
                           http://www.springframework.org/schema/beans
                           http://www.springframework.org/schema/beans/spring-beans.xsd
                           http://www.springframework.org/schema/context
                           http://www.springframework.org/schema/context/spring-context.xsd ">

    <!--    开启扫描器  -->
    <context:component-scan base-package="com.xxxx"/>

    <!--    使用默认的servlet响应静态文件  -->
    <mvc:default-servlet-handler/>

    <!--    开启注解驱动  -->
    <mvc:annotation-driven/>

    <!--    配置视图解析器  -->
    <bean class="org.springframework.web.servlet.view.InternalResourceViewResolver"
          id="internalResourceViewResolver">
        <!--  前缀： 在WEB—INF目录下的jsp目录下  -->
        <property name="prefix" value="/WEB-INF/jsp/"/>
        <!--  后缀： 以.jsp结尾的资源     -->
        <property name="suffix" value=".jsp"/>
    </bean>

</beans>
```

#### 3.2.6.页面控制器编写

```java
package com.xxxx.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class TestController {
    
   /**
     * 请求路径  /hello
     *
     * @return
     */
    @RequestMapping("/hello")
    public ModelAndView hello() {

        ModelAndView mv = new ModelAndView();

        mv.addObject("hello", "hello spring MVC");

        mv.setViewName("hello");

        return mv;
    }

}
```

#### 3.2.7.添加视图页面

```jsp
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
String path = request.getContextPath();
String basePath =
    request.getScheme() + "://"
    + request.getServerName() + ":"
    + request.getServerPort() + path + "/";
%>

<html>
    <head>
        <base href="<%=basePath %>">
        <title>My JSP 'Hello.jsp' starting page</title>
        <meta http-equiv="pragma" content="no-cache">
        <meta http-equiv="cache-control" content="no-cache">
        <meta http-equiv="expires" content="keyword1.keyword2.keyword3">
        <meta http-equiv="descriptioin" content="This is my page">
    </head>
    <body>

        <h1>this is hello.jsp</h1>

        <hr>
        <h1>${hello}</h1>  <%-- 取TestController设置的hello值 --%>

    </body>
</html>
```

#### 3.2.8.启动服务器

配置启动命令

```maven
tomcat:run
```

访问浏览器

## 4.URL地址映射

### 4.1.URL 地址映射配置	@RequestMapping

​		通过注解@RequestMapping将请求地址与方法进行绑定，可以在类级别和方法级别声明。类级别的注解负责将一个特定的路径映射到一个控制器上，将url和类绑定；通过方法级别的注解可以细化映射，能够将一个特定的请求路径映射到某个具体的方法上，将url和类的方法绑定。

#### 4.1.1.映射单个 URL

@RequestMapping("")或@RequestMapping(value="")

```java
   /**
     * 声明在方法上，映射单个URL
     *
     *    使用方式
     *      1. 式@RequestMapping("/test01")
     *      2. @RequestMapping(value = "/test01")
     *    访问地址
     *      http://localhost:8080/springmvc/test01
     * @return
     */
@RequestMapping(value = "/test01") 	 /*斜杠可加可不加*/
public ModelAndView test01() {

    ModelAndView mv = new ModelAndView();

    mv.addObject("hello", "test01");

    mv.setViewName("hello");

    return mv;
}
```

#### 4.1.2.映射多个 URL

```java
   /**
     * 声明在方法上，映射多个URL
     *     支持多个URL的操作
     *    使用方式
     *      1. @RequestMapping({"/test02","/test02_01"})
     *      2. @RequestMapping(value = {"/test02","/test02_01"})
     *    访问地址
     *      http://localhost:8080/springmvc/test02 or http://localhost:8080/springmvc/test02_01
     * @return
     */

@RequestMapping(value = {"/test02","/test02_01"})
public ModelAndView test02() {

    ModelAndView mv = new ModelAndView();

    mv.addObject("hello", "test02");

    mv.setViewName("hello");

    return mv;
}
```

#### 4.1.3.映射 URL 在控制器上

​		用于类上，表示类中的所有响应请求的方法都是以该路径作为父路径。

```java
@Controller
@RequestMapping(value = "url")  // 父路径
public class URLController {

    /**
     *  声明在类上面，类的路径作为方法路径的父路径
     *      声明级别
     *          类级别 + 方法级别 (/类路径/方法路径)
     *      访问地址
     *          http://localhost:8080/springmvc/url/test03
     * @return
     */
    
    @RequestMapping(value = "/test03")
    public ModelAndView test03() {

        ModelAndView mv = new ModelAndView();

        mv.addObject("hello", "test03");

        mv.setViewName("hello");

        return mv;
    }
    
}
```

#### 4.1.4.通过参数名称映射URL

```java
    /**
     *  通过参数名称访问
     *      访问地址
     *      http://localhost:8080/springmvc/url?test04
     * @return
     */
@RequestMapping(params = "test04")
public ModelAndView test04() {

    ModelAndView mv = new ModelAndView();

    mv.addObject("hello", "test04");

    mv.setViewName("hello");

    return mv;
}
```

多参数

```java
/**
     * 通过参数名称访问
     * 		多参数
     * 		访问地址
     * 			http://localhost:8080/springmvc/url?test05&test05_01
     *
     * @return
     */
@RequestMapping(params = {"test05", "test05_01"})
public ModelAndView test05() {

    ModelAndView mv = new ModelAndView();

    mv.addObject("hello", "test05");

    mv.setViewName("hello");

    return mv;
}
```

#### 4.1.5.设置 URL 映射的请求方式

​		默认没有设置请求方式，在HTTP请求中最常用的请求方法是 GET、POST，还有其他一些方法，如：DELET、PUT、HEAD等。

​		可以通过method属性设置支持的请求方式，如RequestMethod.POST；设置多种请求方式，以大括号包围，逗号隔开即可。

```java
  /**
     * 通过method设置请求方式
     *     如：
     *      method = RequestMethod.POST
     *
     * @return
     */
@RequestMapping(value = {"test06"}, method = RequestMethod.POST)
public ModelAndView test06() {

    ModelAndView mv = new ModelAndView();

    mv.addObject("hello", "test06");

    mv.setViewName("hello");

    return mv;
}
```

### 4.2.参数绑定

设置data.jsp

```jsp
<%--
    Created by IntelliJ IDEA.
    User: Turing
        Date: 2022/6/28
            Time: 9:37
                To change this template use File | Settings | File Templates.
                --%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
String path = request.getContextPath();
String basePath =
    request.getScheme() + "://"
    + request.getServerName() + ":"
    + request.getServerPort() + path + "/";
%>

<html>
    <head>
        <base href="<%=basePath %>">
        <title>My JSP 'Hello.jsp' starting page</title>
        <meta http-equiv="pragma" content="no-cache">
        <meta http-equiv="cache-control" content="no-cache">
        <meta http-equiv="expires" content="keyword1.keyword2.keyword3">
        <meta http-equiv="descriptioin" content="This is my page">
    </head>
    <body>

        <h1>this is data.jsp</h1>

        <hr>
        <h1>${data}</h1> <%-- 取ParamsController设置的data值 --%>

    </body>
</html>

```

#### 4.2.1.基本数据绑定

```java
    /**
     *  基本数据类型
     *      请求时传递参数
     *           http://localhost:8080/springmvc/data01?age=10&money=200.0
     *
     *      参数值必须存在，如果参数不存在，也没有设置默认值，则会报500异常
     * @return
     */
@RequestMapping(value = "/data01")
public ModelAndView data01(int age, double money) {

    String str = "age = " + age + "\n" + "money = " + money;
    System.out.println(str);

    ModelAndView mv = new ModelAndView();

    mv.addObject("data", str);

    mv.setViewName("data");

    return mv;
}
```

##### 4.2.1.2参数默认值

```java
   /**
     * 基本数据类型
     *      请求时传递参数
     * 通过@RequestParam(defaultValue = "10")设置参数默认值，避免500异常 (数据为空时)
     *
     * @return
     */
@RequestMapping(value = "/data02")
public ModelAndView data02(@RequestParam(defaultValue = "10") int age,
                           @RequestParam(defaultValue = "200.0") double money) {

    String str = "age = " + age + "\n" + "money = " + money;
    System.out.println(str);

    ModelAndView mv = new ModelAndView();

    mv.addObject("data", str);

    mv.setViewName("data");

    return mv;
}
```

##### 4.2.1.3参数别名

```java
  /**
     * 基本数据类型
     *      请求时传递参数
     * 通过@RequestParam(naem)设置参数别名
     *       设置别名后，客户端请求时必须使用别名
     * @return
     */
@RequestMapping(value = "/data03")
public ModelAndView data03(@RequestParam(defaultValue = "10",name = "userAge") int age,
                           @RequestParam(defaultValue = "200.0",name = "userMoney") double money) {

    String str = "age = " + age + "\n" + "money = " + money;
    System.out.println(str);

    ModelAndView mv = new ModelAndView();

    mv.addObject("data", str);

    mv.setViewName("data");

    return mv;
}
```

#### 4.2.2.包装类型

```java
   /**
     * 包装类型
     *
     *  包装类型的默认值为null，(不会报500异常)
     * @return
     */
@RequestMapping(value = "/data04")
public ModelAndView data04(Integer age,
                           Double money) {

    String str = "age = " + age + "\n" + "money = " + money;
    System.out.println(str);

    ModelAndView mv = new ModelAndView();

    mv.addObject("data", str);

    mv.setViewName("data");

    return mv;
}
```

#### 4.2.3.字符串类型

```java
 /**
     * 字符串类型
     *
     *
     * @return
     */
@RequestMapping(value = "/data05")
public ModelAndView data05(String name,
                           String password) {

    String str = "name = " + name + "\n" + "password = " + password;
    System.out.println(str);

    ModelAndView mv = new ModelAndView();

    mv.addObject("data", str);

    mv.setViewName("data");

    return mv;
}
```

#### 4.2.4.数组类型

```java
   /**
     * 数组类型
     *      一个名字对应多个值
     *      发送的请求
     *          http://localhost:8080/springmvc/data06?hobbies=sing&hobbies=jump&hobbies=rap&hobbies=basketball
     * @return
     */
@RequestMapping(value = "/data06")
public ModelAndView data06(String[] hobbies) {

    StringBuffer str = new StringBuffer();

    for (String hobby : hobbies) {
        System.out.println("hobby = " + hobby);
        str.append(hobby + "   ");
    }

    ModelAndView mv = new ModelAndView();

    mv.addObject("data", str.toString());

    mv.setViewName("data");

    return mv;
}
```

#### 4.2.5.JavaBean类型

javabean

```java
package com.xxxx.entity;

public class User {

    private String id;
    private String name;


    User() {
    }

    @Override
    public String toString() {
        return "User{" +
            "id='" + id + '\'' +
            ", name='" + name + '\''+
            '}';
    }

}
```

```java
   /**
     * JavaBean类型
     *  请求参数名与JavaBean中的字段名保持一致
     * 发送的请求
     *      http://localhost:8080/springmvc/data07?id=1&name=张三
     * @return mv
     */
@RequestMapping(value = "/data07")
public ModelAndView data07(User user) {

    System.out.println(user.toString());

    ModelAndView mv = new ModelAndView();

    mv.addObject("data", user.toString());

    mv.setViewName("data");

    return mv;
}
```

#### 4.2.6.List类型

##### 4.2.6.1.基本类型（包装类和String）的集合

在User实体需要定义对应的list属性。（对于集合的参数绑定，一般需要使用JavaBean对象进行包装）；

JavaBean

```java
package com.xxxx.entity;


import java.util.List;

public class User2 {

    private String id;
    private String name;

    List<String> phones;

    @Override
    public String toString() {
        return "User2{" +
            "id='" + id + '\'' +
            ", name='" + name + '\'' +
            ", phones=" + phones +
            '}';
    }
}
```

list.jsp

```jsp
<form method="get" action="data08">
    <input name=phones type="text"/>
    <br>
    <input name=phones type="text"/>
    <button type="submit">提交</button>
</form>
```

Controller层方法

```java
   /**
     * List类型
     *   list.jsp 发送的请求
     *
     * @return mv
     */
@RequestMapping(value = "/data08")
public ModelAndView data08(User2 user2) {

    System.out.println(user2.toString());

    ModelAndView mv = new ModelAndView();

    mv.addObject("data", user2.toString());

    mv.setViewName("data");

    return mv;
}
```

<hr>

##### 4.2.6.2.自定义类的集合

自定义类

JavaBean

```java

public class User3 {

    private String id;
    private String name;

    List<User> userList;

    @Override
    public String toString() {
        return "User3{" +
            "id='" + id + '\'' +
            ", name='" + name + '\'' +
            ", userList=" + userList +
            '}';
    }

}

```

list3.jsp

```jsp
<form method="get" action="data09">
    id: <input name="id" type="text"/>
    <br>
    name: <input name="name" type="text"/>
    <br>
    userList id: <input name="userList[0].id" type="text">
    <br>
    userList name: <input name="userList[0].name" type="text">
    <br>
    userList id: <input name="userList[1].id" type="text">
    <br>
    userList name: <input name="userList[1].name" type="text">
    <br>
    <button type="submit">提交</button>
</form>
```

Controller层方法

```java
/**
     * List类型(自定义类)
     * list3.jsp 发送的请求
     *
     * @return mv
     */
@RequestMapping(value = "/data09")
public ModelAndView data09(User3 user3) {

    System.out.println(user3.toString());

    ModelAndView mv = new ModelAndView();

    mv.addObject("data", user3.toString());

    mv.setViewName("data");

    return mv;
}
```

#### 4.2.7.Set类型

TODO

#### 4.2.8.Map类型

JavaBean

```java
package com.xxxx.entity;


import java.util.List;
import java.util.Map;

public class User4 {

    private String id;
    private String name;

    Map<Integer, String> map;

    @Override
    public String toString() {
        return "User4{" +
                "id='" + id + '\'' +
                ", name='" + name + '\'' +
                ", map=" + map +
                '}';
    }
}
```

map.jsp

```jsp
<form method="get" action="data10">
    id: <input name="id" type="text"/>
    <br>
    name: <input name="name" type="text"/>
    <br>
    map 1: <input name="map[1]" type="text">
    <br>
    map 2: <input name="map[2]" type="text">
    <br>
    <button type="submit">提交</button>
</form>
```

Controller层方法

```java
   /**
     * Map类型
     * map.jsp 发送的请求
     *
     * @return mv
     */
@RequestMapping(value = "/data10")
public ModelAndView data10(User4 user4) {

    System.out.println(user4.toString());

    ModelAndView mv = new ModelAndView();

    mv.addObject("data", user4.toString());

    mv.setViewName("data");

    return mv;
}
```

### 4.3.请求域对象

#### 4.3.1.返回ModelAndView

```java
@RequestMapping(value = "/model01")
public ModelAndView model01() {

    ModelAndView mv = new ModelAndView();
    // 设置数据模型 (请求域对象的数据)
    mv.addObject("model", "model01 data ");
    // 设置视图
    mv.setViewName("model");

    return mv;
}
```

#### 4.3.2.ModelMap对象

```java
@RequestMapping(value = "/model02")
public String model02(ModelMap modelMap) {
    // 设置数据模型
    modelMap.addAttribute("model", "model02 data ");

    return "model";
}

```

#### 4.3.3.Model对象

```java
@RequestMapping(value = "/model03")
public String model03(Model model) {
    // 设置数据模型
    model.addAttribute("model", "model03 data ");

    return "model";
}
```

#### 4.3.4.Map对象

```java
@RequestMapping(value = "/model04")
public String model04(Map map) {
    // 设置数据模型
    map.put("model", "model04 data ");

    return "model";
}

```

#### 4.3.5.原生HttpServletRequest对象

```java
@RequestMapping(value = "/model05")
public String model05(HttpServletRequest request) {

    request.setAttribute("model","model05 data");

    return "model";
}
```

## 5.请求转发与重定向

​		SpringMVC默认采用服务器内部转发的形式展示页面信息。同时也支持重定向页面。

### 5.1.重定向

​		重定向是发送一个302的状态码给浏览器，浏览器自己取请求跳转的网页。地址栏会发生变化。

**重定向以redirect:开头**

```java
/**
  * 重定向到JSP页面
  *   在webapp目录下创建view.jsp
  * @return
  */
@RequestMapping(value = "/view01")
public String view01() {
    return "redirect:view.jsp";
}
```

**重定向时传递参数**

```java
/**
  * 重定向到JSP页面
  *      传递参数
  * @return
  */
@RequestMapping(value = "/view02")
public String view02() {

    return "redirect:view2.jsp?id=123&name=turing";
}
```

view.jsp

```jsp
<body>
    <h1>${param.id}</h1>  // 取值
    <h1>${param.name}</h1>
</body>
```

转递中文参数，通过RedirectAttributes设置中文参数

```java
/**
  * 重定向到JSP页面
  *      传递中文参数(避免中文乱码)
  *
  * @return
  */
@RequestMapping(value = "/view03")
public String view03(RedirectAttributes attributes) {

    // 设置参数
    attributes.addAttribute("id", 1);
    attributes.addAttribute("name", "黄四郎");

    return "redirect:view2.jsp";
}
```

转递中文参数，通过ModelAndView设置中文参数

```java
@RequestMapping(value = "/view04")
public ModelAndView view04(ModelAndView modelAndView) {
    // 设置参数
    modelAndView.addObject("id", 1);
    modelAndView.addObject("name", "张二狗");

    // 设置视图
    modelAndView.setViewName("redirect:view2.jsp");

    return modelAndView;
}
```

**重定向到Controller**

```java
@RequestMapping(value = "/view05")
public ModelAndView view05(ModelAndView modelAndView) {
    // 设置参数
    modelAndView.addObject("id", 1);
    modelAndView.addObject("name", "张大炮");

    // 设置视图
    modelAndView.setViewName("redirect:test");  // 重定向到test映射的Controller层方法

    return modelAndView;
}
```

### 5.2.请求转发

​		请求转发，直接调用跳转的页面，让它返回。对于浏览器来说，它无法感觉服务器有没有forward。地址栏不发生改变。可以获取请求域中的数据。

**请求转发以forword:开头** （默认是请求转发，也可以不写）

```java
@RequestMapping(value = "/view06")
public String view06() {

    return "forward:index.jsp";
}
```

传递参数

```java
@RequestMapping(value = "/view07")
public String view06() {

    return "forward:index.jsp?name=zhangsan&pwd=123456";
}
```

设置请求域对象

```java
/**
  * 设置请求域
  *
  * @return
  */
@RequestMapping(value = "/view08")
public String view08(Model model) {
    model.addAttribute("name", "张三");
    return "forward:index.jsp?name=zhangsan&pwd=123456";
}
```

请求转发到Controller

```java
/**
  * 请求转发到Controller
  *
  * @return
  */
@RequestMapping(value = "/view10")
public ModelAndView view10(ModelAndView modelAndView) {

    modelAndView.setViewName("forward:test");

    return modelAndView;
}
```

请求转发到Controller，传递参数

```java
/**
  * 请求转发到Controller，传递参数
  *
  * @return
  */
@RequestMapping(value = "/view11")
public ModelAndView view11(ModelAndView modelAndView) {

    modelAndView.setViewName("forward:test?id=123445&name=努尔哈赤");

    return modelAndView;
}
```

## 6.SpringMVC 之 JSON 数据开发

### 6.1.基本概念

​		Json在企业开发中已经作为通用的接口参数类型，在页面（客户端）解析很方便。SpringMVC对于json提供了良好的支持，这里需要修改相关配置，添加json数据支持功能。

#### 6.1.1.@ResponseBody

​		该注解用于将Controller的方法返回的对象，通过适当的HttpMessageConverter转换为指定格式后，写入到Response对象的body数据区。

​		返回的数据不是html标签的页面，而是其他某种格式的数据（如json、xml等）使用（通常用于ajax请求）

#### 6.1.2.@RequestBody

​		该注解用于读取Request请求的body部分数据，使用系统默认的HttpMessageConverter进行解析，然后把相应的数据绑定到要返回的对象上，再把HttpMessageConverter返回的对象绑定到Controller中方法的参数上。

### 6.2.使用配置

#### 6.2.1.pom.xml添加json相关坐标

```XML
<!--  JSON      -->
<dependency>
    <groupId>com.fasterxml.jackson.core</groupId>
    <artifactId>jackson-core</artifactId>
    <version>2.12.7</version>
</dependency>

<dependency>
    <groupId>com.fasterxml.jackson.core</groupId>
    <artifactId>jackson-databind</artifactId>
    <version>2.12.7</version>
</dependency>

<dependency>
    <groupId>com.fasterxml.jackson.core</groupId>
    <artifactId>jackson-annotations</artifactId>
    <version>2.12.7</version>
</dependency>
```

#### 6.2.2.修改servlet-context.xml

```XML
<!--  mvc 请求映射 处理器与适配器配置  -->
<mvc:annotation-driven>
    <mvc:message-converters>
        <bean class="org.springframework.http.converter.StringHttpMessageConverter"/>
        <bean class="org.springframework.http.converter.json.MappingJackson2HttpMessageConverter"/>
    </mvc:message-converters>
</mvc:annotation-driven>
```

#### 6.2.3.注解使用

##### 6.2.3.1.@ResponseBody

```java
@Controller
@RequestMapping("/JSON")
public class JSONController {

    @RequestMapping("/json01") 
    @ResponseBody
    public  User json01() { 
        User user = new User();
        user.setId("007");
        user.setName("张有志");
        return user;
    }
}
```

写法二：注解在方法返回值前

```java
@RequestMapping("/json01") 
public @ResponseBody User json01() { 
    User user = new User();
    user.setId("007");
    user.setName("张有志");
    return user;
}
```

返回集合

```java
@RequestMapping("/json02")
public @ResponseBody List<User> json02() {

    return List.of(new User("007", "张有志"),
                   new User("008", "徐大志"),
                   new User("0101", "赵小嗨"));
}
```

###### 2.通过Ajax请求后台数据

jsp页面

```jsp
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
    <head>
        <title>JSON Ajax请求</title>
        <script type="text/javascript" src="js/jquery-3.6.0.js"></script>  // 准备Jquery文件
    </head>
    <body>
        <input type="button" value="相应JSON数据" onclick="test01()">
        <script>

            <%--  通过Ajax访问后台方法      --%>
            function test01(){
                // 发送ajax请求
                $.ajax({
                    // 请求方法
                    type:"post",
                    url:"JSON/json03",
                    data:{
                        "id":"011",
                        "name":"挖掘机"
                    },
                    // 回调函数，接受服务端返回的结果 (函数中的形参用来接受返回的数据)
                    success: function (data){
                        console.log(data);
                    }
                });
            }
        </script>
    </body>
</html>
```

Controller层方法

```java
@RequestMapping("/json03")
public @ResponseBody User json03() {

    return  new User("0101", "赵小嗨");
}
```

##### 6.2.3.2.@RequestBody

​		@RequestBody 注解常用来处理content-type 不是默认的 application/x-www-form-urlcoded类型的内容，比如：application/json或者是application/xml等。一般情况下用来处理application/json类型。@RequestBody接受的是一个 json 格式的字符串。

​		通过@RequestBody可以将请求体中的 JSON 字符环串绑定到相应的Bean上，当然，也可以将其分别绑定到对应的字符串上。

```java
   /**
     *   @RequestBody 规定请求参数为JSON格式
     */
@RequestMapping("/json04")
public @ResponseBody User json04(@RequestBody User user) {
    System.out.println(user);
    return user;
}
```

jsp页面

```jsp
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
    <head>
        <title>JSON Ajax请求</title>
        <script type="text/javascript" src="js/jquery-3.6.0.js"></script>
    </head>
    <body>
        <input type="button" value="设置请求JSON" onclick="test02()">
        <script>
            /**
             * 传递JSON格式的参数
             */
            function test02(){
                // 发送ajax请求
                $.ajax({
                    // 请求方法
                    type: "post",
                    url: "JSON/json04",
                    // 设置服务器请求参数类型 为application/json
                    contentType: "application/json",
                    data: '{"id": "011","name": "挖掘机"}',
                    // 回调函数，接受服务端返回的结果 (函数中的形参用来接受返回的数据)
                    success: function (data){
                        console.log(data);
                    }
                });
            }
        </script>
    </body>
</html>
```



<hr style="background-color:red" />


# Spring MVC two

## 1.拦截器



































