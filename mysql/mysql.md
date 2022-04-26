###### DDL (data definition language)		 数据定义语言 create alter drop show

###### DML (data manipulation language)		 数据操纵语言 insert update delete select

###### DCL (data control language)    					数据库控制语言

### 基本操作

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

### 查看编码

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

### 修改编码格式

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

### 主键

**1.为字段添加primary key;**

```SQL
alter table <表名> add primary key (字段1,字段2);  
# (确定尽可能为唯一不更改的字段添加主键)如学号,id,身份证号,两个以上为组合键,本质还是一个键   -----推荐主键添加给一个字段
```

**2.删除主键**

```SQL
alter table <表名> drop primary key;
```

### 唯一键

**<字段>  <字段类型>  unique;    唯一键 表中可以有多个唯一键,可以为空。保证数据不重复**

**1.添加唯一键**

```SQL
alter table <表名> add unique (字段名);
```

**2.删除唯一键**

```SQL
alter table <表名> drop index <字段>;
```

### 外键

**foreign key (字段) references 表名(字段);**

**外键 ,前一字段是此表中的它是后一个表中的字段.(关联了) (并发设计禁用外键)**

**1.添加外键(建议创建时就添加)**

```SQL
alter table <表名> add foreign key (字段) references <主表名>(字段); 
```

**2.删除外键**

```SQL
alter table <表名> drop foreign key  "外键的别名"; # show create table <表名>  查看别名
```

### **数据库设计的完整性(创建表时)**

1. **应当有一个主键表示唯一性**
2. **选择合适的数据类型** 
3. **default 设计** 
4. **对外部表的引用**

### 置空和级联

删除数据对其他表的影响

**置空操作---数据变为NULL(外键置空数据)**  

**级联操作---删除，并删除绑定的外键(外键更新数据)**

```SQL
create table <表名>(
...
foreign key(字段) references 主表名(字段) on delete set null on update cascade);  
# 在创建字段时，使其删除时置空,更新时级联.
```
