# Spring IOC

## 1. Spring框架

### 1.1. 引入依赖

​	在maven仓库中找到spring的依赖jar包，放到项目中。或者在maven项目中的XML中直接添加依赖。

```XML
<!-- 引入Spring依赖   -->
<!-- https://mvnrepository.com/artifact/org.springframework/spring-context -->
<dependency>
    <groupId>org.springframework</groupId>
    <artifactId>spring-context</artifactId>
    <version>5.3.20</version>
</dependency>
```

### 1.2. 创建配置文件

​	在maven目录结构中的main目录下，创建与java目录同级的resources目录标记为资源目录。

<img src=".\img\resources.png">

​	该目录下放置XML映射。

​	可以新建一个配置文件，文件格式需遵守spring配置文件的XML格式。

```XML
<?xml version="1.0" encoding="UTF-8"?>
<beans xmlns="http://www.springframework.org/schema/beans"
       xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
       xsi:schemaLocation="http://www.springframework.org/schema/beans
        				   https://www.springframework.org/schema/beans/spring-beans.xsd">

<!-- 

	配置javabean对象映射：

		bean标签的作用是映射JavaBean对象
  			id: 是类的类名（首字母小写）
			class: 是类的全限定名
-->

    <bean id="user" class="com.xxxx.dao.User"></bean>
    <bean id="userService" class="com.xxxx.service.UserService"></bean>

</beans>
```

### 1.3. 获取上下文环境

```java
public class Test {

    public static void main(String[] args) {
          // 1. 解析配置文件
        ApplicationContext application = new ClassPathXmlApplicationContext("spring.xml");
         // 2. 获取JavaBean的实例
        User user = (User) application.getBean("user");  

        user.test();
    
    }
}
```

## 2. Spring IOC模拟

思路：

1. 定义Bean工厂接口，提供getBean方法
2. 定义Bean工厂接口实现类，解析配置文件，实例化Bean对象
3. 实现getBean方法

### 2.1. 定义Bean属性对象

```java
public class MyBean {
    private String id;
    private String clazz;

    public MyBean(String id, String clazz) {
        this.id = id;
        this.clazz = clazz;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getClazz() {
        return clazz;
    }

    public void setClazz(String clazz) {
        this.clazz = clazz;
    }
}
```

### 2.2. 添加dom4j和XPath依赖

```XML
// dom4j依赖
<dependency>
    <groupId>dom4j</groupId>
    <artifactId>dom4j</artifactId>
    <version>1.1</version>
</dependency>


// XPATH 依赖
<dependency>
    <groupId>jaxen</groupId>
    <artifactId>jaxen</artifactId>
    <version>1.1.6</version>
</dependency>
```

### 2.3. 准备配置文件

```XML
<?xml version="1.0" encoding="UTF-8" ?>
<beans>
    <bean id="user" class="com.xxxx.dao.User"></bean>
    <bean id="student" class="com.xxxx.dao.Student"></bean>
</beans>
```

### 2.4. 定义Bean工厂接口

```java
package com.xxxx.spring;

public interface BeanFactory {
    Object getBean(String id);
}
```

### 2.5. 定义Bean接口的实现类

```java
package com.xxxx.spring;

import java.net.URL;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.dom4j.*;
import org.dom4j.io.SAXReader;


public class MyApplicationContext implements BeanFactory {

    // 存放bean的id和实例化好的bean实例
    private Map<String, Object> map = new HashMap();

    // 存放从xml中解析到的类名和类的class值
    private List<MyBean> list;


    public MyApplicationContext(String filName) {
        this.parseXML(filName);
        this.instanceBean();
    }


    // 解析配置文件
    private void parseXML(String fileName) {


        // 解析器
        SAXReader saxReader = new SAXReader();

        // 获取文件路径
        URL url = this.getClass().getClassLoader().getResource(fileName);


        try {

            // 文档对象
            Document document = saxReader.read(url);

            // XPath解析语法
            XPath xPath = document.createXPath("beans/bean");

            // 获取Element元素集合
            List<Element> elements = xPath.selectNodes(document);

            list = new ArrayList<>();

            if (elements != null && elements.size() > 0) {
                for (Element e : elements) {

                    // 获取id对映的value值
                    String id = e.attributeValue("id");

                    // 获取class对映的value值
                    String clazz = e.attributeValue("class");

                    // 实例化对象
                    MyBean bean = new MyBean(id, clazz);

                    // 添加到list中
                    list.add(bean);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

    }


    // 实例化Bean，并且存放到map
    private void instanceBean() {
        if (list.size() > 0 && list != null) {
            for (MyBean b : list) {
                try {

                    // 将类名和类的实例存放进map
                    map.put(b.getId(), Class.forName(b.getClazz()).getDeclaredConstructor().newInstance());

                } catch (Exception e) {
                    e.printStackTrace();
                }
            }
        }

    }

    @Override
    public Object getBean(String id) {
        Object object = map.get(id);
        return object;
    }
}

```

### 2.6. 测试模拟的IOC容器

```java
package com.xxxx.dao;

import com.xxxx.spring.MyApplicationContext;

public class Test {
    public static void main(String[] args) {
        MyApplicationContext ac = new MyApplicationContext("bean.xml");
        User user = (User) ac.getBean("user");
        user.test();
    }
}
```



## 3. Spring 加载配置文件

### 3.1. 加载配置文件

spring.xml

```XML
<?xml version="1.0" encoding="UTF-8"?>
<beans xmlns="http://www.springframework.org/schema/beans"
    xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
    xsi:schemaLocation="http://www.springframework.org/schema/beans
        https://www.springframework.org/schema/beans/spring-beans.xsd">

    <bean id="..." class="...">  
        <!-- collaborators and configuration for this bean go here -->
    </bean>

    <bean id="..." class="...">
        <!-- collaborators and configuration for this bean go here -->
    </bean>

    <!-- more bean definitions go here -->

</beans>
```

#### 3.1.1. 根据相对路径加载资源

```java
ApplicationContext ac = new ClassPathXmlApplicationContext("spring.xml");
```

#### 3.1.2. 根据绝对路径加载资源

```java
    ApplicationContext ac = new FileSystemXmlApplicationContext( "C:\\Users\\turing\\Desktop\\spring\\src\\main\\resources\\spring.xml");
```

### 3.2. 加载多个配置文件

#### 3.2.1. 可变参数

​	有两个配置文件spring.xml和bean.xml

```java
ApplicationContext ac = new ClassPathXmlApplicationContext("spring.xml","bean.xml");  // ClassPathXmlApplicationContext支持可变参数
```

#### 3.2.2. 通过总配置文件import导入其他配置文件

```XML
<?xml version="1.0" encoding="UTF-8"?>
<beans xmlns="http://www.springframework.org/schema/beans"
       xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
       xsi:schemaLocation="http://www.springframework.org/schema/beans
                           https://www.springframework.org/schema/beans/spring-beans.xsd">

    <!--加载多个被配置文件-->
    <import resource="spring.xml"/>
    <import resource="bean.xml"/>
</beans>
```

## 4. Spring IOC 容器对Bean 对象的实例化

### 4.1. 构造器实例化

​	**IOC默认使用空构造器实例化。**

​	**Bean对象必须有空构造器。**

### 4.2. 静态工厂实例化

注：

* 要有该工厂类及工厂方法
* 工厂方法为静态的

1. 定义静态工厂

```java
package com.xxxx.factory;


/* 定义静态工厂类，用来实例化Student类 */
public class StudentFactory {

    public static Student createStudent() {
        
        // 返回Student实例
        return new Student();
    }
}

```

2. 设置配置文件

```XML
<?xml version="1.0" encoding="UTF-8"?>
<beans xmlns="http://www.springframework.org/schema/beans"
       xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
       xsi:schemaLocation="http://www.springframework.org/schema/beans
                           https://www.springframework.org/schema/beans/spring-beans.xsd">


    <!--  静态工厂实例化  -->

    <bean id="student" class="com.xxxx.factory.StudentFactory" factory-method="createStudent"></bean>

</beans>
```

静态工厂实例化把实例化的工作交给了我们定义的静态工厂，不再有Spring IOC容器负责。**可以给实例化的类先设置一些属性。**

### 4.3. 实例化工厂实例化

注：

* 工厂方法为静态方法
* 需要设置工厂bean，并在业务bean中配置factory-bean，factory-method属性

1. 定义工厂类

```java
package com.xxxx.factory;

/* 定义实例化工厂 */
public class PersonFactory {

    // 方法是成员方法
    public Person creatPerson() {
        return new Person();
    }
}

```

2. 设置配置文件

```XML
<?xml version="1.0" encoding="UTF-8"?>
<beans xmlns="http://www.springframework.org/schema/beans"
       xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
       xsi:schemaLocation="http://www.springframework.org/schema/beans
        https://www.springframework.org/schema/beans/spring-beans.xsd">

    <!--  实例化工厂实例化  -->

    <!-- 定义工厂bean  -->
   <bean id="personFactory" class="com.xxxx.factory.PersonFactory" ></bean>
    
    <!-- 指定实例化bean的工厂方法  -->
    <bean id="person" factory-bean="personFactory" factory-method="creatPerson"></bean>
</beans>
```

### 4.4. 三种方式的比较

**三种实例化bean都是单例模式。**

* 方式一：通过bean默认的构造器创建，当各个bean的业务逻辑相比较独立的时候或者和外界关联较少的时候可以使用。
* 方式二：利用静态factory方式创建，可以同一管理各个bean的创建，如各个bean在创建之前需要相同的初始化处理，则可用factory方法进行同一的处理等。
* 方式三：利用实例化factory方法创建，即将factory方法也作为业务bean来控制，1可用于集成其他框架的bean创建管理方法，2可以使bean和factory的角色互换。

​	**开发中一般使用第一种方式实例化bean。交给Spring托管。另外两种了解即可。**

## 5. Spring IOC 注入

​	**注入是指在其他类中依赖其他类的实例 。**



**问题的产生**

```java
package com.xxxx.service;

import com.xxxx.dao.User;

public class UserService {

    private User user;

    public void setUser(User user) {
        this.user = user;
    }

}

```

​	在一个类中需要为作为类属性的其他类使用set方法完成实例化，从外部传参进行的实例化称为注入。

### 5.1. Spring IOC 手动装配（注入）

#### 5.1.1. set 方法注入

注：

* 属性字段需要提供set方法
* 四种方式，推荐使用set方法注入

##### 5.1.1.1. 业务对象JavaBean

1. 属性字段需要提供set方法

```java
package com.xxxx.service;

import com.xxxx.dao.Dao;

public class Service {

    private Dao dao;

    public void setDao(Dao dao) {
        this.dao = dao;
    }

    public void test(){
        dao.test();
        System.out.println("service...");
    }
}
```

2. 配置文件中的bean标签设置peoperty标签

```XML
<?xml version="1.0" encoding="UTF-8"?>
<beans xmlns="http://www.springframework.org/schema/beans"
       xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
       xsi:schemaLocation="http://www.springframework.org/schema/beans
                           https://www.springframework.org/schema/beans/spring-beans.xsd">


    <bean id="dao" class="com.xxxx.dao.Dao"></bean>


    <!-- peoperty标签 
   name：代表bean对象中的属性字段名称
   ref：代表bean标签中的id值
-->
    <bean id="service" class="com.xxxx.service.Service">
        <property name="dao" ref="dao"/>
    </bean>

</beans>
```

##### 5.1.1.2. 常用对象和基本类型

​	必须提供set方法。

```XML
<!-- value : 具体的值，String ， int ， ... List, map ... -->

<bean id="service" class="com.xxxx.service.Service">
        <property name="host" value="127.0.0.1"/>
    	<property name="port" value="8080"/>
</bean>
```

##### 5.1.1.3. 集合类型和属性对象 

1. List：

```XML
<bean id="service" class="com.xxxx.service.Service">
    <property name="list">
        <list>
        <value>上海</value>
        <value>北京</value>
        <value>杭州</value>
        </list>
    </property>
</bean>
```

2. set：

```XML
<bean id="service" class="com.xxxx.service.Service">
    <property name="set">
        <set>
        <value>上海</value>
        <value>北京</value>
        <value>杭州</value>
        </set>
    </property>
</bean>
```

3. map：

```XML
<bean id="service" class="com.xxxx.service.Service">
    <property name="map">
        <map>
       		<entry>
                <key>美国</key>
                <value>华盛顿</value>
            </entry>
            <entry>
                <key>中国</key>
                <value>北京</value>
            </entry>
            <entry>
                <key>巴西</key>
                <value>巴西利亚</value>
            </entry>
        </map>
    </property>
</bean>
```

4. properties:

```XML
<bean id="service" class="com.xxxx.service.Service">
    <property name="properties">
        <props>
             <prop key="BJ">北京</prop>
             <prop key="SH">上海</prop>
             <prop key="HZ">杭州</prop>
        </props>
    </property>
</bean>
```

#### 5.1.2. 构造器注入

注：

* 提供带参构造

##### 5.1.2.1. 单个Bean对象作为参数

```XML
<bean id="dao" class="com.xxxx.dao.Dao"></bean>
    
<bean id="service" class="com.xxxx.service.Service">
    <constructor-arg name="dao" ref="dao"></constructor-arg>
</bean>
```

##### 5.1.2.2. 多个Bean对象作为参数

```XML
<bean id="dao" class="com.xxxx.dao.Dao"></bean>
<bean id="student" class="com.xxxx.dao.Student"></bean>

<bean id="service" class="com.xxxx.service.Service">
    <constructor-arg name="dao" ref="dao"></constructor-arg>
    <constructor-arg name="student" ref="student"></constructor-arg>
</bean>
```

##### 5.1.2.3. 常用类型作为参数

```XML
<bean id="dao" class="com.xxxx.dao.Dao"></bean>
<bean id="student" class="com.xxxx.dao.Student"></bean>

<bean id="service" class="com.xxxx.service.Service">
    <constructor-arg name="dao" ref="dao"></constructor-arg>
    <constructor-arg name="student" ref="student"></constructor-arg>
    <constructor-arg name="uname" value="turing"></constructor-arg>
</bean>
```

##### 5.1.2.4. 循环依赖的问题

​	两个Bean对象的实例化相互依赖。

​	如果出现循环依赖，需要通过set注入解决。

#### 5.1.3. 静态工厂注入

```XML
<bean id="student" class="com.xxxx.factory.StudentFactory" factory-method="createStudent"></bean>
```

#### 5.1.4. 实例化工厂注入

```XML
<bean id="person" factory-bean="personFactory" factory-method="creatPerson">
</bean>
```

#### 5.1.5. 注入方式的选择

​	开发中首选set方式注入

**p名称空间的使用**

1. 属性字段提供set方法

```java
package com.xxxx.dao;

public class UserService {
    
    private Dao dao;

    public void setDao(Dao dao) {
        this.dao = dao;
    }
    
    private String host;

    public void setHost(String host) {
        this.host = host;
    }
    
}
```

2. 在配置文件中引入p名称空间

```XML
xmlns:p="http://www.springframework.org/schema/p"
```

```XML
<bean id="userService" class="com.xxxx.dao.UserService"
      p:dao-ref="dao"
      p:host="127.0.0.1
              ">
</bean>
```

### 5.2. Spring IOC自动装配（注入）

​	通过注解和反射简化配置文件的繁琐。

#### 5.2.1. 准备环境

1. 修改XML

```XML
<beans xmlns="http://www.springframework.org/schema/beans"
       xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
       xmlns:context="http://www.springframework.org/schema/context"
       xsi:schemaLocation="http://www.springframework.org/schema/beans
                           https://www.springframework.org/schema/beans/spring-beans.xsd
                           http://www.springframework.org/schema/context
                           http://www.springframework.org/schema/context/spring-context.xsd">
```

2. 开启自动化注入

```XML
<!-- 开启自动化注入 -->
<context:annotation-config/>

<bean id="dao" class="com.xxxx.dao.Dao"></bean>
```

3. 给注入的bean对象添加注解

4. pom.xml引入javax.annotation环境

```XML
<!-- https://mvnrepository.com/artifact/javax.annotation/javax.annotation-api -->
<dependency>
    <groupId>javax.annotation</groupId>
    <artifactId>javax.annotation-api</artifactId>
    <version>1.3.2</version>
</dependency>
```

#### 5.2.2. @Resource

可以实现自动注入（反射）

* 属性字段与bean字段一致
* 如果属性字段与bean字段不一致，则通过类型去查找
* 属性字段可以提供set方法，也可以不提供
* 注解可以声明在属性字段上，也可以在set方法上
* 注解可以设置name属性，name属性值与bean的id一致，使用name查找bean
* 注入接口（只有一个实现类）时可以正常注入，当有多个实现类时必须使用name。

#### 5.2.3. @Autowired

@Autowired实现自动化注入

* 默认通过（Class类型）查找bean对象，与属性名称无关
* 属性字段可以提供set方法，也可以不提供
* 注解可以声明在属性字段上，也可以在set方法上
* 没有name字段，若想使用name查找bean，可以提供一个@Qualifier（value=“da”）

## 6. Spring IOC 扫描器

简化自动化注入，无需手动配置bean标签

```md
1. 设置自动化扫描的范围
	如果bean对象未在指定包范围，即使声明了注解也无法实例化
2. 使用指定的注解（声明在类级别）
	Dao层：
		@Repository
	Service层：
		@Service
	Controller层
		@Contorller
	任意类
		@Component
```

1. 设置自动化扫描范围

```XML
<?xml version="1.0" encoding="UTF-8"?>
<beans xmlns="http://www.springframework.org/schema/beans"
       xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
       xmlns:context="http://www.springframework.org/schema/context"
       xsi:schemaLocation="http://www.springframework.org/schema/beans
                           https://www.springframework.org/schema/beans/spring-beans.xsd
                           http://www.springframework.org/schema/context
                           http://www.springframework.org/schema/context/spring-context.xsd">

    <!-- 扫描范围的配置 获取bean时类名小写-->
    <context:component-scan base-package="com.xxxx"/>  

</beans>
```

2. 在需要实例化的类上添加指定注解

```java
@Repository
public class Dao {

    public void test(){
        System.out.println("Dao...");
    }
    
}
```



## 7. Bean的作用域和生命周期

### 7.1. Bean的作用域

​	**默认情况下，从spring容器中拿到的对象均为单例。**

#### 7.1.1. singleton作用域

​	默认在spring容器启动时，单例已经加载到单例缓存池中了，可以在xml配置时，对bean标签使用lazy-init属性，其意为是否在spring容器启动时实例化bean。当lazy-init=“true”，表示在spring容器启动时不会实例化bean，而是在程序调用时才会实例化。默认为false。

```xml
<bean id="user" class="com.xxxx.dao.User" lazy-init="true"></bean>
```

#### 7.1.2. prototype作用域

​	spring IOC容器在启动时，不会将bean对象的实例化设置到单例缓存池中。

​	每次实例化一个新的实例。非单例。

​	在bean配置中设置scope属性为prototype。

```xml
<bean id="user" class="com.xxxx.dao.User" scope="prototype"></bean>
```

#### 7.1.3. Web应用中的作用域

1. **request作用域**

2. **session作用域**

3. **globalSession作用域**

### 7.2. Bean的生命周期

​	**在spring中，Bean的生命周期包含Bean的定义、初始化、使用和销毁4个阶段。**



#### 7.2.1. Bean的定义

​	在spring中，通常通过配置文档（xml）的方式来定义Bean。

​	在一个配置文夹中可以定义多个Bean。

#### 7.2.2. Bean的初始化

​	默认在IOC容器加载时，实例化对象。

Sping bean初始化的两种方式：

​	**方式一：**在配置文档中通过指定init-method属性来完成。

 ```java
 public class User {
 
     public void init(){
         System.out.println("User init ...");
     }
     
 }
 ```

```XML
<bean id="user" class="com.xxxx.dao.User" scope="prototype" init-method="init"></bean>
```

​	**方式二：**实现org.springframework.factory.InitializingBean接口

```java
import org.springframework.beans.factory.InitializingBean;

public class User implements InitializingBean {

    @Override
    public void afterPropertiesSet() throws Exception {
        System.out.println("User init ...");
    }
}
```

#### 7.2.3. Bean的使用

有两种

**方式一：**ApplicationContext获取

```java
// 获取上下文环境
ApplicationContext ac = new ClassPathXmlApplicationContext("spring.xml");
User user = (User) ac.getBean("user");
```

**方式二：**BeanFactory获取

```java
// 获取上下文环境
BeanFactory ac = new ClassPathXmlApplicationContext("spring.xml");
User user = (User) ac.getBean("user");
```

#### 7.2.4. Bean的销毁

​	实现销毁方法。

​	**步骤一：**实现销毁方式

```xml
<bean id="user" class="com.xxxx.dao.User" scope="prototype" destroy-method="destroy"></bean>
```

​	**步骤二：**调用close方法实现bean的销毁

```java
AbstractApplicationContext ac = new ClassPathXmlApplicationContext("spring.xml");
ac.close();
```



<hr style="background-color:red">

# Spring AOP

## 1. 代理模式

* **Subject** (共同接口）：客户端使用的现有接口
* **RealSubject**（真实对象）：真实对象的类
* **ProxySubject**（代理对象）：代理类

<img src="C:\Users\莫\Desktop\note\后端\SpringFramework\img\proxy.png">

​	代理模式（英语：Proxy Pattern）是程序设计中的一种设计模式。
​	所谓的代理者是指一个类别可以作为其它东西的接口。代理者可以作任何东西的接口：网络连接、存储器中的大对象、文件或其它昂贵或无法复制的资源。

​	著名的代理模式例子为引用计数（英语：reference counting）指针对象。

​	当一个复杂对象的多份副本须存在时，代理模式可以结合享元模式以减少存储器用量。典型作法是创建一个复杂对象及多个代理者，每个代理者会引用到原本的复杂对象。而作用在代理者的运算会转送到原本对象。一旦所有的代理者都不存在时，复杂对象会被移除。

## 2. 静态代理

三要素：

1. 共同的行为 	 -----     行为接口

2. 真实角色          -----     实体类
3. 代理角色          -----     代理类

​	行为接口

```java
public interface Subject {

    // 定义行为
    void doSomething();

}
```

​	实体类

```java
public class RealSubject implements Subject {

    @Override
    public void doSomething() {

        // ...

        //  System.out.println("doSomething...");

    }

}
```

​	代理类

```java
public class ProxySubject implements Subject {

    // 引用真实类
    private Subject target;

    
    public ProxySubject(Subject target) {
        this.target = target;
    }


    @Override
    public void doSomething() {

        before();

        target.doSomething();

        after();

    }


    private void before() {

        // 调用方法前，增强用户行为
        // ...

        System.out.println("Proxy before...");

    }

    private void after() {

        // 调用方法后，增强用户行为
        // ...

        System.out.println("Proxy after...");

    }

}

```

**弊端：**

​	**每增强一个行为必创建一个新的代理类，当有大量需求时，意味要编写大量的代理类。不够灵活。**

## 3. 动态代理

​	相比与静态代理，动态代理在创建代理对象上更加灵活，动态代理采用反射创建代理类，可以创建不同需求的代理类。

​	动态代理的两种实现方式：

```java
1. JDK   动态代理
2. CGLIB  动态代理
```

### 3.1. 动态代理的特点

1. 目标对象不固定
2. 在应用程序执行时动态创建目标对象
3. 代理对象会增强目标对象的行为

### 3.2. JDK 动态代理

```java
import java.lang.reflect.InvocationHandler;
import java.lang.reflect.Method;
import java.lang.reflect.Proxy;

// 实现InvocationHandler接口
public class JDKHandler implements InvocationHandler {

    // 目标对象
    private Object target;

    
    public JDKHandler(Object target) {
        this.target = target;
    }

    
    // 增强行为
    @Override
    public Object invoke(Object proxy, Method method, Object[] args) throws Throwable {

        // System.out.println("调用前增强...");

        
        // 调用目标对象中的方法
        Object object = method.invoke(target, args);
        

        // System.out.println("调用后增强...");

        return object;
    }


	// 获取代理类
    public Object getProxy(){
        Object object = Proxy.newProxyInstance(this.getClass().getClassLoader(), target.getClass().getInterfaces(),this);
        return object;
    }

}
```

#### 3.2.1. 获取

```java
RealClass real = new RealClass();

JDKHandler proxy = new JDKHandler(real);

Subject subProxy = (Subject) proxy.getProxy();

subProxy.doSomething();
```

### 3.3. CGLIB动态代理

​	实现原理：继承思想

#### 3.3.1. 添加依赖

​	在pom.xml文件中引入cglib的相关依赖

```xml
<dependency>
    <groupId>cglib</groupId>
    <artifactId>cglib</artifactId>
    <version>3.3.0</version>
</dependency>
```

#### 3.3.2. 定义类

​	实现MethodInterceptor接口

```java
import net.sf.cglib.proxy.Enhancer;
import net.sf.cglib.proxy.MethodInterceptor;
import net.sf.cglib.proxy.MethodProxy;

import java.lang.reflect.Method;

public class CglibInterceptor implements MethodInterceptor {
 
    // 目标对象
    private Object target;

    public CglibInterceptor(Object target) {
        this.target = target;
    }

    
    // 获取代理类
    public Object getProxy() {

        Enhancer enhancer = new Enhancer();

        enhancer.setSuperclass(target.getClass());

        enhancer.setCallback(this);
        
        return enhancer.create();  //通过Enhancer类的create()方法创建代理类
    }


    @Override
    public Object intercept(Object o, Method method, Object[] objects, MethodProxy methodProxy) throws Throwable {
        
        // System.out.println("调用前增强...");

        Object object = method.invoke(target, objects);

        
        // System.out.println("调用后增强...");

        return object;
    }
    
}
```

#### 3.3.3. 获取

```java
RealSubject real = new RealSubject();

CglibInterceptor cglibInterceptor = new CglibInterceptor(real);

RealSubject proxy = (RealSubject) cglibInterceptor.getProxy();

proxy.doSomething();
```

#### 3.3.4. 区别

* JDK动态代理实现接口，Cglib动态代理继承思想
* JDK动态代理（目标对象存在接口时）执行效率高于Cglib
* 如果目标对象有接口实现选JDK，无选择Cglib

## 4. Spring AOP

​	Spring框架的关键组件之一是**面向切面编程**(AOP)。 面向方面的编程需要将程序逻辑分解成不同的部分。 跨越应用程序的多个点的功能被称为交叉切割问题，这些交叉关切在概念上与应用程序的业务逻辑分开。有如：日志记录，审计，声明式事务，安全性和缓存等方面的各种常见的的例子。

### 4.1. AOP 特点

​	AOP主要应用于日志记录，性能统计，安全控制，事物处理等方面，实现公共功能性的重复使用。

特点：

1. 降低模块与模块之间的耦合度，提高业务代码的聚合度。（高内聚底耦合）
2. 提高了代码的复用性。
3. 提高了系统的扩展性。（高版本兼容底版本）
4. 可以在不影响原有的功能基础上添加新功能。

#### 4.1.1. 底层实现

​	动态代理（JDK+CGLIB）

### 4.2. AOP 基本概念

#### 4.2.1. Joinpoint（连接点）

​	被拦截到的每个点，spring中指被拦截到的每一个方法，是spring aop一个连接点即代表一个方法的执行。

#### 4.2.2. Pointcut（切入点）

​	对连接点进行拦截的定义（匹配规则定义 规定拦截那些方法，对哪些方法进行处理），spring有专门的表达式语言定义。

#### 4.2.3. Advice（通知）

​	拦截到每一个连接点即（每一个方法）后要做的动作。

1. 前置通知（前置增强）—before() 执行方法前通知
2. 返回通知（返回增强）—afterReturn() 方法正常结束返回后的通知
3. 异常抛出通知（异常抛出增强）—afterThrow()
4. 最终通知 — after 无论方法是否发生异常，均会执行该通知
5. 环绕通知 — around 包围一个连接点（join point）的通知，如方法调用。这是最强大的一种通知类型。环绕通知开一在方法调用前后完成自定义的行为。它也会选择是否继续执行连接点或直接返回它们的返回值或抛出异常来结束执行。

#### 4.2.4. Aspect（切面）

​	切入点与通知的结合，决定了切面的定义，切入点定义了要拦截那些类的哪些方法，通知则定义了拦截过方法后要做什么，切面则是横切关注点的抽象，与类相似，类是对物体特征的抽象，切面则是横切关注点抽象。

#### 4.2.5. Target（目标对象）

​	被代理的目标对象

#### 4.2.6. Weave（织入）

​	将切面应用到目标对象并生成代理对象的过程称为织入

#### 4.2.7. Introduction（引入）

​	在不修该原有应用程序代码的情况下，在程序运行期为类动态添加方法或者字段的过程称为引入



## 5. Spring AOP的实现

### 5.1. 环境搭建

#### 5.1.1. 坐标依赖引入

```XML
<dependency>
    <groupId>org.aspectj</groupId>
    <artifactId>aspectjweaver</artifactId>
    <version>1.9.9.1</version>
</dependency>
```

#### 5.1.2. 添加spring.xml的配置

添加命令空间

```xml
xmlns:aop="http://www.springframework.org/schema/aop"
```

```xml
http://www.springframework.org/schema/aop 
https://www.springframework.org/schema/aop/spring-aop.xsd
```

### 5.2. 注解实现

#### 5.2.1. 定义切面

```java
import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.*;
import org.springframework.stereotype.Component;

@Component
@Aspect   // 声明这是一个切面
public class LogCut02 {

    /**
     * 切入点
     * 		定义要拦截哪些类的哪些方法
     * 		匹配规则，拦截什么方法
     * 
     * 定义切入点
     * 
     *	@Pointcut("匹配规则") AOP切入点表达式
     *      1. 所有公共方法
     *        execution(public *(..))
     *      2. 任意的set方法
     *        execution(* set*(..))
     *      3. 设置指定包下的任意类的任意方法
     *        execution(* com.xxx.service.*.*(..))
     *      4. 设置指定包及其子包下的任意类的任意方法
     *        execution(* com.xxx.service..*.*(..))
     */

    @Pointcut("execution(* com.summer.service..*.*(..))")
    public void cut() {

    }
    
	// 前置通知
    @Before(value = "cut()")
    public void before() {
        System.out.println("before...");
    }


	// 返回通知（方法正常执行无异常）
    @AfterReturning(value = "cut()")
    public void afterReturn() {
        System.out.println("afterReturning...");
    }

    // 异常通知（方法抛出无异常）
    @AfterThrowing(value = "cut()")
    public void afterThrow() {
        System.out.println("afterThrow...");
    }

	// 最终通知 (方法是否抛出异常都会执行)
    @After(value = "cut()")
    public void after() {
        System.out.println("after...");
    }

	// 环绕通知 
    @Around(value = "cut()")
    public Object around(ProceedingJoinPoint pjp) {
        
        //环绕通知-前置通知
        System.out.println("around-Before...");

        Object o = null;

        try {

            // 显示调用对应方法
            o = pjp.proceed();
            System.out.println(pjp.getTarget());
            
            //环绕通知-返回通知
            System.out.println("around-AfterReturning...");
        }catch (Throwable throwable){
            throwable.printStackTrace();
                        
            //环绕通知-异常通知
            System.out.println("around-AfterThrowing...");
        }

         //环绕通知-最终通知
        System.out.println("around-after...");

        return o;
    }
}
```

#### 5.2.2. spring.xml 开启配置

```xml
<aop:aspectj-autoproxy/>
```



### 5.3. XML实现

xml配置

```XML
<aop:config>
    <!-- aop 切面  -->
    <aop:aspect ref="logCut03">
        <!-- 切入点-->
        <aop:pointcut id="cut" expression="execution(* com.summer.service..*.*(..))"/>
        <!-- 前置通知   -->
        <aop:before method="before" pointcut-ref="cut"/>
        <!-- 返回通知   -->
        <aop:after-returning method="afterReturn" pointcut-ref="cut"/>
        <!-- 异常通知   -->
        <aop:after-throwing method="afterThrow" pointcut-ref="cut"/>
        <!-- 最终通知   -->
        <aop:after method="after" pointcut-ref="cut"/>
        <!-- 环绕通知   -->
        <aop:around method="around" pointcut-ref="cut"/>
    </aop:aspect>
</aop:config>
```

定义类

```java
import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.AfterThrowing;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Pointcut;
import org.springframework.stereotype.Component;

@Component
public class LogCut03 {


    public void cut() {

    }

    public void before() {
        System.out.println("before...");
    }


    public void afterReturn() {
        System.out.println("afterReturning...");
    }

    public void afterThrow() {
        System.out.println("afterThrow...");
    }


    public void after() {
        System.out.println("after...");
    }


    public Object around(ProceedingJoinPoint pjp) {
        System.out.println("around-Before...");

        Object o = null;

        try {
            // 显示调用对应方法
            o = pjp.proceed();
            System.out.println(pjp.getTarget());
            System.out.println("around-AfterReturning...");
        }catch (Throwable throwable){
            throwable.printStackTrace();
            System.out.println("around-AfterThrowing...");
        }

        System.out.println("around-after...");

        return o;
    }
}
```







