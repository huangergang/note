# MySQL---必知必会

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

### 7.3.分组操作符

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

​	%表示任何字符出现任意次数。（0个，1个，多个）

``` SQL
select name from student
where name like "f%"; # 检索以f开头的所有姓名
```

```SQL
select name from student
where name like "%nn%";  # 按中间字符检索，两端任意字符，任意长度
```

``` SQL
select name from student
where name like "s%k";  # 按两端字符检索，中间任意字符，任意长度
```

#### 8.1.2.下划线   _  通配符

​		_ 表示单个任意字符。

``` SQL
select name from student
where name like "张_";   # 检索张姓，并且两个字组成的人名 
```

## 9.正则表达式

### 9.1.定义

​	正则表达式是用来匹配文本 的特殊的串（字符集合）。

### 9.2.MySQL正则表达式

#### 9.2.1.基本字符

```SQL
select name from student
where name regexp '伟'; # 检索名字里有‘伟’字的人名
```

#### 9.2.2.进行or匹配

```SQL
select name from student
where name regexp '伟|一|佳' ;  # 检索名字里有‘伟’或者‘一’或者‘佳’字的人名
```

#### 9.2.3.匹配几个字符之一

```SQL
select grade from sc
where grade regexp '[89]'; # 成绩里面有8有9的数据
```

```SQL
select grade from sc
where grade regexp '[^89]'; # 成绩里面没有8或9的数据
```

#### 9.2.4.配备范围

```SQL
[1-9] [6-9] [a-z]
```

#### 9.2.5.匹配特殊字符

​	为了匹配特殊字符，必须用\\\为前导。\\\\\-表示查找-， \\\\.表示查找 . 。

#### 9.2.6. 匹配字符类

|     类     |                       说明                        |
| :--------: | :-----------------------------------------------: |
| [:alnum:]  |          任意字母和数字（同[a-zA-Z0-9]）          |
| [:alpha:]  |              任意字符（同[a-zA-Z]）               |
| [:blank:]  |               空格和制表（同[\\t]）               |
| [:cntrl:]  |         ASCII控制字符（ASCII 0到31和127）         |
| [:digit:]  |                任意数字（同[0-9]）                |
| [:graph:]  |           与[:print:]相同，但不包括空格           |
| [:lower:]  |              任意小写字母（同[a-z]）              |
| [:print:]  |                  任意可打印字符                   |
| [:punct:]  |    既不在[:alnum:]又不在[:cntrl:]中的任意字符     |
| [:space:]  | 包括空格在内的任意空白字符（同[\\f\\n\\r\\t\\v]） |
| [:upper:]  |              任意大写字母（同[A-Z]）              |
| [:xdigit:] |         任意十六进制数字（同[a-fA-F0-9]）         |

```SQL
 select pwd from user
 where pwd regexp "[:alpha:]";  # 检索密码为任意字符组成
```

#### 9.2.7.匹配多个实例

| 元字符 |             说明             |
| :----: | :--------------------------: |
|   *    |        0个或多个匹配         |
|   +    |  1个或多个匹配（等于{1,}）   |
|   ？   |  0个或1个匹配（等于{0,1}）   |
|  {n}   |         指定数目匹配         |
|  {n,}  |      不少于指定数目匹配      |
| {n,m}  | 匹配数目的范围（m不超过255） |

```SQL
select pwd from user
where pwd regexp "[[:digit:]]{4}";  # 四个连起来的任意字符
```

#### 9.2.8.定位符

| 元字符  |    说明    |
| :-----: | :--------: |
|    ^    | 文本的开始 |
|    $    | 文本的结尾 |
| [[:<:]] |  词的开始  |
| [[:<:]] |  词的结尾  |

## 10.创建计算字段

### 10.2.拼接字段

​	在MySQL的SELECT语句中，可使用 Concat()函数来拼接两个列。

```SQL
select Concat(name,"(",pwd,")") from user;
```

​	使用别名（AS）

```SQL
select Concat(name,"(",pwd,")") as name_pwd from user;
```

### 10.3.算数计算

| 操作符 | 说明 |
| :----: | :--: |
|   +    |  加  |
|   -    |  减  |
|   *    |  乘  |
|   /    |  除  |

```SQL
select duration/60*money as salarys from salary  where dated like "2021-11%";  # 查询11月的日薪
```

## 11.数据处理函数

### 11.1.文本处理函数

#### 11.1.1.Upper()将文本转换为大写

```SQL
select Upper(name) from user; # 将所有字母姓名转换为大写
```

#### 11.1.2.一些函数

|    函数     |       说明        |
| :---------: | :---------------: |
|   Left()    | 返回串左边的字符  |
|  Length()   |   返回串的长度    |
|  Locate()   |     Locate()      |
|   Lower()   |  将串转换为小写   |
|   LTrim()   | 去掉串左边的空格  |
|   Right()   | 返回串右边的字符  |
|   RTrim()   | 去掉串右边的空格  |
|  Soundex()  | 返回串的SOUNDEX值 |
| SubString() |  返回子串的字符   |
|   Upper()   |  将串转换为大写   |

```SQL
select left(name,1) from user; # 返回左边第一个字符
```

​	SOUNDEX是一个将任何文 本串转换为描述其语音表示的字母数字模式的算法。SOUNDEX考虑了类似 的发音字符和音节，使得能对串进行发音比较而不是字母比较。

### 11.2.日期和时间处理函数

#### 11.2.1.常用日期和时间处理函数

|     函数      |              说明              |
| :-----------: | :----------------------------: |
|   AddDate()   |    增加一个日期（天、周等）    |
|   AddTime()   |    增加一个时间（时、分等）    |
|   CurDate()   |          返回当前日期          |
|   CurTime()   |          返回当前时间          |
|    Date()     |     返回日期时间的日期部分     |
|  DateDiff()   |        计算两个日期之差        |
|  Date_Add()   |     高度灵活的日期运算函数     |
| Date_Format() |  返回一个格式化的日期或时间串  |
|     Day()     |     返回一个日期的天数部分     |
|  DayOfWeek()  | 对于一个日期，返回对应的星期几 |
|    Hour()     |     返回一个时间的小时部分     |
|   Minute()    |     返回一个时间的分钟部分     |
|    Month()    |     返回一个日期的月份部分     |
|     Now()     |       返回当前日期和时间       |
|   Second()    |      返回一个时间的秒部分      |
|    Time()     |   返回一个日期时间的时间部分   |
|    Year()     |     返回一个日期的年份部分     |

### 11.3.数值处理函数

|  函数  |        说明        |
| :----: | :----------------: |
| Abs()  | 返回一个数的绝对值 |
| Cos()  | 返回一个角度的余弦 |
| Exp()  | 返回一个数的指数值 |
| Mod()  |  返回除操作的余数  |
|  Pi()  |     返回圆周率     |
| Rand() |   返回一个随机数   |
| Sin()  | 返回一个角度的正弦 |
| Sqrt() | 返回一个数的平方根 |
| Tan()  | 返回一个角度的正切 |

## 12.汇聚数据

### 12.1.聚合函数

|  函数   |       说明       |
| :-----: | :--------------: |
|  AVG()  | 返回某列的平均值 |
| COUNT() |  返回某列的行数  |
|  MAX()  | 返回某列的最大值 |
|  MIN()  | 返回某列的最小值 |
|  SUM()  |  返回某列值之和  |

#### 12.1.1.AVG()函数

```SQL
select avg(duration) from salary;
```

#### 12.1.2.count()函数

COUNT()函数有两种使用方式。

​	 1.使用COUNT(*)对表中行的数目进行计数，不管表列中包含的是空 值（NULL）还是非空值。 

​	2.使用COUNT(column)对特定列中具有值的行进行计数，忽略 NULL值。

#### 12.2. distinct 的使用

​	对所有的行执行计算，指定ALL参数或不给参数（因为ALL是默认 行为）.

​	 只包含不同的值，指定DISTINCT参数。

```SQL
select avg(distinct prod_price) as avg_price from products
where vend_id= 1003;
```

## 13.分组数据

### 13.1.创建分组

​	分组是在SELECT语句的GROUP BY子句中建立的。

​	具体使用GROUP BY子句前，需要知道一些重要的规定。 

​		1.GROUP BY子句可以包含任意数目的列。这使得能对分组进行嵌套， 为数据分组提供更细致的控制。 

​		2.如果在GROUP BY子句中嵌套了分组，数据将在最后规定的分组上进行汇总。换句话说，在建立分组时，指定的所有列都一起计算 （所以不能从个别的列取回数据）。

​		3.GROUP BY子句中列出的每个列都必须是检索列或有效的表达式 （但不能是聚集函数）。如果在SELECT中使用表达式，则必须在 GROUP BY子句中指定相同的表达式。不能使用别名。

​		4. 除聚集计算语句外，SELECT语句中的每个列都必须在GROUP BY子 句中给出。  如果分组列中具有NULL值，则NULL将作为一个分组返回。如果列 中有多行NULL值，它们将分为一组。

​		 5. GROUP BY子句必须出现在WHERE子句之后，ORDER BY子句之前。

### 13.2.过滤分组（HAVING）

```SQL
select id,count(*) as num from products
group by id
having num>2;   # 以id分组，显示id数量大于2的分组
```

### 13.3 select子句顺序

```SQL
select 
from 
where
group by 
having 
order by 
limit
```

## 14.子查询

### 14.1.使用

```SQL
select name from student
where id in (
select stu_id from sc
where grade > 80);
# 查询sc表中成绩大于80的学号在student表中的姓名
```

### 14.2.作为计算字段使用子查询

```SQL
select name,(select count(*) from sc where stu_id=student.id) 选课数 from student;		# 查询学生选课数  
```

## 15.联结表（join）

### 15.1.where子句链接

​	WHERE子句作为 过滤条件，它只包含那些匹配给定条件（这里是联结条件）的行。没有 WHERE子句，第一个表中的每个行将与第二个表中的每个行配对，而不管 它们逻辑上是否可以配在一起。

~~~SQL
select name,cou_id,grade from student,sc where id=stu_id;  # 查询学生姓名和他所选的课程id和成绩
~~~

#### 15.1.2.and 操作符链接多个表

```SQL
select student.name,course.name,grade
from student,course,sc 
where student.id=sc.stu_id 
	and sc.cou_id = course.id;
# 查询学生姓名和他所选的课程名和成绩
```

### 15.2.笛卡尔积

​	由没有联结条件的表关系返回 的结果为笛卡儿积。

### 15.3.内联结

```SQL
select student.name,course.name,grade
from student 
inner join sc on id=stu_id 
	  join course on cou_id=course.id;  
# 查询学生姓名和他所选的课程名和成绩
```

## 16.创建高级联结

### 16.1.使用表别名联结

```SQL
select s.name,s.name,grade 
from student as s,course as c,sc
where s.id = stu_id and c.id =
cou_id;
```

### 16.2.使用不同类型的联结

### 16.2.1.自联结

​	为同一张表创建不同的别名，然后联结

```SQL
select s1.name,s2.name
from student as s1,student as s2 
where s1.id =s2.id;
```

### 16.2.2.自然联结

## 17.组合查询

​	可用UNION操作符来组合数条SQL查询。

```SQL
select name from student 
union 
select name from teacher;
# 查询老师和学生的姓名 
```

### 17.2.2union 规则

1.UNION必须由两条或两条以上的SELECT语句组成，语句之间用关 键字UNION分隔（因此，如果组合4条SELECT语句，将要使用3个 UNION关键字）。

2.UNION中的每个查询必须包含**相同的列、表达式或聚集函数**（不过 各个列不需要以相同的次序列出）。

3.列数据类型必须兼容：**类型不必完全相同，但必须是DBMS可以 隐含地转换的类型**（例如，不同的数值类型或不同的日期类型）。

### 17.2.3. 包含或取消重复的行

```SQL
union all
```

不写all 默认取消

### 17.2.4.对组合查询结果排序

只允许使用一条order by 语句。

## 18.全文本搜索

todo

## 19.插入数据

### 19.1.数据插入

​	INSERT是用来插入（或添加）行到数据库表的。

插入可以用几种方式使用：

1. 插入完整的行； 
2.  插入行的一部分； 
3. 插入多行；
4. 插入某些查询的结果。

### 19.2.插入完整的行

```SQL
insert into <表名>(指定插入字段顺序) values(字段顺序)
```

```SQL
insert into <表名> values(默认字段顺序)
```

### 19.3.插入多行

```SQL
insert into <表名> values(1,2,3),(1,2,3)...
```

### 19.4.插入检索出的数据

```SQL
insert into <表名>(字段顺序) select (字段) from <表名> where (过滤条件);
```

## 20.更新和删除数据

### 20.1.更新数据

​	为了更新（修改）表中的数据，可使用UPDATE语句。可采用两种方 式使用UPDATE：

1.  更新表中特定行； 
2.  更新表中所有行。

```SQL
update <表名> set 字段名1 = "更改的字段值",字段名2 = "更改的字段值"... where <条件>
```

***注意：如果没有where过滤数据，表示更新每一列***

### 20.2.删除数据

​	为了从一个表中删除（去掉）数据，使用DELETE语句。可以两种方式使用DELETE：

	 1. 从表中删除特定的行； 
	 1.  从表中删除所有行。

```SQL
delete from <表名> where id = "XXX";
```

### 20.3.更新和删除的指导原则

​	下面是许多SQL程序员使用UPDATE或DELETE时所遵循的习惯:

1. 除非确实打算更新和删除每一行，否则绝对不要使用不带WHERE 子句的UPDATE或DELETE语句。 

2. 保证每个表都有主键（如果忘记这个内容，请参阅第15章），尽可能 像WHERE子句那样使用它（可以指定各主键、多个值或值的范围）。
3.   在对UPDATE或DELETE语句使用WHERE子句前，应该先用SELECT进 行测试，保证它过滤的是正确的记录，以防编写的WHERE子句不 正确

## 21.创建和操作表

### 21.1.创建表

```SQL
# 创建表(规范版)
create table if not exists teather(
	id int auto_increment primary key comment '主键id',
    name varchar(30) not null comment '老师的名字',
	phone varchar(20) comment '电话号码',
    address varchar(100) default '暂时未知' comment '住址'
    );
# id name phone address 字段
# auto_increment 自动增长
# primary key 主键 最重要的 唯一
# comment SQL内注释
```

### 21.2.操作表

```SQL
# 显示字段类型、默认值、null、、、等信息
desc <表名>;  
# 删除表，可以为不存在的表
drop table if exists <表1>，<表2>，<表3>;  
# 增加字段
alter table <表名> add <字段> <字段类型>; 
# 修改字段名和类型
alter table <表名> change <字段> <新字段> <新字段类型>; 
# 修改字段类型  可以增加删除主键，自增
alter table 表名 modify <字段> <新类型>;  
# 修改表名
alter table <表名> rename to <新表名>;   
```

