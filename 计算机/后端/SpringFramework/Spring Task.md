# Spring Task 定时任务

## 1. 定时任务概述

每隔一定时间执行。

如发送邮件。

## 2. XML实现

### 2.1. 引入坐标

```XML
<dependency>
    <groupId>org.springframework</groupId>
    <artifactId>spring-context</artifactId>
    <version>5.3.20</version>
</dependency>
```

开启spring自动化扫描

```XML
<!-- 扫描范围的配置 -->
<context:component-scan base-package="com.xxxx.task"/>
```

### 2.2. spring.xml配置

命令空间

```XML
xmlns:task="http://www.springframework.org/schema/task"
```

```XML
http://www.springframework.org/schema/task
http://www.springframework.org/schema/task/spring-task.xsd
```

### 2.3. 定义类

```java
import org.springframework.stereotype.Component;

import java.text.SimpleDateFormat;
import java.util.Date;

@Component
public class TestJob {

    public void job01() {

        System.out.println("任务01: " + new SimpleDateFormat("yyyy-MM-dd  hh:mm:ss").format(new Date()));

    }

    public void job02() {

        System.out.println("任务02: " + new SimpleDateFormat("yyyy-MM-dd  hh:mm:ss").format(new Date()));

    }
}
```

### 2.4. xml配置定时任务映射

```XML
<!-- 配置定时任务 -->
<task:scheduled-tasks>
    <!--  定时任务1  每隔2秒执行-->
    <task:scheduled ref="testJob" method="job01" cron="0/2 * * * * ?"/>
    <!--  定时任务2  每隔10秒执行 -->
    <task:scheduled ref="testJob" method="job02" cron="0/10 * * * * ?"/>
</task:scheduled-tasks>
```

## 3. 注解实现

**引入spring框架，并开启自动化扫描。**

### 3.1. 开启定时任务驱动

```XML
<task:annotation-driven />
```

### 3.2. 定义类

**@Scheduled**注解用来声明定时任务方法

```java
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import java.text.SimpleDateFormat;
import java.util.Date;

@Component
public class TestJob {

    @Scheduled(cron = "0/2 * * * * ?")
    public void job01() {

        System.out.println("任务01: " + new SimpleDateFormat("yyyy-MM-dd  hh:mm:ss").format(new Date()));

    }


    @Scheduled(cron = "0/10 * * * * ?")
    public void job02() {

        System.out.println("任务02: " + new SimpleDateFormat("yyyy-MM-dd  hh:mm:ss").format(new Date()));

    }
}
```

## 4. Cron表达式

Cron表达式是一个字符串，分为6或7个域，每一个域代表一个含义，Cron有如下两种语法格式：

年一般都会省略不写。

Seconds  Minutes  Hours  DayofMonth  Month  DayofWeek  Year

秒           分           时         天                 月         周                 年

Seconds  Minutes  Hours  DayofMonth  Month  DayofWeek

秒           分            时         天                 月         周  

域的取值
域	值	可用通配符	LWC#可用通配符
Seconds/秒

0-59的整数

*   /   ？ ,

 

Minutes/分

0-59的整数

*   /   ？ ,

 

Hours/时

0-23的整数

*   /   ？ ,

 

DayofMonth/天

1-31的整数（注意每个月的天数）

*   /   ？ ,

L W C

Month/月

1-12的整数或英文简称

*   /   ？ ,

 

DayofWeek/周

1-7的整数或英文简称（1代表星期天）

*   /   ？ ,

L C  #

Year/年

1970-2099

*   /   ？ ,

 

下面解释各个通配符的含义

*  ：表示匹配该域的任意值，比如 * 30 12 9 12 ？2020  表示 2020年12月9日12点30的每秒钟都会执行。
? ：只能用在DayofMonth和DayofWeek 域中，以为这两个域时冲突存在的，所以当使用其中一个时，另一个域的值为 ？。比如 ：* 30 12 9 12 ？2020，我们设置了DayofMonth/天的值，DayofWeek/周 域的值必须用 ？表示。
- ：表示匹配范围内的值，比如 ：0-30 30 12 9 12 ？2020  表示 2020年12月9日12点30的前30秒都会执行。
/ ：表示每隔固定时间执，/ 之前的值表示的开始时间，/ 之后的值表示的间隔时间 。比如：0-3 30 12 9 12 ？2020  表示 2020年12月9日12点30分 从0开始每隔3秒执行一次。
, ：表示列举值（可以是多个）。比如 00,20,30 30 12 9 12 ？2020  表示 2020年12月9日12点30分 的 10秒，20秒，30秒，都会执行。
- L ：表示最后，只能用在DayofMonth和DayofWeek 域中，但是在这两个域中有所区别。当在DayofMonth 时，表示每月最后一天，比如 0 30 12 L 12 ？2020  表示 2020年12月31日12点30分整 执行。当在DayofWeek中时，前面加上数字，表示每月的最后一个星期几，比如0 30 12 ？ 12 6L 2020  表示 2020年12月的最后一个星期五的12点30分整 执行。
- W ：表示指定日期最近的工作日（周一到周五）。只能用在DayofMonth 域中，比如0 30 12 12W 12 ？2020  表示 距离2020年12月12日最近的工作日的12点30分整 执行。也经常用LW表示每个月的最后一个工作日。
- \# ：表示每月的第几个星期几。只能用在DayofWeek 域中，#之前的值时表示星期几。#之后的值表示的是第几个星期。0 30 12 ? 12 6#32020  表示 2020年12月的第三个星期五的12点30分整 执行。
- C ：该字符只在DayofMonth和DayofWeek域中使用，代表“Calendar”的意思。它的意思是计划所关联的日期，如果日期没有被关联，则相当于日历中所有日期。例如5C在日期字段中就相当于日历5日以后的第一天。1C在星期字段中相当于星期日后的第一天

<hr>

**在线生成Cron网站**

https://cron.qqe2.com/

