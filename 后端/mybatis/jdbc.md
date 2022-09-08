# 一、 ORM框架的发展历程

## 1.JDBC操作

依赖

```XML
<dependency>
    <groupId>mysql</groupId>
    <artifactId>mysql-connector-java</artifactId>
    <version>8.0.29</version>
</dependency>
```

### 1.1. jdbc使用1.0

```java
package com.jdbc.v1;


import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

public class JdbcImpl {

    final static String driver = "com.mysql.cj.jdbc.Driver";
    final static String url = "jdbc:mysql://localhost:3306/ssm?useUnicode=true&characterEncoding=utf8";
    final static String user = "root";
    final static String password = "123456";

    public static void main(String[] args) throws Exception {

        /* 1.加载驱动程序 */
        Class.forName(driver);

        /* 2.获得数据库链接 */
        Connection connection = DriverManager.getConnection(url, user, password);

        /* 3.获得数据库操作对象 */
        Statement statement = connection.createStatement();


        // 查询语句
        String queryAll = "SELECT * FROM user";

        // 查询到的结果集
        ResultSet resultset = statement.executeQuery(queryAll);



        // 遍历数据
        while (resultset.next()) {
            int id = resultset.getInt("id");
            String name = resultset.getString("name");

            System.out.println("id = " + id + " ,name = " + name);
        }


        // 关闭资源
        statement.close();
        connection.close();
        resultset.close();

    }

}
```

### 1.2. jdbc使用2.0

1.   **JDBC工具类封装**

```java
package com.jdbc.v2;

import java.sql.*;

public class JDBCUtil {

    final static String driver = "com.mysql.cj.jdbc.Driver";
    final static String url = "jdbc:mysql://localhost:3306/ssm?useUnicode=true&characterEncoding=utf8";
    final static String user = "root";
    final static String password = "123456";


    // 封装获取数据库链接对象
    public static Connection getConnection() throws SQLException {
        return DriverManager.getConnection(url, user, password);
    }


    /* 重载封装资源关闭 */
    public static void close(Connection connection, PreparedStatement preparedStatement) throws SQLException {
        if (connection != null) {
            connection.close();
        }
        if (preparedStatement != null) {
            preparedStatement.close();
        }
    }
    /* 重载封装资源关闭 */
    public static void close(Connection connection, PreparedStatement preparedStatement, ResultSet resultSet) throws SQLException {
        if (connection != null) {
            connection.close();
        }
        if (preparedStatement != null) {
            preparedStatement.close();
        }
        if (resultSet != null) {
            resultSet.close();
        }

    }


}
```

2.   **使用**

```java
package com.jdbc.v2;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class JdbcImpl02 {

    public static void main(String[] args) throws Exception {

        Connection connection = JDBCUtil.getConnection();


        String queryAll = "SELECT * FROM user";

        PreparedStatement preparedStatement = connection.prepareStatement(queryAll);

        ResultSet resultSet = preparedStatement.executeQuery();

        // 遍历数据
        while (resultSet.next()) {
            int id = resultSet.getInt("id");
            String name = resultSet.getString("name");

            System.out.println("id = " + id + " ,name = " + name);
        }


        JDBCUtil.close(connection, preparedStatement, resultSet);

    }

}
```

### 1.3. jdbc使用3.0

1.   **引入配置文件解耦合（配置文件放在src目录下）** 

     ```properties
     driver=com.mysql.cj.jdbc.Driver
     url=jdbc:mysql://localhost:3306/ssm?useUnicode=true&characterEncoding=utf8
     user=root
     password=123456
     ```

2.   **JDBC工具类封装**

     ```java
     package com.jdbc.v3;
     
     import java.io.InputStream;
     import java.sql.*;
     import java.util.Properties;
     
     public class JDBCUtil {
     
         private static String url;
         private static String user;
         private static String password;
     
         /* 静态代码读取配置文件 */
         static {
             try {
                 InputStream inputStream = ClassLoader.getSystemResourceAsStream("db.properties");
     
                 Properties properties = new Properties();
                 properties.load(inputStream);
     
                 url = properties.getProperty("url");
                 user = properties.getProperty("user");
                 password = properties.getProperty("password");
     
             } catch (Exception e) {
                 e.printStackTrace();
             }
         }
     
     
         // 封装获取数据库链接对象
         public static Connection getConnection() throws SQLException {
             return DriverManager.getConnection(url, user, password);
         }
     
     
         /* 重载封装资源关闭 */
         public static void close(Connection connection, PreparedStatement preparedStatement) throws SQLException {
             if (connection != null) {
                 connection.close();
             }
             if (preparedStatement != null) {
                 preparedStatement.close();
             }
         }
     
         /* 重载封装资源关闭 */
         public static void close(Connection connection, PreparedStatement preparedStatement, ResultSet resultSet) throws SQLException {
             if (connection != null) {
                 connection.close();
             }
             if (preparedStatement != null) {
                 preparedStatement.close();
             }
             if (resultSet != null) {
                 resultSet.close();
             }
     
         }
     
     
     }
     ```

3.   **使用**

     ```java
     package com.jdbc.v3;
     
     import java.sql.Connection;
     import java.sql.PreparedStatement;
     import java.sql.ResultSet;
     
     public class JdbcImpl03 {
     
         public static void main(String[] args) throws Exception {
     
             Connection connection = JDBCUtil.getConnection();
     
     
             String queryAll = "SELECT * FROM user";
     
             PreparedStatement preparedStatement = connection.prepareStatement(queryAll);
     
             ResultSet resultSet = preparedStatement.executeQuery();
     
             // 遍历数据
             while (resultSet.next()) {
                 int id = resultSet.getInt("id");
                 String name = resultSet.getString("name");
     
                 System.out.println("id = " + id + " ,name = " + name);
             }
     
     
             JDBCUtil.close(connection, preparedStatement, resultSet);
     
         }
     
     }
     ```

## 2.Apache DBUtils

-   [ ] TODO

## 3.Spring JDBC

[SpringJDBC.md](../spring/Spring JDBC.md)

## 4.Hibernate

### 4.1. ORM介绍

​		ORM(Object Relation Mapping)，也就是对象与关系的映射，对象是程序中的实体类对象，关系是它与数据库里面的数据的关系，也就是说，ORM框架帮助我们解决的问题是程序对象和关系型数据库的相互映射的问题。

## 5.Mybatis

[官网地址](https://mybatis.org/mybatis-3/zh/)

​		MyBatis 是一款优秀的持久层框架，它支持自定义 SQL、存储过程以及高级映射。MyBatis 免除了几乎所有的 JDBC 代码以及设置参数和获取结果集的工作。MyBatis 可以通过简单的 XML 或注解来配置和映射原始类型、接口和 Java POJO（Plain Old Java Objects，普通老式 Java 对象）为数据库中的记录。

# 二、 Mybatis的使用

