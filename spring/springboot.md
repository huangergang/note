# SpringBoot  one

## 1. Spring框架发展史

### 1.1. Spring 1.x 时代

​		在 Spring1.x 时代，都是通过xml 文件配置bean，随着项目的不断扩大，需要将xml配置放到不同的文件中，需要频繁的在 java 类和xml配置文件中切换。

### 1.2. Spring 2.x时代

​		随着JDK 1.5带来的注解支持，Spring2.x 可以使用注解对 Bean进行声明和注入，大大的减少了xml配置文件，同时大大简化了项目开发。

究竟应该使用 xml 还是注解呢？

最佳实践：

1.   应用的基本配置用xml，比如：数据源、资源文件等；
2.   业务开发用注解，比如：Service 中注入Bean等；

### 1.3. Spring 3.x 到 Spring 4.x 到Spring 5.x

​		从 Spring 3.x 开始提供了java配置方式，使用 java配置方式可以更好的理解你配置的Bean，现在我们就处于这个时代，并且 Spring4.x 、Spring5.x、和Spring Boot都推荐使用java配置的方式。

## 2. Spring 5.x 应用零配置开发

​		Spring 框架从 5.x 版本推荐使用注解形式对 java 应用程序进行开发与配置，并且可以完全代替原始的 XML + 注解形式的开发，在使用注解形式进行项目开发与环境配置时，Spring 狂简提供了针对环境配置与业务bean开发相关注解。

### 2.1. 注解

#### 2.1.1. 声明 Bean 注解

```properties
@Component: 组件 没有明确规定其角色，作用在类级别上声明当前类为一个业务组件被 Spring IOC 容器维护

@Service: 在业务逻辑层（Service 层）类级别声明

@Repository: 在数据访问层（dao 层）类级别声明

@Controller: 在展示层（MVC）使用 标注当前类为一个控制器
```

#### 2.1.2. 注入Bean 注解

```properties
@AutoWired: Spring 官方提供注解

@Inject: JSR-330 提供注解（标准制定方）

@Resource: JSR-250 提供注解
```

​		以上三种注解在Set方法或属性上声明，一般情况下通用一般开发中更习惯声明在属性上，代码简洁清晰。基于5.x 注解配置方式简化了 XML 配置，应用程序开发与XML 环境配置均通过相关注解实现。

#### 2.1.3. Spring 5.x 中配置与Bean注解

```properties
@Configuration: 作用于类上，将当前类声明为一个配置类，相当于一个 xml 配置文件

@ComponentScan: 自动扫描指定包下标有@Repository、@Service、@Controller

@Component: 注解的类并有IOC 容器进行实例化和维护

@Bean: 作用与方法上，相当于xml 文件中<bean> 声明当前方法返回值为一个bean

@Value: 获取properties 文件指定key value值
```

### 2.2. 实例1  IOC中Bean的实例化与获取

#### 2.2.1. 创建Spring普通工程并添加坐标相关配置

在pom.xml中添加坐标相关配置

```xml
<dependencies>
    <dependency>
        <groupId>org.springframework</groupId>
        <artifactId>spring-context</artifactId>
        <version>5.3.22</version>
    </dependency>
</dependencies>

<build>
    <plugins>
        <plugin>
            <groupId>org.apache.maven.plugins</groupId>
            <artifactId>maven-compiler-plugin</artifactId>
            <version>3.8.0</version>
            <configuration>
                <!--  源代码使用的JDK版本  -->
                <source>11</source>
                <!--  需要生成的项目class文件的编译版本  -->
                <target>11</target>
                <!--  字符集编码  -->
                <encoding>utf-8</encoding>
            </configuration>
        </plugin>
    </plugins>
</build>
```

#### 2.2.2. 创建Bean对象

UserDao.java

```java
@Repository
public class UserDao {

    public void test() {
        System.out.println("UserDao ...");
    }

}
```

UserService.java

```java
@Service
public class UserService {

    @Autowired
    private UserDao userDao;

    public void test() {
        userDao.test();
        System.out.println("UserService ...");
    }
}
```

#### 2.2.3. 创建 locConfig 配置类

```java
// 将当前类声明为一个配置类
@Configuration
// 设置扫描范围
@ComponentScan("com.bean")
public class IocConfig {

}
```

#### 2.2.4. 测试

```java
public class Test {

    public static void main(String[] args) {
        // 基于java 配置类加载Spring应用的上下文环境
        AnnotationConfigApplicationContext ac = new AnnotationConfigApplicationContext(IocConfig.class);
        // 得到指定bean对象
        UserService userService = ac.getBean(UserService.class);
        userService.test();
    }
}
```

### 2.3. 实例2  @Bean注解的使用

​		使用@Bean 注解声明在方法（注意：方法名一般为bean对象名称）级别用于实例化的Bean对象。

#### 2.3.1.创建 Bean对象

AccountDao.java

```java
/* 注意此类没有添加: @Repository 注解*/
public class AccountDao {

    public void test(){
        System.out.println("AccountDao ...");
    }
}

```

#### 2.3.2. 修改IocConfig 配置类

添加返回AccountDao Bean对象方法

```java
// 将当前类声明为一个配置类
@Configuration
// 设置扫描范围
@ComponentScan("com.bean")
public class IocConfig02 {


    // @Bean注解：通常用于整合第三方的Bean对象，比如：数据源、第三方组件等
    @Bean  // 将方法的返回值交给IOC维护
    public AccountDao accountDao() {
        return new AccountDao();
    }

}
```

#### 2.3.3. 测试

```java
public class Test02 {

    public static void main(String[] args) {
        // 基于java 配置类加载Spring应用的上下文环境
        AnnotationConfigApplicationContext ac = new AnnotationConfigApplicationContext(IocConfig02.class);
        // 得到指定bean对象
        IocConfig02 iocConfig02 = ac.getBean(IocConfig02.class);
        AccountDao accountDao = iocConfig02.accountDao();
        accountDao.test();
    }
}
```

### 2.4. 实例3  读取外部配置文件

​		在开发 java web 应用时，配置文件是比较常见的，如 xml、properties、yml等文件，在Spring 应用中对于配置文件的读取同样提供支持。对于配置文件读取，我们可以通过 @PropertySource 注解声明到类级别来指定读取相关配置。

​		Spring El 表达式语言，支持XML 和注解中使用表达式，类似与 JSP 中的 EL 表达式，Spring 框架借助该表达式实现资源注入，主要通过 @Value 注解来使用表达式，通过 @Value 注解，可是实现普通字符串，表达式运算结果，Bean 属性文件内容，属性文件等参数注入。具体使用如下：

#### 2.4.1. 准备配置文件

```properties
# db.properties
driver=com.mysql.cj.jdbc.Driver
url=jdbc:mysql://localhost:3306/ssm?useUnicode=true&characterEncoding=utf8
user=root
password=123456

#user.properties
user.name=frank
user.password=12345678
```

#### 2.4.2. @PropertySource 加载配置文件

通过@PropertySource 加载properties文件

```java
// 将当前类声明为一个配置类
@Configuration
@PropertySource(value = {"classpath:db.properties", "classpath:user.properties"})
public class IocConfig03 {


    @Value("${driver}")
    private String driver;
    @Value("${url}")
    private String url;
    @Value("${user}")
    private String user;
    @Value("${password}")
    private String password;

    @Value("${user.name}")
    private String userName;
    @Value("${user.password}")
    private String userPwd;

    public void print() {
        System.out.println("driver = " + driver);
        System.out.println("url = " + url);
        System.out.println("user = " + user);
        System.out.println("password = " + password);

        System.out.println("--------------------------");
        System.out.println("userName = " + userName);
        System.out.println("userPwd = " + userPwd);

    }

}
```

#### 2.4.3. 其他Bean对象获取properties文件内容

```java
@Service
public class UserService {

    @Autowired
    private UserDao userDao;


    @Value("${driver}")
    private String driver;
    @Value("${url}")
    private String url;
    @Value("${user}")
    private String user;
    @Value("${password}")
    private String password;

    public void test() {
        userDao.test();
        System.out.println("UserService ...");

        System.out.println("driver = " + driver);
        System.out.println("url = " + url);
        System.out.println("user = " + user);
        System.out.println("password = " + password);

    }
}
```

#### 2.4.4. 测试

```java
public class Test03 {

    public static void main(String[] args) {
        // 基于java 配置类加载Spring应用的上下文环境
        AnnotationConfigApplicationContext ac = new AnnotationConfigApplicationContext(IocConfig03.class);
        // 得到指定bean对象
        IocConfig03 iocConfig03= ac.getBean(IocConfig03.class);

        iocConfig03.print();
    }
}
```

### 2.5. 组合注解与元注解

​		Spring从 2.x 版本开始引入注解支持（目的是 jdk 1.5 中退出注解功能），通过引入注解来消除大量 xml 配置，Spring 引入注解主要用来注入 bean 以及 aop 切面相关配置，但由于注解大量使用，就会造成大量重复注解代码出现，代码出现了重复，Spring为了消除重复注解，在元注解上引入了组合注解，其实可以理解为代码的重构，拥有 @Component 注解功能，即使配置类本身也是一个被 IOC 维护的单例 Bean。

#### 2.5.1. 自定义组合注解

定义 MyCompScan 注解，拥有 @ComponentScan扫描注解功能

```java
@Configuration
@ComponentScan
public @interface MyCompScan {

    String[] value() default {};
}  
// 同时具有@Configuration、@ComponentScan注解的功能
```

## 3. Spring MVC 零配置创建与部署

​		基于 Spring MVC 5.x 使用maven 搭建 Spring MVC Web项目，通过 Spring 提供的注解与相关配置来对项目进行创建与部署。

### 3.1. 创建Spring MVC Web工程

创建 Maven 的 web 项目

### 3.2. pom.xml

```xml
<dependencies>
    <!--  spring web  -->
    <dependency>
        <groupId>org.springframework</groupId>
        <artifactId>spring-web</artifactId>
        <version>5.3.22</version>
    </dependency>

    <!-- spring mvc  -->
    <dependency>
        <groupId>org.springframework</groupId>
        <artifactId>spring-webmvc</artifactId>
        <version>5.3.22</version>
    </dependency>

    <!--  servlet  -->
    <dependency>
        <groupId>javax.servlet</groupId>
        <artifactId>servlet-api</artifactId>
        <version>2.5</version>
    </dependency>


</dependencies>

<build>
    <finalName>springboot</finalName>
    <plugins>
        <plugin>
            <groupId>org.apache.maven.plugins</groupId>
            <artifactId>maven-compiler-plugin</artifactId>
            <version>3.8.0</version>
            <configuration>
                <!--  源代码使用的JDK版本  -->
                <source>11</source>
                <!--  需要生成的项目class文件的编译版本  -->
                <target>11</target>
                <!--  字符集编码  -->
                <encoding>utf-8</encoding>
            </configuration>
        </plugin>
    </plugins>
</build>
```

### 3.3. 添加源代码

```java
@Controller
public class HelloController {

    @RequestMapping("/index")
    public String index() {
        return "index";
    }

}
```

### 3.4. 添加视图

在 WEB-INF/views 目录下创建index.jsp

```html
<body>
    <h2>
        hello springboot
    </h2>
</body>
```

### 3.5. Spring MVC 配置类添加

​		Spring MVC 配置信息 MvcConfig 文件添加，作为MVC框架环境，原来是通过 xml 来进行配置（视图解析器、JSON转化器、文件上传解析器等），这里基于注解通过继承 WebMvcConfigurerAdapter 类并重写相关方法来进行配置（注意通过 @EnableWebMvc 注解来启动 MVC 环境）。

```java
/* 配置类 */
@Configuration
/* 在@Configuration 注解的配置类中添加，用于为该应用程序添加SpringMVC 的功能 */
@EnableWebMvc
/* 扫描包范围 */
@ComponentScan("com.springboot")
public class MvcConfig {


    /***
     * 配置 JSP 视图解析器
     */
    @Bean
    public InternalResourceViewResolver viewResolver() {
        // 获取视图解析器
        InternalResourceViewResolver viewResolver = new InternalResourceViewResolver();
        // 设置前缀
        viewResolver.setPrefix("/WEB-INF/views/");
        // 设置后缀
        viewResolver.setSuffix(".jsp");

        return viewResolver;
    }

}
```

### 3.6. 入口文件代码添加

```java
public class WebInitializer implements WebApplicationInitializer {
    @Override
    public void onStartup(ServletContext servletContext) throws ServletException {
        // 得到Spring应用的上下文环境
        AnnotationConfigWebApplicationContext act = new AnnotationConfigWebApplicationContext();
        // 注册 MVC 配置类
        act.register(MvcConfig.class);
        // 设置ServletContext的上下文环境信息
        act.setServletContext(servletContext);
        // 配置转发器 Dispatcher
        ServletRegistration.Dynamic servlet = servletContext.addServlet("dispatcher", new DispatcherServlet(act));
        // 设置映射路径
        servlet.addMapping("/");
        // 启动是实例化Bean
        servlet.setLoadOnStartup(1);

    }
}
```

### 3.7. 部署与测试

在项目中添加Tomcat并访问

配置拦截器：在配置类实现WebMvcConfigurationSupport

## 4. SpringBoot 概念与特点

### 4.1. 框架概念

​		随着动态语言

































# SpringBoot  two