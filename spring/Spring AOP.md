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

#### 3.2.1.获取

```java
RealClass real = new RealClass();

JDKHandler proxy = new JDKHandler(real);

Subject subProxy = (Subject) proxy.getProxy();

subProxy.doSomething();
```

### 3.3.CGLIB动态代理

​	实现原理：继承思想

#### 3.3.1.添加依赖

​	在pom.xml文件中引入cglib的相关依赖

```xml
<dependency>
    <groupId>cglib</groupId>
    <artifactId>cglib</artifactId>
    <version>3.3.0</version>
</dependency>
```

#### 3.3.2.定义类

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

#### 3.3.3.获取

```java
RealSubject real = new RealSubject();

CglibInterceptor cglibInterceptor = new CglibInterceptor(real);

RealSubject proxy = (RealSubject) cglibInterceptor.getProxy();

proxy.doSomething();
```

#### 3.3.4.区别

* JDK动态代理实现接口，Cglib动态代理继承思想
* JDK动态代理（目标对象存在接口时）执行效率高于Cglib
* 如果目标对象有接口实现选JDK，无选择Cglib

## 4.Spring AOP

​	Spring框架的关键组件之一是**面向切面编程**(AOP)。 面向方面的编程需要将程序逻辑分解成不同的部分。 跨越应用程序的多个点的功能被称为交叉切割问题，这些交叉关切在概念上与应用程序的业务逻辑分开。有如：日志记录，审计，声明式事务，安全性和缓存等方面的各种常见的的例子。

### 4.1.AOP特点

​	AOP主要应用于日志记录，性能统计，安全控制，事物处理等方面，实现公共功能性的重复使用。

特点：

1. 降低模块与模块之间的耦合度，提高业务代码的聚合度。（高内聚底耦合）
2. 提高了代码的复用性。
3. 提高了系统的扩展性。（高版本兼容底版本）
4. 可以在不影响原有的功能基础上添加新功能。

#### 4.1.1.底层实现

​	动态代理（JDK+CGLIB）

### 4.2.AOP基本概念

#### 4.2.1.Joinpoint（连接点）

​	被拦截到的每个点，spring中指被拦截到的每一个方法，是spring aop一个连接点即代表一个方法的执行。

#### 4.2.2.Pointcut（切入点）

​	对连接点进行拦截的定义（匹配规则定义 规定拦截那些方法，对哪些方法进行处理），spring有专门的表达式语言定义。

#### 4.2.3.Advice（通知）

​	拦截到每一个连接点即（每一个方法）后要做的动作。

1. 前置通知（前置增强）—before() 执行方法前通知
2. 返回通知（返回增强）—afterReturn() 方法正常结束返回后的通知
3. 异常抛出通知（异常抛出增强）—afterThrow()
4. 最终通知 — after 无论方法是否发生异常，均会执行该通知
5.  环绕通知 — around 包围一个连接点（join point）的通知，如方法调用。这是最强大的一种通知类型。环绕通知开一在方法调用前后完成自定义的行为。它也会选择是否继续执行连接点或直接返回它们的返回值或抛出异常来结束执行。

#### 4.2.4.Aspect（切面）

​	切入点与通知的结合，决定了切面的定义，切入点定义了要拦截那些类的哪些方法，通知则定义了拦截过方法后要做什么，切面则是横切关注点的抽象，与类相似，类是对物体特征的抽象，切面则是横切关注点抽象。

#### 4.2.5.Target（目标对象）

​	被代理的目标对象

#### 4.2.6.Weave（织入）

​	将切面应用到目标对象并生成代理对象的过程称为织入

#### 4.2.7.Introduction（引入）

​	在不修该原有应用程序代码的情况下，在程序运行期为类动态添加方法或者字段的过程称为引入

### 4.3.AOP 实现





