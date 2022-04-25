##### DDL data definition language 数据定义语言 create alter drop show

##### DML data manipulation language 数据操纵语言 insert update delete select

##### DCL data control language    数据库控制语言

#### 一些操作

```SQL
# 显示所有库
show databases; 
#  创建一个库
create database <库名>;
#  显示创建库时的信息
show create database <库名>;
# 删除库
drop database <库名>; 
# 更改字符编码
alter database <库名> charset=<字符编码格式>;
# 使用一个库
use <库名>;
# 显示一个库下所有表
show tables; 
```

#### 查看编码

##### 1.查看数据库编码

```SQL
show variables like "%char%";
```

##### 2.查看表编码

```SQL
show create table <表名>;
```

##### 3.查看字段编码

```SQL
show full columns from <表名>;
```

#### 修改编码格式

##### 1.修改数据库编码格式

```SQL
alter database <数据库名> character set utf8;
```

##### 2.修改表编码

```SQL
alter table <表名> character set utf8;
```

##### 3.修改字段编码

```SQL
alter table <表名> modify column <字段名> <字段类型> character set utf8;
```

