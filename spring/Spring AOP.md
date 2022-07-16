# Spring AOP

## 1.代理模式

* **Subject** (共同接口）：客户端使用的现有接口
* **RealSubject**（真实对象）：真实对象的类
* **ProxySubject**（代理对象）：代理类

<img src="..\java设计模式\img\proxy.png">

​	代理模式（英语：Proxy Pattern）是程序设计中的一种设计模式。
​	所谓的代理者是指一个类别可以作为其它东西的接口。代理者可以作任何东西的接口：网络连接、存储器中的大对象、文件或其它昂贵或无法复制的资源。

​	著名的代理模式例子为引用计数（英语：reference counting）指针对象。

​	当一个复杂对象的多份副本须存在时，代理模式可以结合享元模式以减少存储器用量。典型作法是创建一个复杂对象及多个代理者，每个代理者会引用到原本的复杂对象。而作用在代理者的运算会转送到原本对象。一旦所有的代理者都不存在时，复杂对象会被移除。

## 2.静态代理

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

## 3.动态代理

​	相比与静态代理，动态代理在创建代理对象上更加灵活，动态代理采用反射创建代理类，可以创建不同需求的代理类。

​	动态代理的两种实现方式：

					1. JDK   动态代理
					1. CGLIB  动态代理

### 3.1.动态代理的特点

1. 目标对象不固定
2. 在应用程序执行时动态创建目标对象
3. 代理对象会增强目标对象的行为

### 3.2.JDK 动态代理

