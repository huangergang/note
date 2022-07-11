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

1. 

``` java

public class Singleton1 {

    private static final Singleton1 INSTANCE = new Singleton1();

    private Singleton1() {
    }


    // 测试线程是否安全
    public static void main(String[] args) {

        for (int i = 0; i < 100; i++) {
            new Thread(() -> {
                System.out.println(Singleton1.INSTANCE.hashCode());
            }).start();
        }

    }

}
```

2. 

```java

```



