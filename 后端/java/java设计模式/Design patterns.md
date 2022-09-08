# Java设计模式

## 1.从面向对象到函数式编程

### 1.2.java编程范式

#### 1. **命令式编程**

#### 2. **面向对象编程**

 面向对象的四个基本原则

* 封装
* 抽象
* 继承
* 多态

#### 3. **声明式编程**

#### 4. **函数式编程**

### 1.4.类之间的关系

* 泛化和实现
* 依赖
* 关联、聚合和组合

### 1.5.设计模式和原则

#### 1.单一职责原则

#### 2.开闭原则

#### 3.里氏替换原则

#### 4.接口隔离原则

#### 5.依赖倒置原则

## 2.创建型模式

### 2.1.单例模式

<img src="..\java设计模式\img\singleton.png">

单例模式（singleton pattern）。保证一个对象只能创建一个实例。

单例模式创建的方法，私有的单例构造器，在通过静态的get方法获取单例实例。

<hr>

1. 最实用的单例方法

``` java
public class Singleton1 {

    private static final Singleton1 INSTANCE = new Singleton1();

    private Singleton1() {
    }


    public static Singleton1 getINSTANCE() {
        return INSTANCE;
    }

    public static void main(String[] args) {

        for (int i = 0; i < 100; i++) {
            new Thread(() -> {
                System.out.println(getINSTANCE().hashCode());
            }).start();
        }

    }


}
```

2. 懒汉式，线程不安全

```java
public class Singleton2 {

    private Singleton2(){}
    
    private static Singleton2 instance;

    public static Singleton2 getInstance() {
        if (instance == null)
            instance = new Singleton2();
        return instance;
    }

    public static void main(String[] args) {

        for (int i = 0; i < 100; i++) {
            new Thread(() -> {
                System.out.println(getInstance().hashCode());
            }).start();
        }

    }
}
```

3. 添加synchronized保证线程安全

```java
public class Singleton2 {

    private Singleton2(){}
    
    private static Singleton2 instance;

    public static synchronized Singleton2 getInstance() {
        if (instance == null) {
            try {
                Thread.sleep(1);
            } catch (InterruptedException e) {
                e.printStackTrace();
            }
            instance = new Singleton2();
        }

        return instance;
    }

    public static void main(String[] args) {

        for (int i = 0; i < 100; i++) {
            new Thread(() -> {
                System.out.println(getInstance().hashCode());
            }).start();
        }

    }
}
```

4. 静态内部类方法

```java
public class Singleton3 {

    private Singleton3() {
    }

    private static class SingletonHolder {
        private static Singleton3 instance = new Singleton3();
    }


    public static Singleton3 getInstance() {
        return SingletonHolder.instance;
    }

    public static void main(String[] args) {

        for (int i = 0; i < 100; i++) {
            new Thread(() -> {
                System.out.println(getInstance().hashCode());
            }).start();
        }

    }
}
```

5. 枚举单例

```java
public enum Singleton8 {

    INSTANCE;

    public static void main(String[] args) {

        for (int i = 0; i < 100; i++) {
            new Thread(() -> {
                System.out.println(INSTANCE.hashCode());
            }).start();
        }

    }
}
```

<hr>

#### 2.1.1.同步锁单例模式

```java
public class Singleton {

    private Singleton(){}
    
    private static Singleton instance;

    public static synchronized Singleton getInstance() {
        if (instance == null) 
            instance = new Singleton2();
        return instance;
    }

}
```

#### 2.1.2.双重检验锁机制的同步锁单例模式

```java
public class Singleton {


    private Singleton() {}

    private static Singleton instance;

    public static synchronized Singleton getInstance() {
        
        if (instance == null) {
            synchronized (Singleton.class) {
                if (instance == null)
                    instance = new Singleton();
            }
        }
        return instance;
    }

}
```

#### 2.1.3.无锁的线程安全单例模式

类只会加载一次。

```java
public class Singleton1 {

    private static final Singleton1 INSTANCE = new Singleton1();

    private Singleton1() {
    }

    public static Singleton1 getINSTANCE() {
        return INSTANCE;
    }

}
```

#### 2.1.4.提前加载和延迟加载

​	在应用开始时创建单例实例，称为提前加载单例模式；在getInstance方法调用时才调用单例构造器，称为延迟加载单例模式。

​	类加载的时机主要取决于JVM的实现机制。

​	可以在程序开始时调用getInstance提前实例化实例。

### 2.2.工厂模式



