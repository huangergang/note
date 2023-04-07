# Spring MVC one

## 1. MVC模式

MVC 模式代表 Model-View-Controller（模型-视图-控制器） 模式。这种模式用于应用程序的分层开发。

-   **Model（模型）** - 模型代表一个存取数据的对象或 JAVA POJO。它也可以带有逻辑，在数据变化时更新控制器。
-   **View（视图）** - 视图代表模型包含的数据的可视化。
-   **Controller（控制器）** - 控制器作用于模型和视图上。它控制数据流向模型对象，并在数据变化时更新视图。它使视图与模型分离开。

![img](https://www.runoob.com/wp-content/uploads/2014/08/1200px-ModelViewControllerDiagram2.svg_.png)

## 2. Spring MVC

​		Spring MVC是Spring家族中的一个web成员，它是一种基于Web MVC设计思想的请求驱动类型的轻量级Web框架，即使用了MVC架构模式思想，将web层进行职责解耦，基于请求驱动指的是使用请求-响应模型，框架的摸底就是简化开发，Spring MVC简化了日常Web开发。

​		Spring MVC是服务到工作者思想的实现。前端控制器是DispatcherServlet；应用控制器拆为处理器映射器（Handler Mapping）进行处理器管理和视图解析器（View Resolver）进行视图管理；支持本地化/国际化（Locale）解析及文件上传等；提供了非常灵活的数据验证、格式化和数据绑定机制；提供了强大的约束大于配置（管惯例优先原则）的契约式编程支持。



SpringMVC

五大核心组件

1.DispatcherServlet　　请求入口

2.HandlerMapping　　 请求派发,负责请求和控制器建立一一对应的关系

3.Controller　　　　　 处理器

4.ModelAndView　　　 封装模型信息和视图信息

5.ViewResolver　　　　视图处理器,定位页面



## 3. Spring MVC请求流程&环境搭建

### 3.1. Spring MVC请求处理程序分析

TODO

### 3.2. 环境搭建

#### 3.2.1. 开发环境

idea+Maven+jdk11+tomcat

#### 3.2.2. 新建Maven webApp

idea下创建springmvc工程

#### 3.2.3. pom.xml配置

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

#### 3.2.4. web.xml配置

```xml
<?xml version="1.0" encoding="UTF-8"?>
<web-app id="webApp_ID" version="3.0"
         xmlns="http://java.sun.com/xml/ns/javaee"
         xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
         xsi:schemaLocation="http://java.sun.com/xml/ns/javaee
                             http://java.sun.com/xml/ns/javaee/web-app_3_0.xsd"
         >
    <!--  启动spring容器  -->
    <context-param>
        <param-name>contextConfigLocation</param-name>
        <param-value>classpath:spring.xml</param-value>
    </context-param>


    <!--  设置监听器  -->
    <listener>
        <listener-class>org.springframework.web.context.ContextLoaderListener</listener-class>
    </listener>


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

#### 3.2.5. servlet-context.xml配置

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

#### 3.2.6. 页面控制器编写

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

#### 3.2.7. 添加视图页面

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

#### 3.2.8. 启动服务器

配置启动命令

```maven
tomcat:run
```

访问浏览器

## 4. URL地址映射

### 4.1. URL 地址映射配置	@RequestMapping

​		通过注解@RequestMapping将请求地址与方法进行绑定，可以在类级别和方法级别声明。类级别的注解负责将一个特定的路径映射到一个控制器上，将url和类绑定；通过方法级别的注解可以细化映射，能够将一个特定的请求路径映射到某个具体的方法上，将url和类的方法绑定。

#### 4.1.1. 映射单个 URL

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

#### 4.1.2. 映射多个 URL

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

#### 4.1.3. 映射 URL 在控制器上

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

#### 4.1.4. 通过参数名称映射URL

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

#### 4.1.5. 设置 URL 映射的请求方式

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

### 4.2. 参数绑定

设置data.jsp

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

        <h1>this is data.jsp</h1>

        <hr>
        <h1>${data}</h1> <%-- 取ParamsController设置的data值 --%>

    </body>
</html>

```

#### 4.2.1. 基本数据绑定

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

##### 4.2.1.2 参数默认值

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

##### 4.2.1.3. 参数别名

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

#### 4.2.2. 包装类型

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

#### 4.2.3. 字符串类型

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

#### 4.2.4. 数组类型

```java
   /**
     * 数组类型
     *      一个名字对应多个值
     *      发送的请求
     *          http://localhost:8080/springmvc/data06?			    hobbies=sing&hobbies=jump&hobbies=rap&hobbies=basketball
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

#### 4.2.5. JavaBean类型

javabean

```java
package com.xxxx.entity;

public class User {

    private String id;
    private String name;


    public User() {
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

#### 4.2.6. List类型

##### 4.2.6.1. 基本类型（包装类和String）的集合

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

##### 4.2.6.2. 自定义类的集合

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

#### 4.2.7. Set类型

TODO

#### 4.2.8. Map类型

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

### 4.3. 请求域对象

#### 4.3.1. 返回 ModelAndView

```java
@RequestMapping(value = "/model01")
public ModelAndView model01() {

    ModelAndView mv = new ModelAndView();
    // 设置数据模型 (请求域对象的数据)
    mv.addObject("model", "model01 data");
    // 设置视图
    mv.setViewName("model");

    return mv;
}
```

#### 4.3.2. ModelMap对象

```java
@RequestMapping(value = "/model02")
public String model02(ModelMap modelMap) {
    // 设置数据模型
    modelMap.addAttribute("model", "model02 data ");

    return "model";
}

```

#### 4.3.3. Model对象

```java
@RequestMapping(value = "/model03")
public String model03(Model model) {
    // 设置数据模型
    model.addAttribute("model", "model03 data ");

    return "model";
}
```

#### 4.3.4. Map对象

```java
@RequestMapping(value = "/model04")
public String model04(Map map) {
    // 设置数据模型
    map.put("model", "model04 data ");

    return "model";
}

```

#### 4.3.5. 原生HttpServletRequest对象

```java
@RequestMapping(value = "/model05")
public String model05(HttpServletRequest request) {

    request.setAttribute("model","model05 data");

    return "model";
}
```



## 5. 请求转发与重定向

​		SpringMVC默认采用服务器内部转发的形式展示页面信息。同时也支持重定向页面。

### 5.1. 重定向

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

### 5.2. 请求转发

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



## 6. SpringMVC 之 JSON 数据开发

### 6.1. 基本概念

​		Json在企业开发中已经作为通用的接口参数类型，在页面（客户端）解析很方便。SpringMVC对于json提供了良好的支持，这里需要修改相关配置，添加json数据支持功能。

#### 6.1.1. @ResponseBody

​		该注解用于将Controller的方法返回的对象，通过适当的HttpMessageConverter转换为指定格式后，写入到Response对象的body数据区。

​		返回的数据不是html标签的页面，而是其他某种格式的数据（如json、xml等）使用（通常用于ajax请求）

#### 6.1.2. @RequestBody

​		该注解用于读取Request请求的body部分数据，使用系统默认的HttpMessageConverter进行解析，然后把相应的数据绑定到要返回的对象上，再把HttpMessageConverter返回的对象绑定到Controller中方法的参数上。

### 6.2. 使用配置

#### 6.2.1. pom.xml添加json相关坐标

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

#### 6.2.2. 修改servlet-context.xml

```XML
<!--  mvc 请求映射 处理器与适配器配置  -->
<mvc:annotation-driven>
    <mvc:message-converters>
        <bean class="org.springframework.http.converter.StringHttpMessageConverter"/>
        <bean class="org.springframework.http.converter.json.MappingJackson2HttpMessageConverter"/>
    </mvc:message-converters>
</mvc:annotation-driven>
```

#### 6.2.3. 注解使用

##### 6.2.3.1. @ResponseBody

```java
@Controller
@RequestMapping("/JSON")
public class JSONController {

    @RequestMapping("/json01") 
    @ResponseBody
    public User json01() { 
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

##### 6.2.3.2. @RequestBody

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

## 1. 拦截器

### 1.1. 基本概念

​		SpringMVC中的Interceptor拦截器是相当重要和有用的，它的主要主用是拦截用户的请求进行相应的处理。比如通过它来进行权限验证，或者是来判断是否登录等操作。对于SpringMVC拦截器的定义方式有两种：

​		实现接口：org.springframework.web.servlet.HandlerInterceptor

​		继承适配器：

### 1.2. 拦截器实现

#### 1.2.1. 实现接口

```java
package com.xxxx.interceptor;

import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class Interceptor01 implements HandlerInterceptor {


    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        
        System.out.println("preHandle.....");

        return true;   // 返回true时拦截器生效，flase失效
    }

    @Override
    public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler, ModelAndView modelAndView) throws Exception {

        System.out.println("postHandle.....");

    }

    @Override
    public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex) throws Exception {
        
        System.out.println("afterCompletion.....");

    }
}
```

​		在servlet-context.xml中配置拦截器

```xml
<!--配置拦截器-->
<mvc:interceptors>

    <!--    可以定义多个拦截器，拦截的顺序     -->
    <mvc:interceptor>

        <!-- 拦截项目中的所有方法   -->
        <mvc:mapping path="/**"/>				  <!--拦截的请求路径-->
        <!-- 不需要拦截的资源  -->
        <mvc:exclude-mapping path="/url/*"/>      <!--放行的请求路径-->

        <!--配置实现的拦截器bean-->
        <bean class="com.xxxx.interceptor.Interceptor01"/>

    </mvc:interceptor>
</mvc:interceptors>
```

#### 1.2.2. 继承实现类（已弃用）

​		本质还是实现接口。

```java
package com.xxxx.interceptor;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class Interceptor02 extends HandlerInterceptorAdapter {

    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        System.out.println("preHandle....");
        return true;
    }

}
```

​	在servlet-context.xml中配置拦截器

```xml
<mvc:interceptors>
    <mvc:interceptor>
        <mvc:mapping path="/**"/>
        <bean class="com.xxxx.interceptor.Interceptor02"/>
    </mvc:interceptor>
</mvc:interceptors>
```

#### 1.2.3. 多个拦截器的实现

​		SpringMVC 框架支持多个拦截器配置，从而构成拦截器链，对客户端进行多次拦截操作。

*   拦截器代码实现

​			参考1.1.1和1.1.2

*   拦截器xml配置

```xml
<!-- 
        拦截器链（多个连接器）
                 如果有多个拦截满足拦截的要求，则会根据配置的先后顺序执行
 				 先配置的拦截器的方法先执行 
    -->
<mvc:interceptors>
    <mvc:interceptor>
        <mvc:mapping path="/**"/>
        <bean class="com.xxxx.interceptor.Interceptor01"/>
    </mvc:interceptor>
    <mvc:interceptor>
        <mvc:mapping path="/**"/>
        <bean class="com.xxxx.interceptor.Interceptor02"/>
    </mvc:interceptor>
</mvc:interceptors>
```

### 1.3. 拦截器应用  -  非法的请求拦截

​		使用拦截器完成用户是否登录请求验证功能

#### 1.3.1. 用户控制器

```java
package com.xxxx.controller;


import com.xxxx.entity.User;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpSession;


/**
 * 用户登录  （无需拦截）
 * 添加操作  （需要拦截）
 * 修改操作  （需要拦截）
 * 删除操作  （需要拦截）
 */
@Controller
@RequestMapping("/userInfo")
public class UserInfoController {


    /**
     * 用户登录
     *
     * @return
     */
    @RequestMapping("/login")
    public ModelAndView userLogin(HttpSession session) {
        System.out.println("用户登录....");

        ModelAndView mv = new ModelAndView();

        mv.setViewName("success");

        // 如果用户登录，则设置用户对象到session作用域中
        User user = new User("123", "SpongeBob");
        session.setAttribute("user", user);


        return mv;
    }


    /**
     * 用户添加
     *
     * @return
     */
    @RequestMapping("/add")
    public ModelAndView useAdd() {
        System.out.println("用户添加....");

        ModelAndView mv = new ModelAndView();

        mv.setViewName("success");

        return mv;
    }


    @RequestMapping("/update")
    public ModelAndView userUpdate() {
        System.out.println("用户更新....");

        ModelAndView mv = new ModelAndView();

        mv.setViewName("success");

        return mv;
    }


    @RequestMapping("/delete")
    public ModelAndView userDelete() {
        System.out.println("用户删除....");

        ModelAndView mv = new ModelAndView();

        mv.setViewName("success");

        return mv;
    }
}
```

#### 1.3.2. 页面定义

```jsp
<%--
  Created by IntelliJ IDEA.
  User: Turing
  Date: 2022/8/13
  Time: 19:33
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>登录</title>
</head>
<body>
<form>

    学号：<input type="text">
    <br/>
    姓名：<input type="text">

</form>
</body>
</html>
```

#### 1.3.3. 拦截器定义

```java
package com.xxxx.interceptor;

import com.xxxx.entity.User;
import org.springframework.web.servlet.HandlerInterceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class LoginInterceptor implements HandlerInterceptor {

    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {

        // 获取session作用域中的user对象
        User user = (User) request.getAttribute("user");

        // 判断session作用域中的user对象是否为空
        // 如果为空执行登录操作
        if (user == null) {
            // 拦截请求并跳转到登录页面
            response.sendRedirect(request.getContextPath() + "/login.jsp");
            return false;
        }

        return true;
    }
}
```

#### 1.3.4. xml配置

```xml
<!--    非法访问拦截器-->
<mvc:interceptors>
    <mvc:interceptor>
        <!-- 拦截所有请求 -->
        <mvc:mapping path="/**"/>
        <mvc:exclude-mapping path="/userInfo/login"/>
        <bean class="com.xxxx.interceptor.LoginInterceptor"/>
    </mvc:interceptor>
</mvc:interceptors>
```

## 2. 文件上传

### 2.1. 环境配置

#### 2.1.1. pom.xml文件修改

```xml
<!--  spring 文件上传 依赖-->
<dependency>
    <groupId>commons-fileupload</groupId>
    <artifactId>commons-fileupload</artifactId>
    <version>1.3.2</version>
</dependency>
```

#### 2.1.2. servlet-context.xml修改

```xml
<bean id="multipartResolver"
      class="org.springframework.web.multipart.commons.CommonsMultipartResolver">


    <!-- 允许上传的最大尺寸  单位KB -->
    <property name="maxUploadSize">
        <value>104857600</value>  
    </property>

    <!--
               设置文件放入临时文件夹的最小  大小限制
               此值是阈值，低于此值，则保存在内存中，如高于此值，则生成硬盘上的零时文件
               -->
    <property name="maxInMemorySize">
        <value>4096</value>
    </property>
</bean>
```

### 2.2. 代码实现

#### 2.2.1. 单文件上传

##### 2.2.1.1. 页面表单

*   input的type设置为file
*   form表单的method设置为post
*   form表单的enctype设置为multipart/form-data，以二进制的形式传输数据

```jsp
<%--
    文件上传表单 二进制表单
    --%>
<form method="post" action="uploadFile" enctype="multipart/form-data">

    <input type="file" name="file"/>
    <button type="submit">上传</button>
</form>
```

##### 2.2.1.2. 代码实现

```java
package com.xxxx.controller;


import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.io.IOException;

@Controller
public class FileController {


    /**
     * 单文件上传
     *
     * @return
     */
    @RequestMapping("/uploadFile")
    public String uploadFile(HttpServletRequest httpServletRequest, @RequestParam("file") MultipartFile multipartFile) {

        //        // 转换成MultipartHttpServletRequest对象
        //        MultipartHttpServletRequest multipartHttpServletRequest = (MultipartHttpServletRequest) httpServletRequest;
        //
        //        // 获取上传的文件
        //        MultipartFile file = multipartHttpServletRequest.getFile("file");

        // 判断文件是否为空
        if (!multipartFile.isEmpty()) {
            // 获取项目所在路径（绝对路径）
            String path = httpServletRequest.getServletContext().getRealPath("/");
            // 设置上传文件存放目录
            File upload = new File(path + "/upload");
            // 判断文件目录是否存在，如果存在则新建对应的目录
            if (!upload.exists()) {
                // 新建目录
                upload.mkdir();
            }

            // 获取长传文件名
            String originalFile = multipartFile.getOriginalFilename();
            // 获取文件上传后缀名
            String suffix = originalFile.substring(originalFile.lastIndexOf("."));
            // 通过当前系统的毫秒数，生成随机文件名
            String fileName = System.currentTimeMillis() + suffix;
            // 上传文件 （转存文件到指定目录）
            try {
                multipartFile.transferTo(new File(upload, fileName));

                // 如果上传成功，设置作用域
                httpServletRequest.setAttribute("msg", "文件上传成功!");

            } catch (IOException e) {
                e.printStackTrace();
                // 如果上传失败，设置作用域
                httpServletRequest.setAttribute("msg", "文件上传失败!");

            }


        } else {
            // 如果上传文件不存在，设置作用域
            httpServletRequest.setAttribute("msg", "文件不存在!");
        }

        return "result";
    }
}
```

#### 2.2.2. 多文件上传

##### 2.2.2.1. 页面表单

```jsp
<%--
    文件上传表单 二进制表单
	多文件域
    --%>
<form method="post" action="uploadFile" enctype="multipart/form-data">

    <input type="file" name="files"/>
    <input type="file" name="files"/>
    <input type="file" name="files"/>
    <button type="submit">上传</button>
</form>
```

##### 2.2.2.2. 代码实现

```java
package com.xxxx.controller;


import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.io.IOException;
import java.util.List;

@Controller
public class FileController {


    // 封装
    public void saveFile(HttpServletRequest httpServletRequest, MultipartFile multipartFile) {

        // 判断文件是否为空
        if (!multipartFile.isEmpty()) {
            // 获取项目所在路径（绝对路径）
            String path = httpServletRequest.getServletContext().getRealPath("/");
            // 设置上传文件存放目录
            File upload = new File(path + "/upload");
            // 判断文件目录是否存在，如果存在则新建对应的目录
            if (!upload.exists()) {
                // 新建目录
                upload.mkdir();
            }

            // 获取长传文件名
            String originalFile = multipartFile.getOriginalFilename();
            // 获取文件上传后缀名
            String suffix = originalFile.substring(originalFile.lastIndexOf("."));
            // 通过当前系统的毫秒数，生成随机文件名
            String fileName = System.currentTimeMillis() + suffix;
            // 上传文件 （转存文件到指定目录）
            try {
                multipartFile.transferTo(new File(upload, fileName));

                // 如果上传成功，设置作用域
                httpServletRequest.setAttribute("msg", "文件上传成功!");

            } catch (IOException e) {
                e.printStackTrace();
                // 如果上传失败，设置作用域
                httpServletRequest.setAttribute("msg", "文件上传失败!");

            }


        } else {
            // 如果上传文件不存在，设置作用域
            httpServletRequest.setAttribute("msg", "文件不存在!");
        }

    }

    /**
     * 单文件上传
     *
     * @return
     */
    @RequestMapping("/uploadFile")
    public String uploadFile(HttpServletRequest httpServletRequest, @RequestParam("file") MultipartFile multipartFile) {

        //        // 转换成MultipartHttpServletRequest对象
        //        MultipartHttpServletRequest multipartHttpServletRequest = (MultipartHttpServletRequest) httpServletRequest;
        //
        //        // 获取上传的文件
        //        MultipartFile file = multipartHttpServletRequest.getFile("file");

        saveFile(httpServletRequest, multipartFile);
        return "result";
    }


    @RequestMapping("/uploadFiles")
    public String uploadFiles(HttpServletRequest httpServletRequest, @RequestParam("files") List<MultipartFile> files) {


        if (files.size() > 0 && files != null) {
            // 上传文件
            files.forEach((file) -> {
                saveFile(httpServletRequest, file);
            });
        }
        return "result";
    }
}
```



## 3. SSM 框架集成与测试

### 3.1. 环境配置

#### 3.1.1. IDEA 下创建项目

​		创建Maven对应的Web项目

#### 3.1.2. 配置 pom.xml

```xml
<?xml version="1.0" encoding="UTF-8"?>

<project xmlns="http://maven.apache.org/POM/4.0.0" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
         xsi:schemaLocation="http://maven.apache.org/POM/4.0.0 http://maven.apache.org/xsd/maven-4.0.0.xsd">
    <modelVersion>4.0.0</modelVersion>

    <groupId>org.example</groupId>
    <artifactId>ssm2</artifactId>
    <version>1.0-SNAPSHOT</version>
    <packaging>war</packaging>

    <name>ssm2 Maven Webapp</name>
    <!-- FIXME change it to the project's website -->
    <url>http://www.example.com</url>

    <properties>
        <project.build.sourceEncoding>UTF-8</project.build.sourceEncoding>
        <maven.compiler.source>11</maven.compiler.source>
        <maven.compiler.target>11</maven.compiler.target>
    </properties>

    <dependencies>
        <dependency>
            <groupId>junit</groupId>
            <artifactId>junit</artifactId>
            <version>4.12</version>
            <scope>test</scope>
        </dependency>

        <!-- 引入Spring依赖   -->
        <dependency>
            <groupId>org.springframework</groupId>
            <artifactId>spring-context</artifactId>
            <version>5.3.20</version>
        </dependency>

        <dependency>
            <groupId>org.springframework</groupId>
            <artifactId>spring-tx</artifactId>
            <version>3.0.5.RELEASE</version>
        </dependency>

        <dependency>
            <groupId>org.springframework</groupId>
            <artifactId>spring-jdbc</artifactId>
            <version>5.2.5.RELEASE</version>
        </dependency>

        <!--  automation scanner   -->
        <!-- https://mvnrepository.com/artifact/javax.annotation/javax.annotation-api -->
        <dependency>
            <groupId>javax.annotation</groupId>
            <artifactId>javax.annotation-api</artifactId>
            <version>1.3.2</version>
        </dependency>


        <!-- https://mvnrepository.com/artifact/org.springframework/spring-aop -->
        <dependency>
            <groupId>org.springframework</groupId>
            <artifactId>spring-aop</artifactId>
            <version>5.3.22</version>
        </dependency>
        <!-- https://mvnrepository.com/artifact/org.springframework/spring-beans -->
        <dependency>
            <groupId>org.springframework</groupId>
            <artifactId>spring-beans</artifactId>
            <version>5.3.22</version>
        </dependency>
        <!-- https://mvnrepository.com/artifact/org.springframework/spring-core -->
        <dependency>
            <groupId>org.springframework</groupId>
            <artifactId>spring-core</artifactId>
            <version>5.3.22</version>
        </dependency>
        <!-- https://mvnrepository.com/artifact/org.springframework/spring-expression -->
        <dependency>
            <groupId>org.springframework</groupId>
            <artifactId>spring-expression</artifactId>
            <version>5.3.22</version>
        </dependency>

        <!-- mybatis -->
        <dependency>
            <groupId>org.mybatis</groupId>
            <artifactId>mybatis</artifactId>
            <version>3.5.9</version>
        </dependency>


        <!-- mysql  驱动 -->
        <dependency>
            <groupId>mysql</groupId>
            <artifactId>mysql-connector-java</artifactId>
            <version>8.0.25</version>
        </dependency>


        <!--mybatis和spring集成的-->
        <dependency>
            <groupId>org.mybatis</groupId>
            <artifactId>mybatis-spring</artifactId>
            <version>1.3.1</version>
        </dependency>

        <!--德鲁伊，数据库连接池-->
        <dependency>
            <groupId>com.alibaba</groupId>
            <artifactId>druid</artifactId>
            <version>1.1.12</version>
        </dependency>


        <!--  spring 测试 jar  -->
        <dependency>
            <groupId>org.springframework</groupId>
            <artifactId>spring-test</artifactId>
            <version>5.3.22</version>
            <scope>test</scope>
        </dependency>

        <!-- aspectj 切面编程 jar -->
        <dependency>
            <groupId>org.aspectj</groupId>
            <artifactId>aspectjweaver</artifactId>
            <version>1.9.9.1</version>
        </dependency>


        <!-- 日志打印 -->
        <dependency>
            <groupId>org.slf4j</groupId>
            <artifactId>slf4j-log4j12</artifactId>
            <version>2.0.0-alpha7</version>
        </dependency>
        <dependency>
            <groupId>org.slf4j</groupId>
            <artifactId>slf4j-api</artifactId>
            <version>2.0.0-alpha7</version>
        </dependency>

        <!-- 分页插件 -->
        <dependency>
            <groupId>com.github.pagehelper</groupId>
            <artifactId>pagehelper</artifactId>
            <version>5.3.1</version>
        </dependency>

        <!-- spring-web -->
        <dependency>
            <groupId>org.springframework</groupId>
            <artifactId>spring-web</artifactId>
            <version>5.3.22</version>
        </dependency>

        <!-- spring-webmvc -->
        <dependency>
            <groupId>org.springframework</groupId>
            <artifactId>spring-webmvc</artifactId>
            <version>5.3.22</version>
        </dependency>

        <!-- web servlet -->
        <dependency>
            <groupId>javax.servlet</groupId>
            <artifactId>javax.servlet-api</artifactId>
            <version>4.0.1</version>
            <scope>provided</scope>
        </dependency>

        <!-- json -->
        <dependency>
            <groupId>com.fasterxml.jackson.core</groupId>
            <artifactId>jackson-databind</artifactId>
            <version>2.13.3</version>
        </dependency>
        <dependency>
            <groupId>com.fasterxml.jackson.core</groupId>
            <artifactId>jackson-annotations</artifactId>
            <version>2.13.3</version>
        </dependency>
        <dependency>
            <groupId>com.fasterxml.jackson.core</groupId>
            <artifactId>jackson-core</artifactId>
            <version>2.13.3</version>
        </dependency>

        <!-- 文件上传 -->
        <dependency>
            <groupId>commons-fileupload</groupId>
            <artifactId>commons-fileupload</artifactId>
            <version>1.4</version>
        </dependency>


        <!-- https://mvnrepository.com/artifact/org.springframework.batch/spring-batch-infrastructure -->
        <dependency>
            <groupId>org.springframework.batch</groupId>
            <artifactId>spring-batch-infrastructure</artifactId>
            <version>4.3.6</version>
        </dependency>


        <!--JSTL表达式-->
        <dependency>
            <groupId>jstl</groupId>
            <artifactId>jstl</artifactId>
            <version>1.2</version>
        </dependency>

        <!--standard标签库-->
        <dependency>
            <groupId>taglibs</groupId>
            <artifactId>standard</artifactId>
            <version>1.1.2</version>
        </dependency>


    </dependencies>


    <build>
        <finalName>ssm2</finalName>
        <!-- scanner xml file-->
        <resources>
            <resource>
                <directory>src/main/resources</directory>
            </resource>

            <resource>
                <directory>src/main/java</directory>
                <includes>
                    <include>**/*.xml</include>
                    <include>**/*.properties</include>
                    <include>**/*.tld</include>
                </includes>
                <filtering>false</filtering>
            </resource>
        </resources>

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
                        <!--  根路径名 -->
                        <path>/ssm2</path>
                        <!--  端口  -->
                        <port>8080</port>
                        <uriEncoding>UTF-8</uriEncoding><!-- 非必需项 -->
                    </configuration>
                </plugin>
            </plugins>

        </pluginManagement>
    </build>
</project>
```

#### 3.1.3. 配置 spring.xml  (appliactionContext.xml)

```xml
<?xml version="1.0" encoding="UTF-8"?>
<beans xmlns="http://www.springframework.org/schema/beans"
       xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
       xmlns:context="http://www.springframework.org/schema/context"
       xmlns:mybatis="http://mybatis.org/schema/mybatis-spring" xmlns:aop="http://www.springframework.org/schema/aop"
       xsi:schemaLocation="http://www.springframework.org/schema/beans
                           https://www.springframework.org/schema/beans/spring-beans.xsd
                           http://www.springframework.org/schema/context
                           http://www.springframework.org/schema/context/spring-context.xsd http://mybatis.org/schema/mybatis-spring http://mybatis.org/schema/mybatis-spring.xsd http://www.springframework.org/schema/aop https://www.springframework.org/schema/aop/spring-aop.xsd">


    <!--  开启自动化注入  -->
    <context:annotation-config/>

    <!--  开启springIOC自动扫描  -->
    <context:component-scan base-package="com.ssm2">
        <!--  过滤对某个注解的扫描  -->
        <context:exclude-filter type="annotation" expression="org.springframework.stereotype.Controller"/>
    </context:component-scan>


    <!--  -->
    <context:property-placeholder location="classpath:db.properties"/>


    <!--  声明数据源DataSource，作用是连接数据库  -->
    <bean id="myDataSource" class="com.alibaba.druid.pool.DruidDataSource" init-method="init" destroy-method="close">

        <!--set注入提供连接数据库信息-->
        <!--        <property name="driver" value="${driver}"/>-->
        <property name="url" value="${url}"/>
        <property name="username" value="${user}"/>
        <property name="password" value="${password}"/>

    </bean>

    <bean id="SqlSessionFactory" class="org.mybatis.spring.SqlSessionFactoryBean">

        <!--  set注入，把数据库连接池付给dataSource属性  -->
        <property name="dataSource" ref="myDataSource"/>
        <!--  mybatis主配置文件的位置
                  configLocation属性是Resource类型，读取配置文件
                  它的赋值使用的是value ， 指定文件的路径，使用的是classpath：表示文件的位置
          -->
        <property name="configLocation" value="classpath:mybatis.xml"/>
    </bean>

    <bean class="org.mybatis.spring.mapper.MapperScannerConfigurer">
        <!--  指定的是SqlSessionFactory对象的id  -->
        <property name="sqlSessionFactoryBeanName" value="SqlSessionFactory"/>

        <property name="basePackage" value="com.ssm2.dao"/>
    </bean>

    <mybatis:scan base-package="com.ssm2.dao "/>


    <!--  aop  -->
    <aop:aspectj-autoproxy/>

</beans>
```

#### 3.1.4. 配置 servlet-context.xml  (springMVC)

```xml
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
    <context:component-scan base-package="com.ssm2.controller"/>

    <!--    开启注解驱动  并添加json 支持 -->
    <mvc:annotation-driven>
        <mvc:message-converters>
            <!--  返回信息为字符串时 处理  -->
            <bean class="org.springframework.http.converter.StringHttpMessageConverter"/>
            <!--  将对象转换为接送 对象 -->
            <bean class="org.springframework.http.converter.json.MappingJackson2HttpMessageConverter"/>
        </mvc:message-converters>
    </mvc:annotation-driven>

    <!--    使用默认的servlet响应静态文件  -->
    <mvc:default-servlet-handler/>


    <!--    配置视图解析器  -->
    <bean class="org.springframework.web.servlet.view.InternalResourceViewResolver"
          id="internalResourceViewResolver">
        <!--  前缀： 在WEB—INF目录下的jsp目录下  -->
        <property name="prefix" value="/WEB-INF/jsp/"/>
        <!--  后缀：以.jsp结尾的资源     -->
        <property name="suffix" value=".jsp"/>
    </bean>

    <!--  mvc 请求映射 处理器与适配器配置  -->
    <mvc:annotation-driven>
        <mvc:message-converters>
            <bean class="org.springframework.http.converter.StringHttpMessageConverter"/>
            <bean class="org.springframework.http.converter.json.MappingJackson2HttpMessageConverter"/>
        </mvc:message-converters>
    </mvc:annotation-driven>

    <!--  文件上传-->
    <bean id="multipartResolver"
          class="org.springframework.web.multipart.commons.CommonsMultipartResolver">
        <!-- 允许上传的最大尺寸 -->
        <property name="maxUploadSize">
            <value>104857600</value>
        </property>
        <property name="maxInMemorySize">
            <value>4096</value>
        </property>
    </bean>

</beans>
```

#### 3.1.5. 配置 mybatis.xml

```xml
<?xml version="1.0" encoding="UTF-8" ?>
<!DOCTYPE configuration
        PUBLIC "-//mybatis.org//DTD Config 3.0//EN"
        "http://mybatis.org/dtd/mybatis-3-config.dtd">
<configuration>

    <mappers>
        <package name="com.ssm2.dao"/>
    </mappers>

</configuration>
```

#### 3.1.6. 添加 db.properties

```properties
driver=com.mysql.cj.jdbc.Driver
url=jdbc:mysql://localhost:3306/ssm?useUnicode=true&characterEncoding=utf8
user=root
password=123456
```

#### 3.1.6. 配置 web.xml

```xml
<?xml version="1.0" encoding="UTF-8"?>
<web-app id="webApp_ID" version="3.0"
         xmlns="http://java.sun.com/xml/ns/javaee"
         xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
         xsi:schemaLocation="http://java.sun.com/xml/ns/javaee
                             http://java.sun.com/xml/ns/javaee/web-app_3_0.xsd"
         >

    <!--  启动spring容器  -->
    <context-param>
        <param-name>contextConfigLocation</param-name>
        <param-value>classpath*:spring.xml</param-value>
    </context-param>

    <!--  设置监听器  -->
    <listener>
        <listener-class>org.springframework.web.context.ContextLoaderListener</listener-class>
    </listener>

    <!-- 编码过滤 utf-8 -->
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


    <!-- servlet请求分发器  -->
    <servlet>
        <servlet-name>ssm2</servlet-name>
        <servlet-class>org.springframework.web.servlet.DispatcherServlet</servlet-class>
        <init-param>
            <param-name>contextConfigLocation</param-name>
            <param-value>classpath*:servlet-context.xml</param-value>
        </init-param>
        <!--    表示启动容器 时初始化该servlet-->
        <load-on-startup>1</load-on-startup>
    </servlet>
    <servlet-mapping>
        <servlet-name>ssm2</servlet-name>
        <url-pattern>/</url-pattern>
    </servlet-mapping>

</web-app>
```

## 4. RestFul URL

### 4.1. 基本概念

​		模型 -  视图 - 控制器 （MVC）是一个众所周知的以设计界面应用程序为基础的设计思想。

​		Restful 风格的 API 是一种软件架构风格，设计风格而不是标准，只是提供了一组设计原则和约束条件。它主要用于客户端和服务端交互类软件。基于这个风格设计可以更简洁，更有层次，更易于实现缓存等机制。

​		在Restful风格中，用户请求的url使用同一个 url ，用请求方式：get，post，delete， put...等方式对请求的处理方法进行区分，这样可以在前后台分离式的开发中使得前端开发人员不会对请求的资源地址产生混淆和大量的检查方法名的麻烦，形成一个统一的接口。

​		在 Resful 风格中，现有规定如小：

*   GET (SELECT) ： 从服务器查询，可以在服务器通过请求的参数区分查询的方法。
*   POST (CREATE) ：在服务器端新建一个资源，调用 insert 操作。
*   PUT (UPDATE) ：在服务器端更新资源（客户端提供改变的属性）。（目前 JDK7 未实现，tomcat7 不支持）
*   DELETE (DELETE) ：从服务器端删除资源，调用 delete 语句。

### 4.2. SpringMVC 支持 RestFul URL风格设计

​		案例：如何使用 Java 构建没有扩展名的RestFul url，如 /forms/1?

​		SpringMVC 是通过 @RequestMapping 以及 @PathVariable 注解提供的。

​		通过如@RequestMapping(value="/blog/{id}", method = RequestMethod.DELETE), 即可处理/blog/1 的delete请求。

### 4.3. RestFul url 映射地址配置实现

#### 4.3.1. 准备环境

##### 4.3.1.1. 添加 Account

在实体类包下创建Account.java

```java
package com.xxxx.ssm.entity;

import java.util.Date;

public class Account {

    private Integer account_id;
    private String account_name;
    private String account_type;
    private Double money;
    private String remark;
    private Date create_time;
    private Date update_time;
    private Integer user_id;
    
    /* get set 方法省略*/
}
```

##### 4.3.1.2. 添加AccountDao

```java
package com.xxxx.ssm.dao;

import com.xxxx.ssm.entity.Account;
import org.springframework.stereotype.Repository;

@Repository
public interface AccountDao {

    Account selectById(Integer id);

    int insert(Account account);

    int update(Account account);

    int deleteById(Integer id);

}
```

##### 4.3.1.3. 添加AccountMapper

```xml
<?xml version="1.0" encoding="UTF-8" ?>
<!DOCTYPE mapper
        PUBLIC "-//mybatis.org//DTD Mapper 3.0//EN"
        "http://mybatis.org/dtd/mybatis-3-mapper.dtd">
<mapper namespace="com.xxxx.ssm.dao.AccountDao">
    <select id="selectById" parameterType="int" resultType="com.xxxx.ssm.entity.Account">
        SELECT *
        FROM tb_account
        where account_id = #{id}
    </select>

    <insert id="insert" parameterType="com.xxxx.ssm.entity.Account">
        INSERT INTO tb_account
        values (null,
        #{account_name},
        #{account_type},
        #{money},
        #{remark},
        now(),
        now(),
        #{user_id})
    </insert>
    <update id="update" parameterType="com.xxxx.ssm.entity.Account">
        UPDATE tb_account
        SET account_name = #{account_name},
        account_type = #{account_type},
        money        = #{money},
        remark       = #{remark},
        update_time  = #{update_time}
        WHERE account_id = #{account_id}
    </update>

    <delete id="deleteById" parameterType="int">
        DELETE
        FROM tb_account
        WHERE account_id = #{id}
    </delete>

</mapper>
```

##### 4.3.1.4. 添加AccountService

```java
package com.xxxx.ssm.service;

import com.xxxx.ssm.dao.AccountDao;
import com.xxxx.ssm.entity.Account;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class AccountService {

    @Autowired
    private AccountDao accountDao;

    public Account select(Integer id) {
        return accountDao.selectById(id);
    }

    public int insert(Account account) {
        return accountDao.insert(account);
    }

    public int update(Account account) {
        return accountDao.update(account);
    }

    public int delete(Integer id) {
        return accountDao.deleteById(id);
    }

}
```

#### 4.3.2. URL请求地址配置

##### 4.3.2.1. GET请求配置 

```java
@RequestMapping(value = "/{id}", method = RequestMethod.GET)    /* @GetMapping*/
@ResponseBody
public Account queryAccountById(@PathVariable("id") Integer id) {
    return accountService.select(id);
}
```

##### 4.3.2.2. Delete

```java
@DeleteMapping("/{id}")
@ResponseBody
public Map<String, String> deleteAccountById(@PathVariable("id") Integer id) {

    int row = accountService.delete(id);

    Map<String, String> map = new HashMap();

    if (row > 0) {
        map.put("code", "200");
        map.put("msg", "删除成功");
    } else {
        map.put("code", "500");
        map.put("msg", "删除失败");
    }
    return map;
}

```

##### 4.3.2.3. insert

```java
@PostMapping
@ResponseBody
public Map<String, String> addAccount(@RequestBody Account account) {
    Map<String, String> map = new HashMap<>();

    int row = accountService.insert(account);

    if (row > 0) {
        map.put("code", "200");
        map.put("msg", "添加成功");
    } else {
        map.put("code", "500");
        map.put("msg", "添加失败");
    }
    return map;
}
```

##### 4.3.2.4. update

```java
@PutMapping
@ResponseBody
public Map<String, String> updateAccount(@RequestBody Account account) {
    Map<String, String> map = new HashMap<>();

    int row = accountService.update(account);

    if (row > 0) {
        map.put("code", "200");
        map.put("msg", "更新成功");
    } else {
        map.put("code", "500");
        map.put("msg", "更新失败");
    }
    return map;
}
```

## 5. 全局异常统一处理

### 5.1. 全局异常概念

​		在 JavaEE 项目中，不管是对底层的数据库操作，还是业务层的处理过程，还是控制层的处理过程，都不可避免会遇到各种可预知的、不可预知的异常需要处理。每个过程都单独处理异常，系统的代码耦合读高，工作量大且不好统一，维护工作量也很大。

​		SpringMVC 对于异常处理这块提供了支持，通过SpringMVC 提供处理机制，能够将所有类型的异常处理从处理过程解耦出来，既保证了相关处理过程的功能较单一，也实现了异常信息的统一处理和维护。全局异常实现方式 Spring MVC 处理异常有三种方式：

1.   使用Spring MVC 提供的简单异常处理器 SimpleMappingExceptionResolver
2.   实现 Spring 的异常处理接口 HandlerExceptionResolver 自定义的异常处理器
3.   使用 @ExceptionHandler 注解实现异常处理

###  5.2. 异常处理实现

#### 5.2.1. 全局异常处理方式一

##### 5.2.1.1. 配置对象

配置 SimpleMappingExceptionResolver 对象

```xml
<!--  配置全局异常统一处理的 Bean （简单异常处理器） -->
<bean class="org.springframework.web.servlet.handler.SimpleMappingExceptionResolver">

    <!--  页面在转发时出现异常，设置默认的错误页面（error代表是一个视图）  -->
    <property name="defaultErrorView" value="error"></property>
    <!--  异常发生时，设置异常的变量名 -->
    <property name="exceptionAttribute" value="ex"></property>
</bean>
```

可以在处理异常的页面获取异常信息

```jsp
${ex}
```

##### 5.2.1.2. 使用自定义异常

```java
package com.xxxx.ssm.exception;

public class ParamException extends RuntimeException {
    private Integer code = 300;
    private String msg = "参数异常！";


    public ParamException() {
        super("参数异常!");
    }

    public ParamException(String msg) {
        super(msg);
        this.msg = msg;
    }

    public ParamException(Integer code){

    }

}
```

##### 5.2.1.3. 配置自定义异常页面

```xml
<!--  设置自定义异常和页面映射 -->
<property name="exceptionMappings">
    <props>
        <!--  key代表的是自定义异常的路径，标签中设置的是具体的页面-->
        <prop key="com.xxxx.ssm.exception.ParamException">param_error</prop>
    </props>
</property>
```

​		使用 SimpleMappingExceptionResolver进行异常处理，具有集成简单、有良好的扩展性、对已有代码没有入侵等优点，但是该方法仅能获取异常信息，若在出现异常时，对需要获取异常以外的数据的情况不适用。



#### 5.2.2. 全局异常处理方式二（推荐）

```java
@Component
public class GlobalExceptionResolver implements HandlerExceptionResolver {
    @Override
    public ModelAndView resolveException(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex) {
        ModelAndView mv = new ModelAndView("error");
        mv.addObject("ex", "默认的错误信息");

        // 判断是否是自定义异常
        if (ex instanceof ParamException) {
            mv.setViewName("param_error");
            ParamException pm = (ParamException) ex;
            mv.addObject("ex",pm.getMessage());
        }
        return mv;
    }
}
```

​		使用实现 HandlerExceptionResolver 接口的异常处理器进行异常处理，具有集成简单、有良好的扩展性、对已有代码没有侵入性等优点，同时，在异常处理时获取导致异常出现的对象，有利于提供更详细的异常处理信息。



#### 5.2.3. 全局异常处理方式三

页面处理器继承 BaseController

```java
/***
 *  若要使用该异常处理器，对应的Controller需要继承此类，对代码有侵入性，不建议使用 
 */
public class BaseController {

    @ExceptionHandler
    public String exc(HttpServletRequest request, HttpServletResponse response, Exception ex) {

        request.setAttribute("ex", ex);

        return "error";
    }
}
```

### 5.3. 未捕获异常的处理

​		对于 Unchecked Exception 而言，由于代码不强制捕获，往往被忽略，如果运行时产生了Unchecked Exception，而代码中又没有进行相应的捕获和处理，则我们可能不得不面对尴尬的 404、500..... 等服务器内部错误提示页面。

​		此时需要一个全面而有效的异常处理机制。目前大多数服务器都支持在 web.xml 中通过<error-page>(Websphere/weblogic)或者<erroe-code>(Tomcat)节点配置特定异常情况的显示页面。修改web.xml，文件增加以下内容：

```xml
<!--  出错页面定义   -->
<error-page>
    <exception-type>java.lang.Throwable</exception-type>
    <location>/500.jsp</location>
</error-page>
<error-page>
    <error-code>500</error-code>
    <location>/500.jsp</location>
</error-page>
<error-page>
    <error-code>404</error-code>
    <location>/404.jsp</location>
</error-page>
```

在webapp目录下创建404.jsp和500.jsp

























