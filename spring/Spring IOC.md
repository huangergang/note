# Spring IOC

## 1.Spring框架

### 1.1.引入依赖

在maven仓库中找到spring的依赖jar包，放到项目中。或者在maven项目中的XML中直接添加依赖。

```XML
<!-- 引入Spring依赖   -->
<!-- https://mvnrepository.com/artifact/org.springframework/spring-context -->
<dependency>
    <groupId>org.springframework</groupId>
    <artifactId>spring-context</artifactId>
    <version>5.3.20</version>
</dependency>
```

### 1.2.创建配置文件

在maven目录结构中的main目录下，创建与java目录同级的resources目录标记为资源目录。

<img src="..\spring\img\resources.png">

该目录下放置XML映射。

可以新建一个配置文件，文件格式需遵守spring配置文件的XML格式。

```XML
<?xml version="1.0" encoding="UTF-8"?>
<beans xmlns="http://www.springframework.org/schema/beans"
       xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
       xsi:schemaLocation="http://www.springframework.org/schema/beans
        https://www.springframework.org/schema/beans/spring-beans.xsd">

    <!-- 
		bean标签的作用是映射JavaBean对象
  			id: 是类的类名（首字母小写）
			class: 是类的全限定名
-->
    
    <bean id="user" class="com.xxxx.dao.User"></bean>
    <bean id="userService" class="com.xxxx.service.UserService"></bean>

</beans>
```

### 1.3.获取上下文环境

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

## 2.Spring IOC模拟

思路：

1. 定义Bean工厂接口，提供getBean方法
2. 定义Bean工厂接口实现类，解析配置文件，实例化Bean对象
3. 实现getBean方法

### 2.1.定义Bean属性对象

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

### 2.2.添加dom4j和XPath依赖

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

### 2.3.准备配置文件

```XML
<?xml version="1.0" encoding="UTF-8" ?>

<beans>
    <bean id="user" class="com.xxxx.dao.User"></bean>
    <bean id="student" class="com.xxxx.dao.Student"></bean>
</beans>
```

### 2.4.定义Bean工厂接口

```java
package com.xxxx.spring;

public interface BeanFactory {
    Object getBean(String id);
}
```

### 2.5.定义Bean接口的实现类

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

    private Map map = new HashMap();
    private List<MyBean> list;


    public MyApplicationContext(String filName) {
        this.parseXML(filName);
        this.instanceBean();
    }


    // 解析配置文件
    private void parseXML(String fileName) {

        SAXReader saxReader = new SAXReader();
        URL url = this.getClass().getClassLoader().getResource(fileName);

        
		// 用XPATH的语法解析bean.xml，获取其中的id和class
        try {
            Document document = saxReader.read(url);
            XPath xPath = document.createXPath("beans/bean");
            List<Element> elements = xPath.selectNodes(document);

            list = new ArrayList<>();
            if (elements != null && elements.size() > 0) {
                for (Element e : elements) {
                    String id = e.attributeValue("id");
                    String clazz = e.attributeValue("class");
                    MyBean bean = new MyBean(id, clazz);
                    list.add(bean);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

    }


    // 通用反射的方式创建Bean对象，并存储在map中
    private void instanceBean() {
        if (list.size() > 0 && list != null) {
            for (MyBean b : list) {
                try {
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

### 2.6.测试模拟的IOC容器

```java
package com.xxxx.dao;

import com.xxxx.spring.MyApplicationContext;

public class Test {
    public static void main(String[] args) {
        MyApplicationContext factory = new MyApplicationContext("bean.xml");
        User user = (User) factory.getBean("user");
        user.test();
    }
}
```

## 3.Spring 加载配置文件

### 3.1.加载配置文件

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

#### 3.1.1.根据相对路径加载资源

```java
ApplicationContext ac = new ClassPathXmlApplicationContext("spring.xml");
```

#### 3.1.2.根据绝对路径加载资源

```java
    ApplicationContext ac = new FileSystemXmlApplicationContext( "C:\\Users\\turing\\Desktop\\spring\\src\\main\\resources\\spring.xml");
```

### 3.2.加载多个配置文件

#### 3.2.1.可变参数

有两个配置文件spring.xml和bean.xml

```java
ApplicationContext ac = new ClassPathXmlApplicationContext("spring.xml","bean.xml");  // ClassPathXmlApplicationContext支持可变参数
```

#### 3.2.2.通过总配置文件import导入其他配置文件

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

## 4.Spring IOC 容器对Bean对象的实例化

### 4.1.构造器实例化

IOC默认使用空构造器实例化。

Bean对象必须有空构造器。

### 4.2.静态工厂实例化

注：

* 要有该工厂类及工厂方法
* 工厂方法为静态的

1. 定义静态工厂

```java
package com.xxxx.factory;

public class StudentFactory {

    public static Student createStudent() {
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

### 4.3.实例化工厂实例化

注：

* 工厂方法为静态方法
* 需要设置工厂bean，并在业务bean中配置factory-bean，factory-method属性

1. 定义工厂类

```java
package com.xxxx.factory;

public class PersonFactory {

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

   <bean id="personFactory" class="com.xxxx.factory.PersonFactory" ></bean>
    <bean id="person" factory-bean="personFactory" factory-method="creatPerson"></bean>
</beans>
```

### 4.4.三种方式的比较

* 方式一：通过bean默认的构造器创建，当各个bean的业务逻辑相比较独立的时候或者和外界关联较少的时候可以使用。
* 方式二：利用静态factory方式创建，可以同一管理各个bean的创建，如各个bean在创建之前需要相同的初始化处理，则可用factory方法进行同一的处理等。
* 方式三：利用实例化factory方法创建，即将factory方法也作为业务bean来控制，1可用于集成其他框架的bean创建管理方法，2可以使bean和factory的角色互换。

**开发中一般使用第一种方式实例化bean。交给Spring托管。另外两种了解即可。**

## 5.Spring IOC 注入

### 问题的产生

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

在一个类中需要为作为类属性的其他类使用set方法完成实例化，从外部传参进行的实例化称为注入。

### 5.1.Spring IOC 手动装配（注入）

#### 5.1.1.set方法注入

注：

* 属性字段需要提供set方法
* 四种方式，推荐使用set方法注入

##### 5.1.1.1.业务对象JavaBean

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

##### 5.1.1.2常用对象和基本类型



##### 5.1.1.3.集合类型和属性对象 



## 6.Spring IOC 扫描器

## 7.Bean的作用域和生命周期
