# MySQL-------必知必会

## 1.sql

SQL(Structred Query Language)的缩写，是结构化查询语言。SQL是一种专门用来与数据库通信的语言。

## 2.MySQL

MySQL是一个客户机—服务器（CS）DBMS。

## 3.使用MySQL

### 3.1.登录MySQL

~~~ shell
mysql -u root -p
~~~

### 3.2.选择一个数据库

~~~ SQL
use crashcourse;
~~~

~~~ SQL
Database changed  # 显示此消息表示数据库选择成功
~~~

### 3.3.显示所有库

``` SQL
show databases;
```

### 3.4.显示一个库内的所有表

~~~ SQL
show tables;
~~~

### 3.5.显示表的所有字段信息

~~~ SQL
show columns from student;
# 或者
desc student;
~~~

### 3.6.显示创建库和表时的MySQL语句

~~~ SQL
show create database;
# 
show create table;
~~~

### 3.7.显示授予用户的安全权限

~~~ SQL
show grants;
~~~

### 3.8.显示服务器错误或警告信息

~~~ SQL
show errors;
#
show warnings;
~~~

## 4.检索数据

### 4.1.检索一张表的某一列

~~~ SQL
select name from student;
~~~

### 4.2.检索多个列

~~~ SQL
select id,name,sex,grade from student;
~~~

### 4.3.检索所有列

~~~ SQL
select * from student;
~~~

### 4.4.检索某列的唯一字段值

~~~ SQL
select  distinct name from student;
~~~

### 4.5.限制检索行数

~~~ SQL
select name from student
limit 5;    # 显示不超过5行
~~~

### 4.6.完全限定表名

~~~ SQL
select student.name from scholl.student;
~~~

## 5.排序数据

### 5.1.按某一列正序（上小下大）

~~~ SQL
select name from student
order by name; # 字符串类型按字母顺序排序
~~~

### 5.2.按多个列排序

~~~ SQL
select grade,name from student
order by grade,name; # 先按成绩排序，在对具有相同成绩的学生姓名按字母顺序排序
~~~

### 5.3.指定排序方向

~~~SQL
select * from student
order by grade DESC;  # 按成绩由大到小，从上到下排序
~~~

### 5.4.检索某一行的最大（排序最前）值

~~~ SQL
select grade from student
order by grade
limit 1;
~~~

## 6.过滤数据

### 6.1.where子句

~~~ SQL
select * from student
where name = "frank"; # 查询名为frank的所有行数据
~~~

### 6.2.where子句操作符

|         操作符         |        说明        |
| :--------------------: | :----------------: |
|           =            |        等于        |
|           <>           |       不等于       |
|           !=           |       不等于       |
|           <            |        小于        |
|           <=           |      小于等于      |
|           >            |        大于        |
|           >=           |      大于等于      |
| between    A   and   B | A到B之间(包含A，B) |

### 6.3.空值检查

~~~ SQL
select * from student
where name is null;  # 检索姓名为null值的所有学生
~~~

### 6.4.过滤某一字段的空值

~~~ SQL
select * from student
where name is not null; 
~~~

## 7.数据过滤

### 7.1.and操作符

~~~ SQL
select * from student
where grade >= 60 and sex = '女';  #  检索成绩大于等于60，同时性别为女的学生
~~~

### 7.2.or操作符

``` SQL
select name from student
where grade = 80 or grade = 60 ;  # 检索成绩等于80或60的学生姓名
```

### 3.分组操作符

``` SQL
select name from student
where (grade = 80 or grade = 60) and sex = '女';  # 检索成绩等于80或60，并且性别为女的学生姓名
```

### 7.4.in操作符

IN操作符用来指定条件范 围，范围中的每个条件都可以进行匹配。

~~~ SQL
select grade from student
where name in ("frnak","alan");   # 检索姓名为frank或alan的成绩 
~~~

### 7.5.not操作符

not操作符用来否定她之后的条件

``` SQL
select * from student
where id not in (1,2); # 检索学号不为1，2的学生信息
```

## 8.用通配符进行过滤

### 8.1.like操作符

#### 8.1.1.% 通配符

